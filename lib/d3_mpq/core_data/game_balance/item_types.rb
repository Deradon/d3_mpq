module D3MPQ::CoreData::GameBalance
  class ItemTypes < Base
    self.struct_size = 0x140

    content do
      zeroes

      # Name
      string  :name,
              :length => 0x100,
              :trim_padding => true

      # Identifier
      uint32  :id
      zeroes
      uint32  :u0
      uint32  :u1
      uint32  :u2
      uint32  :u3
      uint32  :u4
      uint32  :u5
      ffs     :length => 0x2
      uint32  :u6

      # ItemType
      uint32 :type
      uint32 :u7
      uint32 :u8
      uint32 :u9
    end

    hide  :rest
    rest  :rest
  end
end

