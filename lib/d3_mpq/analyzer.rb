require 'fileutils'

module D3MPQ
  class Analyzer
    attr_reader :attributes

    def initialize(parser, files, fields = :content)
      @parser     = parser.new
      @files      = [*files]
      @field      = fields
#      @fields     = [*fields]
    end

    # Just write analyzed data to disc. (within /analyze)
    def write
      case parser_name
      when "d3mpq_stringlist"
        write_stringlist
      else
        write_game_balance
      end
    end

    # Writing if StringList
    def write_stringlist
      dir = File.join("analyze", "StringList")
      write_single_file(dir, @files.first.split("/").last)
    end

    # Writing if GameBalance
    def write_game_balance
      write_single_file("analyze")

      dir = File.join("analyze", parser_name)
      dir = File.join(dir, @field.to_s) if @field
      write_analyzed(dir)
    end

    # Example: d3mpq_stringlist
    def parser_name
      @parser_name ||= @parser.class.name.gsub("::", "_").downcase
    end

    # Write output to a single file. (dir/filename)
    # Using parser as filename if none is given.
    def write_single_file(dir, filename = nil)
      FileUtils.mkdir_p File.join(dir)

      # HACKY: NEED TO FIX
      keys = snapshots.first.keys
      keys = snapshots.first[@field].first.keys if @field

      s = []
      s << keys.join("|")
      snapshots.each do |snapshot|
        # HACKY: NEED TO FIX
        if @field
          snapshot[@field].each { |e| s << e.values.join("|") }
        else
          snapshot.each { |e| s << [*e].join("|") }
        end
      end

      filename ||= @parser.class.name.split("::").last
      path = File.join(dir, filename)
      File.open("#{path}.csv", 'w') { |f| f.write(s.join("\n")) }
    end

    # Writing multiple files to given dir.
    def write_analyzed(dir)
      FileUtils.mkdir_p(dir)

      attributes.each do |a, v|
        path = File.join(dir, a.to_s)
        s = "Count|Value\n" + v.map { |e| "#{e[:count]}|#{e[:value]}" }.join("\n")
        File.open("#{path}.csv", 'w') { |f| f.write(s) }
      end
    end

    # Return analyzed attributes
    def attributes
      return @attributes if @attributes

      unsorted = Hash.new { |h,k| h[k] = Hash.new(0) }
      snapshots.each do |attributes|
        attributes = attributes[@field] if @field

        attributes.each do |h|
          h.each { |attribute, value| unsorted[attribute][value] += 1 }
        end
      end

      @attributes = Hash.new { |h,k| h[k] = [] }
      unsorted.each do |name, h|
        h.each do |value, count|
          @attributes[name] << { :value => value, :count => count }
        end
        @attributes[name].sort! { |x,y| y[:count] <=> x[:count] }
      end

      return @attributes
    end



    private

    # Return snapshots of parsed files
    def snapshots
      return @snapshots if @snapshots

      @snapshots = []
      @files.each do |f|
        io = File.open(f)
        @parser.read(io)
        @snapshots << @parser.snapshot
      end

      return @snapshots
    end
  end
end

