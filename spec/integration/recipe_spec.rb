require 'spec_helper'

# Run IntegrationTest against MPQ
describe D3MPQ::Recipe, :integration => true do
  parser = D3MPQ::Recipe

  specify "Analyzer for D3MPQ::Recipe" do
    dir = Dir.open("spec/fixtures/Recipe/")
    exceptions = []

    dir.entries.each do |f|
      next if f == "." || f == ".."

      file      = File.join(dir, f)
      temp_file = File.new(file)
      size      = temp_file.size
      temp_file.close

      if size == 0
        warn "[EMPTY FILE]#{f}"
        next
      end

      analyzer = D3MPQ::Analyzer.new(parser, file)

      begin
        analyzer.write
      rescue Exception => e
        warn "[FAILED] #{f}\n#{e.inspect}"
        exceptions << e
      end
    end
    raise "#{exceptions.count} errors" unless exceptions.empty?
  end
end

