# First we pull in the standard API hooks.
require 'sketchup.rb'

# Show the Ruby Console at startup so we can
# see any programming errors we may make.
Sketchup.send_action "showRubyPanel:"
#Sketchup.send_action draw_stairs

# Add a menu item to launch our plugin.
UI.menu("PlugIns").add_item("Draw stairs MOVIE") {
  #UI.messagebox("I'm about to draw stairs!")

  #Draw the stairs
  draw_stairs
}

def draw_stairs

  stairs = 10
  rise = 8
  run = 12
  width = 100
  thickness = 3

  # Get "handles" to our model and the Entities collection it contains.
  model = Sketchup.active_model
  entities = model.entities

  prev_layer_frame = nil

  #Make layer 0 invisible

  for step in 1..stairs

    x1 = 0
    x2 = width
    y1 = run * step
    y2 = run * (step + 1)
    z = rise * step

    # Create a series of "points", each a 3-item array containing x, y, and z.
    pt1 = [x1, y1, z]
    pt2 = [x2, y1, z]
    pt3 = [x2, y2, z]
    pt4 = [x1, y2, z]

    # Call methods on the Entities collection to draw stuff.
#    if(prev_layer_frame)
      #print "Hiding ",prev_face," success? ",prev_face.hidden = true,"\n"
#      print "Hiding frame: ",prev_layer_frame,". success? ",prev_layer_frame.visible = false,"\n"
      #print "Erasing ",prev_face," success? ",prev_face.erase!,"\n"
#    end
    new_face = entities.add_face pt1, pt2, pt3, pt4
    new_face.pushpull thickness

    #Add a layer, that will be used as a frame in creating the animation
    layer_frame_name = "layer-frame-",step
    print "Adding new layer-frame: ",layer_frame_name,"\n"
    layer_frame = Sketchup.active_model.layers.add layer_frame_name.to_s
    new_face.layer = layer_frame

    prev_layer_frame = layer_frame

    #Add a page, or frame
    frame_name = "frame-",step
    print "Adding new frame: ",frame_name,"\n"
    frame = Sketchup.active_model.pages.add frame_name.to_s
    frame.use_hidden_layers = true
    frame.set_visibility layer_frame, true
    frame.set_visibility prev_layer_frame, false
    frame.set_visibility first_layer, false
    frame.update

  end
end