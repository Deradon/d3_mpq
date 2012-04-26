module D3MPQ::CoreData::GameBalance
  class ExperienceTable < Base
    self.struct_size = 0xF0

    content  do
      uint32  :xp1
      uint32  :check_value => 1000

      float   # constant at 0.1
      float   :fp1

      uint32  :xp_given_1
      uint32  :xp_given_2
      uint32  :xp_given_3
      uint32  :xp_given_4
      uint32  :xp_given_5

      uint32  :ui1
      uint32  :ui2
      uint32  :ui3
      uint32  :ui4
      uint32  :ui5

      uint32  :ui1a
      uint32  :ui2a
      uint32  :ui3a
      uint32  :ui4a
      uint32  :ui5a # zero on level 2,4,6 - one otherwise

      float   :fp2

      40.times do |i|
        uint32  "u#{i}".intern
      end
    end
  end
end

