require_relative 'config/boot'

desc 'Process checkout'
task :receive_receipt, [:filename] do |task, args|
  CsvIO.write Basket.new(CsvIO.read(args[:filename]))
end
