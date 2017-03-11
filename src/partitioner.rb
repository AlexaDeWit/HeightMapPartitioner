require 'rmagick'
require 'fileutils'

class Partitioner

  include Magick

  def initialize(filepath, partition_count)
    @filepath = filepath
    @partition_count = Integer(partition_count)
  end

  def is_valid_settings?
    @image = ImageList.new(@filepath).first
    return false unless @image && @partition_count
    if @image.columns != @image.rows
      puts "Image height and width in pixels must be identical"
      return false
    end
    if @image.columns % 2 != 1
      puts "Image dimensions must be odd numbers."
      return false
    end
    if ((@image.columns - 1) % @partition_count) != 0
      puts "Image dimensions - 1 must be exactly divisble by the partition count"
      return false
    end
    if (Math.log2(@partition_count) % 1) != 0
      puts "Partition count must be an exact power of 2"
      return false
    end
    true
  end

  def run!
    #for safety sake
    return false unless is_valid_settings?
    create_or_load_output_directory
    #okay lets slice it.
    step_size = @image.columns / @partition_count
    chunk_size = step_size + 1
    (0..(@partition_count - 1)).each do |y|
      (0..(@partition_count - 1)).each do |x|
        subsection = @image.crop(step_size * x, step_size * y, chunk_size, chunk_size)
          subsection.format = 'png'
          full_path = "#{@output_directory}/Heightmap_x#{x}_y#{y}.png"
          subsection.write(full_path)
      end
    end
    puts "Done, look in the heightmap_partition_output directory for your new babies!"
  end

  def create_or_load_output_directory
    Dir.mkdir(File.join(Dir.pwd, "heightmap_partition_output"), 0700) unless Dir.exist?(File.join(Dir.pwd, "heightmap_partition_output"))
    @output_directory = File.join(Dir.pwd, "heightmap_partition_output")
  end

end
