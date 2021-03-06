require 'yaml'
require 'ostruct'
require 'signnow'

module SN
  extend self

  def load_settings(filename, env)
    config = YAML.load_file(filename) || {}
    @@Settings = OpenStruct.new(config[env] || {})
  end

  def Settings
    @@Settings
  end
end