module D3MPQ
  class MPQ < BinData::Record
    endian  :little

    class MPQHeader < BinData::Record
      endian  :little

      uint32  :magic_number
      uint32  :version_id                 # file type or version id (same for all *.gam files)
      zeroes  :length => 2
    end

    mpq_header  :mpq_header

  end
end

