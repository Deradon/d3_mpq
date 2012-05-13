module D3MPQ::CoreData::GameBalance
  class RareNames < Base
    self.struct_size = 0x110

    content do
      zeroes
      string  :name, :length => 0x100, :trim_padding => true

      uint32  :unknown
      uint32  :stl_key_hash
      unknown
    end
  end
end

