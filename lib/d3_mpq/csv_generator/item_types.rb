module D3MPQ::CSVGenerator
  class ItemTypes < Base
    MPQ_READER = D3MPQ::CoreData::GameBalance::ItemTypes

    map_to_csv  :name => :name,
                :hash => Proc.new { |subject| subject.name.to_d3_hash },
                :parent_hash => :parent_hash,
                :class_mask  => Proc.new { |subject| subject.class_mask.class_mask },
                :slot1 => :item_slot_1,
                :slot2 => :item_slot_2,
                :slot3 => :item_slot_3,
                :slot4 => :item_slot_4,
                :affix_group_hash => :affix_group_hash,
                :use_bar => Proc.new { |subject| subject.class_mask.use_bar },
                :use_dh  => Proc.new { |subject| subject.class_mask.use_dh },
                :use_mon => Proc.new { |subject| subject.class_mask.use_mon },
                :use_wiz => Proc.new { |subject| subject.class_mask.use_wiz },
                :use_wd  => Proc.new { |subject| subject.class_mask.use_wd },
                :bitmask1 => :bitmask1,
                :bitmask2 => :bitmask2,
                :bitmask3 => :bitmask3,
                :bitmask4 => :bitmask4
  end
end

