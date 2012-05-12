module D3MPQ
  class Recipe < MPQ
    uint32  :mpq_id

    zeroes  :length => 2

    uint32  :base_type_hash     # hash of the item's base type
    uint32  :num_fixed_affixes  # number of fixed affixes
    uint32  :affix_hash_1       # affix hash 1
    uint32  :affix_hash_2       # affix hash 2
    uint32  :affix_hash_3       # affix hash 3
    uint32  :num_rand_affixes   # number of random affixes
    uint32  :unknown

    hide  :rest
    rest  :rest
  end
end

