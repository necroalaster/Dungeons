local Scene = require('Scene.Scene')
local VillageScene = require('Scene.VillageScene')
local PopUpMenu = require('Scripts.PopUpMenu')

IntroScene = Scene:new()

function IntroScene:load(backgroundPath)

  _background = love.graphics.newImage(backgroundPath)
  self._options = {}
  self._menu = nil
  
  table.insert(self._options, "New Game")
  table.insert(self._options, "Load Game")
  table.insert(self._options, "Config")
  table.insert(self._options, "Exit")
  
  --love.window.showMessageBox("Teste", table.getn(self._options), "error")
  
  self._menu = PopUpMenu:create(self._options, 20, 20, "Adventure", "Center", "Middle", 15,2, 200)
  
end

function IntroScene:update(dt)
  if self._menu ~= nil then
		self._menu:update(dt)
	end
end

function IntroScene:draw()

	Scene.draw()
	
	if self._menu ~= nil then
		self._menu:draw()
	end
	
end

function IntroScene:keypressed(key)
	if self._menu ~= nil then
		if key == "return" then
	    	if self._menu.currentItem == 2 then
	    		vScene = VillageScene:new()
	    		vScene:load("Images/village.png")
	    		return vScene
	    		--love.window.showMessageBox("Teste", "teste", "error")
	    	elseif self._menu.currentItem == 5 then
	    		love.event.quit()
	    	end
		end
	end 
	
	return nil
end

return IntroScene