require "./timberclaw/*"

module Timberclaw
  # TODO Put your code here
end

cli = Timberclaw::CLI.new(ARGV)
cli.run
pp "Opts: #{cli.opts}"
pp "Config: #{cli.opts["--config"].class}"