require "ostruct"
require "uri"
require "net/http"
require "json"
require "optparse"
require "ipaddr"
require "date"
require "csv"

require "colorize"
require "ruby-progressbar"

require "wikiranger/version"
require "wikiranger/util"
require "wikiranger/thread_pool"
require "wikiranger/wikipedia"
require "wikiranger/wikipedia/user_contribution"

module Wikiranger
  BANNER = "       _ _   _\n" +
           " _ _ _|_| |_|_|___ ___ ___ ___ ___ ___\n" +
           "| | | | | '_| |  _| .'|   | . | -_|  _|\n" +
           "|_____|_|_,_|_|_| |__,|_|_|_  |___|_| v#{Wikiranger::VERSION}\n" +
           "         by @michenriksen |___|\n".freeze
end
