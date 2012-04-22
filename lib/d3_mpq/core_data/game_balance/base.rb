module D3MPQ::CoreData::GameBalance
  class Base < BinData::Record
    endian :little

    # Padding
    skip  :length => 0x120

    string  :excel_file_name, :length => 0x100
    uint32  :identifier

    # Padding
    hide  :numbers
    array :numbers,
          :type       => :uint32,
          :read_until => lambda { element != 0 && element.offset < 0x370 }

    def data_offset
      numbers.last
    end

    uint32  :data_size

#    array :type => :uint8, :read_until => lambda { element.offset + 0x01 == data_offset + 16 }

    class << self
      def content(&block)

        array :content,
              :initial_length => lambda { data_size / struct_size + fix_struct_size },
              :adjust_offset  => lambda{ data_offset + 16 },
              &block
      end

      def struct_size
        @struct_size ||= 0
      end

      def struct_size=(value)
        @struct_size = value
      end

      def fix_struct_size
        @fix_struct_size ||= 0
      end

      def fix_struct_size=(value)
        @fix_struct_size = value
      end
    end


    def struct_size
      self.class.struct_size
    end

    def fix_struct_size
      self.class.fix_struct_size
    end
  end
end

