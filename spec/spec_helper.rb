require 'd3_mpq'

# Don't run broken specs
RSpec.configure do |c|
  c.filter_run_excluding :broken      => true
  c.filter_run_excluding :integration => true
end

