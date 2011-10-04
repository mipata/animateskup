# First we pull in the standard API hooks.
require 'sketchup.rb'

# Show the Ruby Console at startup so we can
# see any programming errors we may make.
Sketchup.send_action "showRubyPanel:"
#Sketchup.send_action draw_stairs

# Add a menu item to launch our plugin.
UI.menu("PlugIns").add_item("Draw table MOVIE") {

  movable = MovableCI.new( ComponentInstance )

  #Draw the stairs
  draw_table
}
