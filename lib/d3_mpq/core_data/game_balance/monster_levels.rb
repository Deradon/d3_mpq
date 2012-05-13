module D3MPQ::CoreData::GameBalance
  class MonsterLevels < Base
    self.struct_size = 0x230

    content do
      ffs
      zeroes  :length => 4

      135.times do |i|
        float "fp_a_#{i}"
      end
    end
  end
end

