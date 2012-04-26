module D3MPQ::CoreData::GameBalance
  class Base < BinData::Record
    endian :little

    # MPQ - Header
    uint32  :check_value => 0xDEADBEEF  # MPQ file magic number
    uint32  :version_id                 # file type or version id (same for all *.gam files)
    zeroes  :length => 2

    # GAM - Header
    uint32  :file_id
    zeroes  :length => 2
    uint32  :record_index               # record index for data offsets
    string  :length => 0x100, :trim_padding => true, :check_value => "0000.gbi"

    string  :excel_file_name, :length => 0x100
    uint32  :identifier

    hide  :data_array_entries
    array :data_array_entries,
          :type       => :uint32,
          :read_until => lambda { element != 0}

    # data start offset (relative to the starts of the GamHeader
    def data_offset
      data_array_entries.last
    end

    # data size (number of bytes); does not include variable data
    uint32  :data_num_bytes

    # Padding

    class << self
      # Main method to use
      def content(&block)
        array :content,
              :initial_length => lambda { data_num_bytes / struct_size + fix_struct_size },
              :adjust_offset  => lambda { data_offset + 16 },
              &block


        count_bytes_remaining :bytes_remaining
        hide  :variable_content
        array :variable_content, :initial_length => lambda { bytes_remaining / 4 } do
          string :length => 4
        end

        hide  :rest
        rest  :rest
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

