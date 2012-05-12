module D3MPQ::CSVGenerator
  class Actor < Base
    MPQ_READER = D3MPQ::CoreData::Actor

    map_to_csv [:actor_id ,
                :name,
                :image_hash_dh_male,
                :image_hash_dh_female,
                :image_hash_barb_male,
                :image_hash_barb_female,
                :image_hash_wiz_male,
                :image_hash_wiz_female,
                :image_hash_wd_male,
                :image_hash_wd_female,
                :image_hash_monk_male,
                :image_hash_monk_female]

    # HACK: to map a MPQ that do not respond_to :content
    def base_to_subjects(base, filename)
      print "."
      @lines << subject_to_csv_line(base, filename)
    end

  end
end

