BaseTile = {_image = nil, _posX = 0, _posY = 0 }

function BaseTile:new (o)
	o = o or {}
  	setmetatable(o, self)
  	self.__index = self
  	return o
end

function BaseTile:load(address)
	self._image = love.graphics.newImage(address)
end

function BaseTile:setImage(image)
	self._image = image
end

function BaseTile:draw()
	if self._image ~= nil then
		love.graphics.draw(self._image,self._posX,self._posY, self._image.Width, self._image.Height)
	end
end

return BaseTile