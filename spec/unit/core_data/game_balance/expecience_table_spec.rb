require 'spec_helper'

describe D3MPQ::CoreData::GameBalance::ExperienceTable do
  let(:io) { File.open("spec/fixtures/CoreData/GameBalance/ExperienceTable.gam") }

  before(:all) do
#    subject.read(io)

    begin
      BinData::trace_reading { subject.read(io) }
    rescue Exception => e
      subject.snapshot.content[0,100].each_with_index do |e, i|
        puts e
#        puts "#{i} | #{e["ui5a"]}"
      end
      raise e
    end
  end

  its(:rest) { should == "" }
end

