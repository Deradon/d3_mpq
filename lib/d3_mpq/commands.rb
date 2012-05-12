require 'd3_mpq'
require 'optparse'

# This hash will hold all of the options
# parsed from the command-line by OptionParser.
options = {}

optparse = OptionParser.new do|opts|
  # Set a banner, displayed at the top of the help screen.
  opts.banner = "Usage: d3_mpq [options] <COMMAND>"

  # Define the options, and what they do
  opts.on( '-d', '--debug', 'View debug messages' ) do
    options[:debug] = true
  end

  options[:mpq_path] = File.join("mpqs")
  opts.on('--mpq_path PATH', 'Path to your mpq directory. (Default: mpqs/)' ) do |path|
    options[:mpq_path] = path
  end

  options[:extract_path] = File.join("extracted_mpqs")
  opts.on('--extract_path PATH', 'Path where to extract mpqs. (Default: extracted_mpqs/)' ) do |path|
    options[:extract_path] = path
  end

  opts.on('--locale STRING', 'Current locale.' ) do |l|
    options[:locale] = l
  end

  options[:patch] = ""
  opts.on('--patch STRING', 'Current patch. (Default: empty string)' ) do |p|
    options[:patch] = p
  end

  options[:csv_path] = "csv"
  opts.on('--csv PATH', 'Path where to save CSV. (Default: csv/)' ) do |c|
    options[:csv_path] = c
  end

  opts.on('--csv-name STRING', 'Filename of generated csv. (Optional)' ) do |name|
    options[:csv_name] = name
  end

  options[:csv_input] = nil
  opts.on('--csv-input PATH or FILE', 'Path or File for CSV input.' ) do |i|
    options[:csv_input] = i
  end

  # This displays the help screen, all programs are assumed to have this option.
  opts.on( '-h', '--help', 'Display this screen' ) do
    puts opts
    exit
  end
end

# Parse the command-line. Remember there are two forms
# of the parse method. The 'parse' method simply parses
# ARGV, while the 'parse!' method parses ARGV and removes
# any options found there, as well as any parameters for
# the options. What's left is the list of files to resize.
optparse.parse!

cmd = ARGV.shift || ""
case cmd.downcase
when "extract"
  options[:mpq] = ARGV.shift
  require 'd3_mpq/commands/extract'
  if options[:mpq]
    D3MPQ::Command::Extract.new(options)
  else
    D3MPQ::Command::Extract.all
  end
when "csv"
  options[:klass] = ARGV.shift
  if options[:klass]
    require 'd3_mpq/commands/csv'
    D3MPQ::Command::CSV.new(options)
  else
    puts <<-MESSAGE
You need to provide the GeneratorClass:
Example: d3_mpq --csv-input extracted_mpqs/StringList/ csv StringList

* Actor
* AffixList
* Items
* ItemTypes
* Recipes
* RecipeDetails
* StringList

MESSAGE
  end
else
  puts <<-MESSAGE
Command not found. Try: d3_mpq --help

or

* extract <mpq_name> (Example: "d3_mpq extract CoreData")
* csv (TODO)
MESSAGE
end

