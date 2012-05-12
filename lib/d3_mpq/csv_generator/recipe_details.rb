module D3MPQ::CSVGenerator
  class RecipeDetails < Base
    MPQ_READER = D3MPQ::Recipe

    map_to_csv  :mpq_id   => :mpq_id,
                :filename => Proc.new { |subject, filename| filename.split("/").last.gsub(".rcp", '') },
                :base_type_hash     => :base_type_hash,
                :num_fixed_affixes  => :num_fixed_affixes,
                :affix_hash_1       => :affix_hash_1,
                :affix_hash_2       => :affix_hash_2,
                :affix_hash_3       => :affix_hash_3,
                :num_rand_affixes   => :num_rand_affixes,
                :unknown            => :unknown

  # HACK: to map a MPQ that do not respond_to :content
  def base_to_subjects(base, filename)
    print "."
    @lines << subject_to_csv_line(base, filename)
  end

  end
end

