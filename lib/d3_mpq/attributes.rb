require 'nokogiri'

module D3MPQ
  class Attributes
    class Attribute < Struct.new( :id, :u2, :u3, :u4, :u5, :script_a, :script_b,
                                  :name, :encoding_type, :u10, :min, :max, :bit_count )
      def keys; self.members; end # HACK: to get the analyzer working
    end


    def initialize(path = nil)
      read(path) if path
    end

    def read(path)
      @doc = Nokogiri::XML(File.open(path))
    end

    # HACK: to get the analyzer working
    def snapshot
      {:content => content}
    end

    def content
      return @content if @content

      @content = []
      entries.each do |e|
        a = Attribute.new
        a.id            = e["Id"]
        a.u2            = e["U2"]
        a.u3            = e["U3"]
        a.u4            = e["U4"]
        a.u5            = e["U5"]
        a.script_a      = e["ScriptA"]
        a.script_b      = e["ScriptB"]
        a.name          = e["Name"]
        a.encoding_type = e["EncodingType"]
        a.u10           = e["U10"]
        a.min           = e["Min"]
        a.max           = e["Max"]
        a.bit_count     = e["BitCount"]

        @content << a
      end

      return @content
    end

    private
    def entries
      @doc.xpath("//Entry")
    end
  end
end

