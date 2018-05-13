# The MIT License (MIT)
#
# Copyright (c) 2018 Ryan Hass
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.
#

# require "docopt.cr"
require "../../lib/docopt/src/docopt"
require "./config"

module Timberclaw
  class CLI
    @@exec_name : String = File.basename(::PROGRAM_NAME)
    FULL_DOC = <<-DOCOPT
    #{@@exec_name}

    Usage:
      #{@@exec_name} init
      #{@@exec_name} grab
      #{@@exec_name} --config=<file.yml>
      #{@@exec_name} -d | --debug
      #{@@exec_name} -h | --help
      #{@@exec_name} --version

    Options:
      --config=<file.yml>   Use specified config file.
      --version             Show version.
    DOCOPT

    getter opts

    def initialize(opts : Array(String))
      @opts = Docopt.docopt(FULL_DOC)
    end

    def run
      config = Timberclaw::Config.new
      config.file = opts["--config"] if @opts["--config"]

      #pp "****** Config: #{config}"

      if @opts["--version"]
        version
        exit 0
      elsif @opts["init"]
        init
      elsif @opts["grab"]
        grab
      end
    end

    private def version
      puts Timberclaw::VERSION
    end

    private def init
    end

    private def grab
    end
  end
end
