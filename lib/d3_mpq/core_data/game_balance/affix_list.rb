module D3MPQ::CoreData::GameBalance
  class AffixList < Base
    self.struct_size = 0x290

    content do
      zeroes

      string  :name,
              :read_length  => 0x100,
              :trim_padding => true

      uint32  :u00
      uint32  :u01

      uint32  :alvl
      uint32  :sup_mask #ilvl_max (up to this ItemLevel the Affix might be drawn)
      uint32  :u02
      uint32  :u03
      uint32  :u04
      uint32  :u05
      uint32  :param1
      uint32  :param2
      uint32  :rare_name_prefix_id
      uint32  :rare_name_suffix_id
      uint32  :group_hash
      uint32  :group_hash2
      uint32  :class_id
      uint32  :resource_type_hash
      uint32  :u06

      ffs :length => 5

      # Rares/Magics of these ItemTypes can obtain the Affix.
      # (e.g.: Rare-Boots with FasterRun)
      16.times do |i|
        uint32 "igh#{i}".intern
      end

      # Legendaries/Sets from these ItemTypes may have the Affix.
      # (e.g.: Set-Boots with FasterRun)
      16.times do |i|
        uint32 "igh_extended#{i}".intern
      end

      uint32  :quality_mask
      uint32  :socket_mask
      uint32  :primary_group_hash

      mod_codes :mod_codes, :initial_length => 4
#      4.times { |i| mod_code "mod_code_#{i}" }

      zeroes  :length => 18
    end
  end
end

