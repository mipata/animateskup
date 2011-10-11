# First we pull in the standard API hooks.
require 'sketchup.rb'

load 'movable_ci.rb'
class Anim
    def nextFrame( view )
        $mvbl.move_tw 1, 0, 0
        Sketchup.active_model().active_view().show_frame( 1.0/24.0 )
        keys = {
          :filename => "c:/tmp/write_image"<<$i.to_s<<".jpg",
          :width => 640,
          :height => 480,
          :antialias => false,
          :compression => 0.9,
          :transparent => true
        }
        Sketchup.active_model().active_view().write_image( keys )
        $i += 1
        return $i < 40
    end

    def stop()
        $mvbl.move( Geom::Vector3d.new(-$i, 0, 0) )
        Sketchup.active_model().active_view().invalidate()
        puts Time.now() - $start
    end
end

$i = 0
$j = 0
$start = Time.now()
$keys1 = {
    :filename => "c:/tmp/write_image0.jpg",
    :width => 640,
    :height => 480,
    :antialias => false,
    :compression => 0.9,
    :transparent => true
}
$mvbl = MovableCI.new( Sketchup.active_model().selection()[0] )
Sketchup.active_model().active_view().animation = Anim.new()