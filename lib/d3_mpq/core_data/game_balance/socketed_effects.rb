module D3MPQ::CoreData::GameBalance
  class SocketedEffects < Base
    self.struct_size = 0x588

    content do
      zeroes
      string  :name,
              :read_length  => 0x100,
              :trim_padding => true

      uint32  :item_hash        # item_socketed
      uint32  :item_type_hash   # item_type_to_socket

      zeroes
      mod_codes :mod_codes, :initial_length => 5

      string  :nls_key,
              :read_length  => 0x100,
              :trim_padding => true

      zeroes  :length => 192
    end
  end
end

