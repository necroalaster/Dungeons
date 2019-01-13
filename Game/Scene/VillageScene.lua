local Scene = require('Scene.Scene')
local PopUpMenu = require('Scripts.PopUpMenu')
VillageScene = Scene:new()

function VillageScene:load(backgroundPath)
	
	_background = love.graphics.newImage(backgroundPath)
	self._options = {}
	self._menu = nil
	
	table.insert(self._options, "Resume")
  	table.insert(self._options, "Options")
 	table.insert(self._options, "Save")
	
end

function VillageScene:keypressed(key, main)
	if self._menu ~= nil then
		if key == "return" then
			if self._menu.currentItem == 2 then --RESUME
				self._menu = nil
			end
		end
	elseif key == "p" then
		self._menu = PopUpMenu:create(self._options, 20, 20, "PAUSED", "Center", "Middle", 15,2, 200)
	end
end

function VillageScene:update(dt)
  if self._menu ~= nil then
		self._menu:update(dt)
	end
end

function VillageScene:draw()

	Scene.draw()
	
	if self._menu ~= nil then
		self._menu:draw()
	end
	
end

return VillageScene