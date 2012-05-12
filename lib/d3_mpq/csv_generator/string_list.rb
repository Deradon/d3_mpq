module D3MPQ::CSVGenerator
  class StringList < Base
    MPQ_READER = D3MPQ::StringList

    map_to_csv  :file_id  => Proc.new { |subject, f, base| base.stl_header.file_id },
                :filename => Proc.new { |subject, filename| filename.split("/").last.gsub(".stl", '') },
                :hash     => Proc.new { |subject| subject.string0.to_d3_hash },
                :name     => Proc.new { |subject| subject.string0 },
                :string1  => :string1,
                :string2  => :string2,
                :string3  => :string3
  end
end

