require 'csv'
require 'bigdecimal'

ROOT_PATH = File.expand_path('../../', __FILE__)
Dir[File.join(ROOT_PATH, 'app/models/*.rb')].each { |f| require f }
