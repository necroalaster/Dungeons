Scene = {_background = nil}

function Scene:new (o)
	o = o or {}
  	setmetatable(o, self)
  	self.__index = self
  	return o
end

function Scene:draw()
	if _background ~= nil then
		love.graphics.draw(_background,0,0, _background.Width, _background.Height)
	end
end

function Scene:update(dt)
end

function Scene:load(backgroundPath)
  _background = love.graphics.newImage(backgroundPath)
end

function Scene:keypressed(key)

end

return Scene