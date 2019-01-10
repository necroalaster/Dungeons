BaseTile = require('Tiles.BaseTile')

SceneTile = BaseTile:new()

function SceneTile:setPosition(posX, posY)
	self._posX = self._posX + posX
	self._posY = self._posY + posY
end

return SceneTile