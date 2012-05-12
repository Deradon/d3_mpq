module D3MPQ::CoreData
  class Actor < D3MPQ::MPQ
    uint32  :actor_id

    unknown :length => 21

    hide    :var_data_offset, :var_data_length
    uint32  :var_data_offset, :check_value => 864
    uint32  :var_data_length
    unknown :length => 13

    string  :name, :length => 64, :trim_padding => true

    unknown :length => 143

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

    unknown :length => 10

    hide  :rest
    rest  :rest
  end
end

