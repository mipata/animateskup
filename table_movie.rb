# First we pull in the standard API hooks.
require 'sketchup.rb'

# Show the Ruby Console at startup so we can
# see any programming errors we may make.
Sketchup.send_action "showRubyPanel:"
#Sketchup.send_action draw_stairs

load 'transformable_ci.rb'
class Anim
    def nextFrame( view )
        $mvbl.move( Geom::Vector3d.new(1, 0, 0) )
        Sketchup.active_model().active_view().invalidate()
        $i += 1
        return $i < 10
    end

end

# Add a menu item to launch our plugin.
UI.menu("PlugIns").add_item("Draw table MOVIE") {
  $i = 0
  $mvbl = TransformableCI.new( Sketchup.active_model().selection()[0] )
  Sketchup.active_model().active_view().animation = Anim.new()
}