module D3MPQ
  class StringListEntry < BinData::Record# :nodoc:
    endian  :little

    zeroes  :length => 0x2
    uint32  :raw_string_offset
    uint32  :string_length

    def string_offset; raw_string_offset + 16; end
  end


  class StringList < MPQ
    struct :stl_header do
      uint32  :file_id
      zeroes  :length => 5
      uint32  :stl_header_size
      uint32  :entries_size
      zeroes  :length => 2
    end

    # Returns: amount of STL::Items defined
    def num_entries
      stl_header.entries_size / 0x50
    end

    hide  :stl_entries
    array :stl_entries, :initial_length => :num_entries do
      array :strings, :type => :string_list_entry, :initial_length => 4
      4.times { |i| uint32 "ui#{i}" }
    end


    array :content, :initial_length => :num_entries do
      4.times do |i|
        string  "string#{i}",
                :read_length    => lambda { stl_entries[index][:strings][i].string_length },
                :adjust_offset  => lambda { stl_entries[index][:strings][i].string_offset },
                :trim_padding   => true
      end
    end


    hide  :rest
    rest  :rest
  end
end

