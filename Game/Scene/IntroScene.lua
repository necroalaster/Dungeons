local Scene = require('Scene.Scene')
local VillageScene = require('Scene.VillageScene')
local PopUpMenu = require('Scripts.PopUpMenu')
local IntroScene = {}

function IntroScene:create(backgroundPath)
	local self = {}
	
	self._scene = Scene:create(backgroundPath)
	self._options = {}
	self._menu = nil
	--self._backgroundPath = backgroundPath
	--self._background = nil

	function self:load()
	  --self._scene._background = love.graphics.newImage(self._backgroundPath)
	  self._scene:load()
	  
	  table.insert(self._options, "New Game")
	  table.insert(self._options, "Load Game")
	  table.insert(self._options, "Config")
	  table.insert(self._options, "Exit")
	  
	  --love.window.showMessageBox("Teste", table.getn(self._options), "error")
	  
	  self._menu = PopUpMenu:create(self._options, 20, 20, "Adventure", "Center", "Middle", 15,2, 200)
	  
	end
	
	function self:update(dt)
	  if self._menu ~= nil then
			self._menu:update(dt)
		end
	end
	
	function self:draw()
	
		self._scene:draw()
		
		if self._menu ~= nil then
			self._menu:draw()
		end
		
	end
	
	function self:keypressed(key)
		if self._menu ~= nil then
			if key == "return" then
		    	if self._menu.currentItem == 2 then
		    		return VillageScene:create("Images/village.png")
		    		--love.window.showMessageBox("Teste", "teste", "error")
		    	elseif self._menu.currentItem == 4 then
		    		love.event.quit()
		    	end
			end
		end 
		
		return nil
	end
	
	return self
end

return IntroScene