# First we pull in the standard API hooks.
require 'sketchup.rb'

load 'movable_ci.rb'
class Anim
  attr_accessor :mvbl, :animLine, :startTime, :keys, :frameNum

  def initialize(mvbl, animLine)
    @mvbl = mvbl
    @animLine = animLine
    @animLine.visible = false

    @startTime = Time.now()
    @frameNum = 0
    @keys = {
      :filename => "c:/tmp/write_image.jpg",
      :width => 640,
      :height => 480,
      :antialias => false,
      :compression => 0.9,
      :transparent => true
    }
    puts "start: ",@startTime
  end

  def nextFrame( view )
    startPoint = @animLine.start
    endPoint = @animLine.end

    distance = endPoint - startPoint
    longestPoint = getLongestPartOfVector distance

    frameVector = distance.x/longestPoint, distance.y/longestPoint, distance.z/longestPoint

    @mvbl.move_tw frameVector.x, frameVector.y, frameVector.z
    Sketchup.active_model().active_view().show_frame( 1.0/24.0 )
    keys = {
      :filename => "c:/tmp/write_image"<<@frameNum.to_s.rjust(3, '0')<<".jpg",
      :width => 640,
      :height => 480,
      :antialias => false,
      :compression => 0.9,
      :transparent => true
    }
    Sketchup.active_model().active_view().write_image( keys )
    @frameNum += 1
    return @frameNum < longestPoint
  end

  def stop()
    endTime =  Time.now()
    puts "stop: ",endTime
    puts "length: ",@startTime - endTime
  end

  def getLongestPartOfVector( vectorPath )
    xdistance = vectorPath.x
    ydistance = vectorPath.y
    zdistance = vectorPath.z

    if xdistance >= ydistance && xdistance >= zdistance
      return xdistance
    end

    if ydistance >= xdistance && ydistance >= zdistance
      return ydistance
    end

    if zdistance >= ydistance && zdistance >= xdistance
      return zdistance
    end
  end
end


