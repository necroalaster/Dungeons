local currentScene = nil
local tile1 = nil
local Scene = require('Scene.IntroScene')
local Tile = require('Tiles.SceneTile')

function love.load()
  --Load save if any
  --LoadSavePoint()
  love.window.setMode(1300,700)
  love.graphics.clear(0,0,0,0)
  
  --Load introscene just for test
  currentScene = Scene:create("Images/grass.jpg")
  currentScene:load()
  
  --Test
  tile1 = Tile:new()
  tile1:load("Images/Crystal.png")
end

function love.update(dt)
  	currentScene:update(dt)
  	
  	--Test only
  	if (dt % 2) == 0 then
  		tile1:setPosition(1, 1)
  	end
end

function love.draw(dt)
	love.graphics.clear(255,255,255,0)
	
	if currentScene ~= nil then
		currentScene:draw(dt)
	end
	
	if tile1 ~= nil then
		tile1:draw()
	end
end

function love.keypressed(key) --works
   	if key == "escape" then
      	love.event.quit()
   	end
   
   	if currentScene ~= nil then
		newScene = currentScene:keypressed(key)
		
		if newScene ~= nil then
			currentScene = newScene
			currentScene:load()	
		end
	end
end