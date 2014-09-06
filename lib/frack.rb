$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__))

require 'rack'
require 'erb'
require 'tilt'

module Frack
  autoload :Router, 'frack/router'
  autoload :Application, 'frack/application'
  autoload :BaseController, 'frack/base_controller'
end
