module D3MPQ::CoreData::GameBalance
  class ExperienceTable < Base
    self.struct_size = 0xDC
    self.fix_struct_size = -1

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

#      array   :ui, :type => :uint32, :initial_length => 36
      uint32  :uint01
      uint32  :uint02
      uint32  :uint03
      uint32  :uint04
      uint32  :uint05
      uint32  :uint06
      uint32  :uint07
      uint32  :uint08
      uint32  :uint09
      uint32  :uint10
      uint32  :uint11
      uint32  :uint12
      uint32  :uint13
      uint32  :uint14
      uint32  :uint15
      uint32  :uint16
      uint32  :uint17
      uint32  :uint18
      uint32  :uint19
      uint32  :uint20
      uint32  :uint21
      uint32  :uint22
      uint32  :uint23
      uint32  :uint24
      uint32  :uint25
      uint32  :uint26
      uint32  :uint27
      uint32  :uint28
      uint32  :uint29
      uint32  :uint30
      uint32  :uint31
      uint32  :uint32
      uint32  :uint33
      uint32  :uint34
      uint32  :uint35
      uint32  :uint36

#      skip    :length => 144

    end

    hide  :rest
    rest  :rest
  end
end

