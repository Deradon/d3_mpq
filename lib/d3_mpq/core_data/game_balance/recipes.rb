module D3MPQ::CoreData::GameBalance
  class Recipes < Base
    self.struct_size = 0x14C

    content do
      zeroes
      string  :name, :length => 0x100, :trim_padding => true

      uint32  :rcp_id         # MPQ Id of the corresponding *.rcp file
      uint32  :type           # recipe type: 0=BS, 1=Jeweler, 2=Mystic
      uint32  :source         # recipe source: 0=Auto, 1=Plan
      uint32  :unkown
      uint32  :gold_cost      # crafting gold cost
      uint32  :level_internal # crafting level required (internal)

      6.times do |i|
        uint32  "mats#{i}_hash"
        uint32  "mats#{i}_num"
      end
    end
  end
end

