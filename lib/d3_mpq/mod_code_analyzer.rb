module D3MPQ
  class ModCodeAnalyzer
    def initialize(parser, files, output = nil)
      @parser     = parser.new
      @files      = [*files]
      @output     = output || "mod_code"
    end

    def write
#      puts attributes
      s = ["ModCode"]
      attributes.each do |e|
        s << "#{e[:mod_code]}|" + e[:names].join("|")
      end

      path = File.join("analyze", @output)
      File.open("#{path}.csv", 'w') { |f| f.write(s.join("\n")) }
    end

    def attributes
      return @attributes if @attributes

      h = Hash.new { |h,k| h[k] = [] }
      mod_codes.each do |e|
        mod_code = e[:mod_code]
        h[mod_code.mod_code] << e[:name] if mod_code.mod_code != 0xFFFFFFFF
      end

      @attributes = []
      h.each do |mod_code, names|
        @attributes << { :mod_code => mod_code, :names => names }
      end
      @attributes.sort! { |x, y| y[:names].length <=> x[:names].length }

      return @attributes
    end

    # HACK: hacky implementation right here right now
    def mod_codes
      return @mod_codes if @mod_codes

      @mod_codes = []
      snapshots.each do |s|
        s.content.each.each do |i|
          i.mod_codes.each do |mod_code|
            @mod_codes << {:mod_code => mod_code, :name => i.name}
          end
        end
      end

      return @mod_codes
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

