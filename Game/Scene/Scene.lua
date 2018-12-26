local Scene = {}

function Scene:create(backgroundPath)
	local self = {}
	
	self._backgroundPath = backgroundPath
	self._background = nil

	function self:load()
	  self._background = love.graphics.newImage(self._backgroundPath)
	end
	
	function self:update(dt)
	  
	end
	
	function self:draw()
		if self._background ~= nil then
			love.graphics.draw(self._background,0,0, self._background.Width, self._background.Height)
		end
	end
	
	function self:keypressed(key)
	
	end
	
	return self
end

return Scene