module D3MPQ::CSVGenerator
  class Base
    attr_reader :files

    SEPERATOR = ";"
    LINE_SEPERATOR = "\n"

    def initialize(options = {})
      raise "Abstract" if self.class.name == "D3MPQ::CSVGenerator::Base"

      if options.is_a?(Hash)
        add_file(options[:files])
        @output_path   = options[:output_path]
      else
        add_file(options)
      end

      k = self.class.name.split("::").last.downcase
      @output_path  ||= "analyze/#{k}.csv"
    end

    # ClassMethods
    class << self
      # TODO: refactor
      def map_to_csv(options = nil)
        if options
          if options.is_a?(Array)
            @map_to_csv = {}
            options.each do |e|
              if e.is_a?(String) || e.is_a?(Symbol)
                @map_to_csv[e.intern] = e.intern
              else
                @map_to_csv[e.to_a[0].intern] = e.to_a[1]
              end
            end
          elsif options.is_a?(Hash)
            @map_to_csv = options
          else
            raise "Options must be an Array or Hash."
          end
        else
          @map_to_csv
        end
      end
    end

    def map_to_csv
      self.class.map_to_csv
    end

    # Alias for add_file
    def files=(f)
      add_file(f)
    end

    # Add files
    def add_file(f)
      @files ||= []

      if f.respond_to?(:entries)
        f.each { |e| add_file(e) }
      else
        f = f.to_s
        if File.directory?(f) && !is_back_dir(f)
          entries = Dir.entries(f).delete_if { |e| is_back_dir(e) }
          entries.each { |e| add_file( File.join(f, e) ) }
        else

          unless f.empty? || is_back_dir(f)
            temp_file = File.new(f)
            size = temp_file.size
            temp_file.close
            @files << f unless size == 0
          end

        end
      end

      return @files
    end

    # Write
    def write
      @lines = []
      @lines << csv_keys

      file_snapshots.each do |filename, snapshots|
        snapshots.each { |base| base_to_subjects(base, filename) }
      end

      File.open(@output_path, 'w') { |f| f.write(@lines.join(LINE_SEPERATOR)) }
    end

    def base_to_subjects(base, filename)
      base.content.each_with_index do |subject, index|
        print "."
        @lines << subject_to_csv_line(subject, filename, base, index)
      end
    end

    def csv_keys
      map_to_csv.keys.join(SEPERATOR)
    end


    def subject_to_csv_line(subject, filename, base = nil, index = nil)
      line = []

      if map_to_csv
        map_to_csv.each do |col, opt|
          if opt.is_a?(Proc)
            entry = opt.call(subject, filename, base, index)
          else
            entry = subject.send(opt)
          end

          if entry.is_a?(String)
            entry.gsub!('"', '\"')
            entry = "\"#{entry}\""
          end
          entry = entry.to_s.encode!('UTF-8', 'UTF-8', :invalid => :replace)

          # HACK
          entry.chop! if entry.end_with?("\x00")

          line << entry
        end
      else
        raise "TODO"
      end

      return line.join(SEPERATOR)
    end

    # Return snapshots of parsed files
    def file_snapshots
      @file_snapshots = Hash.new { |h, k| h[k] = [] }

      files.each do |f|
        io = File.open(f)

        begin
          @mpq_reader = self.class::MPQ_READER.new
          @mpq_reader.read(io)
          @file_snapshots[f] << @mpq_reader
          print "."
        rescue EOFError => e
          puts "#{e.inspect}\n#{f}"
        end
      end

      return @file_snapshots
    end

    # HACK
    def is_back_dir(dir)
      dir.end_with?(".") || dir.end_with?("..")
    end

  end
end

