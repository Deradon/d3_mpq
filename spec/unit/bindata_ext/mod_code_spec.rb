require 'spec_helper'

describe ModCode do
  io = File.open("spec/fixtures/CoreData/GameBalance/AffixList.gam")

  # TODO: We use Affixes as example ModCodes, change this
  parser = D3MPQ::CoreData::GameBalance::AffixList.new
  parser.read(io)

  parser.content[0,4].each do |affix|
    affix.mod_codes.each_with_index do |mod_code, index|
      next if mod_code.empty?

      describe "#{affix.name}##{index}" do
        specify { mod_code.min <= mod_code.max }
        pending "#{mod_code.stack.inspect}"
      end
    end
  end
end

