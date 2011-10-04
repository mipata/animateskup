# NOTE FOR WINDOWS 7: In order for the program to be able to copy files, the permissions need to be adjusted for the
# target folder. Just add full control to everyone for the PLUGINS folder.

# First we pull in the standard API hooks.
require 'fileutils'

# Source File
sourceFile = "table_movie.rb"

#Destination folder
destFolder = "C:\\Program Files (x86)\\Google\\Google SketchUp 8\\Plugins\\"
destFile = destFolder + sourceFile

# Print out if the file exists
print File.exists?(sourceFile),"\n"

# More debugging
print "Copying " + sourceFile + " to " + destFile + "\n"

#opens/creates
FileUtils.cp sourceFile, destFile

