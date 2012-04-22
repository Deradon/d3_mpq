module D3MPQ::CoreData::GameBalance
  class MonsterNames < Base
    self.struct_size = 0x188

    content do
      zeroes
      string  :name,
              :read_length  => 0x100,
              :trim_padding => true

      uint32  :is_suffix

      string  :name2,
              :read_length  => 0x80,
              :trim_padding => true

    end

    hide  :rest
    rest  :rest
  end
end

