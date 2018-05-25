-----------------------------------------------------------------------------------------
--
-- scene3.lua
--
--Cretaed by Ethan Bellem
--Created on May 2018
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
local physics = require("physics")
local json = require( "json" )
local tiled = require( "com.ponywolf.ponytiled" )
 

local scene = composer.newScene()


function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
     -- start physics

    physics.start()

    physics.setGravity(0, 10)
     -- Load our map
    local filename = "assets/maps/level0.json"
    local mapData = json.decodeFile( system.pathForFile( filename, system.ResourceDirectory ) )
    map = tiled.new( mapData, "assets/maps" )



    local sheetOptionsIdle = require("assets.spritesheets.ninjaBoy.ninjaBoyIdle")
    local sheetIdleNinja = graphics.newImageSheet( "./assets/spritesheets/ninjaBoy/ninjaBoyIdle.png", sheetOptionsIdle:getSheet() )

    local sheetOptionsRun = require("assets.spritesheets.ninjaBoy.ninjaBoyRun")
    local sheetRunningNinja = graphics.newImageSheet("./assets/spritesheets/ninjaBoy/ninjaBoyRun.png", sheetOptionsIdle:getSheet() )


    local sequence_data = {

        {

        name = "idle",
        start = 1,
        count = 10,
        time = 800,
        loopCount = 0,
        sheet = sheetIdleNinja

        },
        {

        name = "run",
        count = 10,
        time = 800,
        loopCount = 1,
        sheet = sheetRunningNinja


        }

    }

    

      local ninja = display.newSprite( sheetIdleNinja, sequence_data )
        ninja.isFixedRotation = true

        ninja.x = 800

        ninja.y = 0

        ninja.id = "ninja"

        physics.addBody( ninja, "dynamic", { 

            friction = 0.5, 

            bounce = 0.3 

            } )
        ninja:setSequence( "idle" )
        ninja:play()
        
        sceneGroup:insert( map )
        sceneGroup:insert( ninja )

    --physics.setDrawMode("hybrid")
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    elseif ( phase == "did" ) then

        -- Code here runs when the scene is entirely on screen
 
    end
end
 
-- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

 

return scene