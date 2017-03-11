require_relative 'src/partitioner.rb'
#Validate command line args

local_path = ARGV[0]
partition_count = ARGV[1]

if local_path && partition_count
  partitioner = Partitioner.new(local_path, partition_count)
  if partitioner.is_valid_settings?
    partitioner.run!
  else
    puts "Invalid settings supplied. Please ensure that the input image is evenly divisable by the partition count, and that the partition count is a power of two."
  end
else
  puts "Path to file or partition count was not supplied."
end
