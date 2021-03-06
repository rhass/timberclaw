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

require "yaml"

module Timberclaw
  class Config
    getter config : YAML::Any
    setter file : String

    def initialize(@file : String = default_config_file)
      @config = load_config
    end

    def default_config_file # : String
      File.expand_path("~/.timberclaw/config.yml")
    end

    private def load_config : YAML::Any
      if File.exists?(@file) && File.readable?(@file)
        puts "Loading config file #{@file}..."
        YAML.parse(File.read(@file))
      else
        puts "Unable to load config from: #{@file}"
        exit 1
      end
    end
  end
end
