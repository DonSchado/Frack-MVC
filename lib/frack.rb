$LOAD_PATH << File.expand_path(File.dirname(__FILE__))

require 'rack'
require 'erb'
require 'tilt'

module Frack
  autoload :Application, 'frack/application'
  autoload :BaseController, 'frack/base_controller'
end
