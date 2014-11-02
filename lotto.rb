require 'optparse'
require 'mkmf'

options = {}
OptionParser.new do |opts|
    opts.banner = "Usage: lotto.rb [options]"

    options[:count] = 3
    opts.on('-c', '--count COUNT', 'Count') { |v| options[:count] = v }
end.parse!

shuf = find_executable('shuf') || find_executable('gshuf')
abort("You do not have shuf or gshuf on your PATH. To fix, install coreutils.") if shuf.nil?
puts `gem list --no-versions --remote --all | #{shuf} -n #{options[:count]}`
