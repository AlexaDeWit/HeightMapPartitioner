require 'rmagick'

class Partitioner

  include Magick

  def initialize(filepath, partition_count)
    @filepath = filepath
    @partition_count = partition_count
  end

  def is_valid_settings?
    @image = ImageList.new(@filepath).first
    return false unless @image
    if @image.columns != @image.rows
      puts "Image height and width in pixels must be identical"
      return false
    end
    if (Math.log2(@image.columns) % 1) != 0
      puts "Image dimensions must be identical powers of 2"
      return false
    end
    true
  end

  def run!
  end

end
