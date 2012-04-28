module D3MPQ::CoreData::GameBalance
  class SocketedEffects < Base
    self.struct_size = 0x588

    content do
      zeroes
      string  :name,
              :read_length  => 0x100,
              :trim_padding => true

      uint32  :ref1
      uint32  :ref2

      zeroes
      uint32  :ui1
      uint32  :ui1b
      zeroes  :length => 2
      uint32  :ui2
      uint32  :ui3
      uint32  :ui3b
      uint32  :ui3c
      zeroes  :length => 2
      uint32  :ui4
      uint32  :ui4b
      ffs     :length => 2
      zeroes  :length => 2
      uint32  :ui5
      zeroes

      # TODO
      skip    :length => 48


      string  :name2,
              :read_length  => 0x100,
              :trim_padding => true

      zeroes  :length => 192
    end
  end
end
