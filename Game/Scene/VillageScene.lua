local Scene = require('Scene.Scene')
local PopUpMenu = require('Scripts.PopUpMenu')
local VillageScene = {}

function VillageScene:create(backgroundPath)
	local self = {}
	
	self._scene = Scene:create(backgroundPath)
	self._options = {}
	self._menu = nil
	--self._backgroundPath = backgroundPath
	--self._background = nil

	function self:load()
	  --self._scene._background = love.graphics.newImage(self._backgroundPath)
	  self._scene:load()
	  
	  table.insert(self._options, "Resume")
	  table.insert(self._options, "Options")
	  table.insert(self._options, "Save")
	  
	  --love.window.showMessageBox("Teste", table.getn(self._options), "error")
	  
	  --self._menu = PopUpMenu:create(self._options, 20, 20, "Adventure", "Center", "Middle", 15,2, 200)
	  
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
	
	function self:keypressed(key, main)
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
	
	return self
end

return VillageScene