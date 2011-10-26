# NOTE FOR WINDOWS 7: In order for the program to be able to copy files, the permissions need to be adjusted for the
# target folder. Just add full control to everyone for the PLUGINS folder.

# First we pull in the standard API hooks.
require 'fileutils'

# Source File
# copyFile("a\\table_movie.rb")

def copyfile( sourceFile, destSubFolder="" )
  #Destination folder
  destFolder = "C:\\Program Files (x86)\\Google\\Google SketchUp 8\\Plugins\\"<<destSubFolder
  destFile = destFolder + sourceFile

  # Print out if the file exists
  print File.exists?(sourceFile),"\n"

  # More debugging
  print "Copying " + sourceFile + " to " + destFile + "\n"

  #opens/creates
  FileUtils.cp sourceFile, destFile
end

copyfile("linetool.rb")
copyfile("anim.rb","a\\")