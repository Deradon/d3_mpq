module D3MPQ::CoreData::GameBalance
  class SetItemBonuses < Base
    self.struct_size = 0x1D0

    content do
      zeroes
      string  :name,
              :read_length  => 0x100,
              :trim_padding => true

      uint32  :parent_set_hash
      uint32  :num_of_set

      zeroes

      mod_codes :mod_codes, :initial_length => 8
    end

  end
end

