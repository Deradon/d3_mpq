module D3MPQ
  class StringList < BinData::Record
    endian  :little
    hide    :header_items

    uint32  :magic_number
    uint32  :d3_file_type

    # TODO
    skip    :length => 0x20

    uint32  :file_header_size
    uint32  :header_size

    array :header_items, :initial_length => lambda{ header_size / 0x50 } do
      zeroes :length => 0x2

      array :my_dummy, :initial_length => lambda{ 4 } do
        zeroes  :length => 0x2
        uint32  :item_address
        uint32  :item_length
      end

      # TODO
      skip  :length => 0x08
    end

    # TODO
    string  :read_length => 0x08

    # Content
    array :content, :initial_length => lambda{ header_items.length } do
      string  :identifier,
              :read_length    => lambda{header_items[index][:my_dummy][0].item_length },
              :adjust_offset  => lambda{header_items[index][:my_dummy][0].item_address + 16 },
              :trim_padding   => true

      string  :name,
              :read_length    => lambda{header_items[index][:my_dummy][1].item_length },
              :adjust_offset  => lambda{header_items[index][:my_dummy][1].item_address + 16 },
              :trim_padding   => true

      string  :string3,
              :read_length    => lambda{header_items[index][:my_dummy][2].item_length },
              :adjust_offset  => lambda{header_items[index][:my_dummy][2].item_address + 16 },
              :trim_padding   => true

      string  :string4,
              :read_length    => lambda{header_items[index][:my_dummy][3].item_length },
              :adjust_offset  => lambda{header_items[index][:my_dummy][3].item_address + 16 },
              :trim_padding   => true
    end

    hide  :rest
    rest  :rest
  end
end

