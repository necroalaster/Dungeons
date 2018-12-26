local currentScene = nil
local Scene = require('Scene.IntroScene')

function love.load()
  --Load save if any
  --LoadSavePoint()
  love.window.setMode(1300,700)
  love.graphics.clear(0,0,0,0)
  
  --Load introscene just for test
  currentScene = Scene:create("Images/grass.jpg")
  currentScene:load()
  
end

function love.update(dt)
  	currentScene:update(dt)
end

function love.draw(dt)
	love.graphics.clear(255,255,255,0)
	
	if currentScene ~= nil then
		currentScene:draw(dt)
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