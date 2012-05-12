module D3MPQ::CoreData::GameBalance
  class ItemEnhancements < Base
    self.struct_size = 0x2B8

    content do
      zeroes

      string  :name,
              :read_length  => 0x100,
              :trim_padding => true

      uint32  :source
      uint32  :level
      uint32  :gold_cost
      uint32  :slot

      zeroes

      mod_codes :mod_codes, :initial_length => 16

      uint32  :num_mats

      3.times do |i|
        uint32  "mats#{i}_hash"
        uint32  "mats#{i}_num"
      end

      zeroes
    end
  end
end

