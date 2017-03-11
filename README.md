#Usage instructions to follow:

For use with Unreal Engine 4 generated Heightmaps, pngs mainly, since I don't think ImageMagick handles r16 files.

- ruby app.rb Filename PartitionCount
- PartitionCount is just the number of pieces to split it into. 
###Example used by me for the largest UE4 Landscape 
- ruby app.rb Heightmap.png 16
- generates a 16 * 16 grid of heightmaps, with a 1 pixel overlap.

##Depends on an operating system installation of ImageMagick
Also of course depends on typical ruby dependencies for installation.

###On debian/ubuntu systems:
- sudo apt-get install imagemagick
- sudo apt-get install libmagickwand-dev

###For Windows 10:
Just use the ubuntu for windows 10 feature, seriously.
[Guide: How to install it. External link on howtogeek.](https://www.howtogeek.com/249966/how-to-install-and-use-the-linux-bash-shell-on-windows-10/)

###For OSX:
Feedback would be kind, but here is what I could find.
[Stackexchange on the topic of RMagick deps. External link on stackoverflow.](http://stackoverflow.com/questions/13963404/rails-and-os-x-how-to-install-rmagick)

###For older windows versions:
You're on your own here
