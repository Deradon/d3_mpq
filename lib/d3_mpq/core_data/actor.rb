module D3MPQ::CoreData
  class Actor < BinData::Record
    endian :little

    hide    :mpg_id
    uint32  :mpg_id

    uint32  :check_value => 267
    zeroes  :length => 2

    uint32  :actor_id#0x014	DWord appMpqId;	// The MPQ Id of the corresponding Appearance file

    unknown :length => 21#0x018	DWord unknown2[16];	// ???

    hide    :var_data_offset, :var_data_length
    uint32  :var_data_offset, :check_value => 864
    uint32  :var_data_length
    unknown :length => 13#0x060	DWord unknown3[13];	// ???

    string  :name, :length => 64, :trim_padding => true#0x094	char string[64];	// string

    unknown :length => 133#0x0D4	DWord unknown4[143];	// ???

#    zeroes
    uint32  :image_hash_before
    uint32  :image_hash_dh_male
    uint32  :image_hash_dh_female
    uint32  :image_hash_barb_male
    uint32  :image_hash_barb_female
    uint32  :image_hash_wiz_male
    uint32  :image_hash_wiz_female
    uint32  :image_hash_wd_male
    uint32  :image_hash_wd_female
    uint32  :image_hash_monk_male
    uint32  :image_hash_monk_female
    uint32  :image_hash_after

    unknown :length => 17# 0x338	DWord unknown4[10];	// could be related to class/gender?

#    array :var_data,
#          :initial_length => lambda { var_data_length / 4 },
#          :adjust_offset  => lambda { var_data_offset + 16 }  do
#      uint32
#    end

#    hide   :var_data
#    string :var_data, :length => lambda { var_data_length / 4 },
#                      :adjust_offset  => lambda { var_data_offset + 16 }

    hide  :rest
    rest  :rest

  end
end

