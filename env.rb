require 'yaml'
require 'groonga'

CONFIG = YAML.load_file(File.expand_path('../config.yml', __FILE__))

$LOAD_PATH.unshift(File.expand_path('../', __FILE__))
require 'db'
require 'indexer'
require 'gist'
