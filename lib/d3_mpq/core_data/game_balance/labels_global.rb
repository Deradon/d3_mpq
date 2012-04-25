module D3MPQ::CoreData::GameBalance
  class LabelsGlobal < Base
    self.struct_size = 0x108

    content do
      zeroes
      string  :name,
              :read_length  => 0x100,
              :trim_padding => true

      uint32  :ui1
    end
  end
end

