local PopUpMenu = {}

function PopUpMenu:create(list, posX, posY, title, width)
	local self = {}
	
	self.list = {}
	self.posX = posX
	self.posY = posY
	self.currentItem = 2
	self.isVisible = isVisible
	self.width = width
	self.elapsedTime = 0
	
	--Copy list and add cancel in the end
	table.insert(self.list, "      " .. title)
	
	for i,n in ipairs(list) do 
		table.insert(self.list, n.name)
	end
	
	table.insert(self.list, "Cancel")
	
	self.numItems = table.getn(list)
	self.height = (self.numItems * 51)
	
	function self:update(dt)
		self.elapsedTime = self.elapsedTime +  (dt * 14)
		
		if self.elapsedTime >= 1  then
			if love.keyboard.isDown("down") and self.currentItem < table.getn(self.list) then
				self.currentItem = self.currentItem + 1
			elseif love.keyboard.isDown("up") and self.currentItem > 2 then
				self.currentItem = self.currentItem - 1
			end
			
			self.elapsedTime = 0
		end
	end
	
	function self:draw()
		local r, g, b, a  = love.graphics.getColor()
		
		--Sets the color for the background rectangle
		love.graphics.setColor( 100, 100, 255, 255 )
		love.graphics.rectangle( "fill", self.posX + 100, self.posY, self.width, self.height )
		
		local count = 2
		for i,n in ipairs(self.list) do 
			if i == self.currentItem then
				love.graphics.setColor( 255, 106, 0, 255 )
			else
				love.graphics.setColor( 150, 150, 255, 255 )
			end
			
			love.graphics.rectangle( "fill", self.posX + 102, self.posY + count, self.width - 4, (self.height / self.numItems) - 30)
			love.graphics.setColor( 255, 255, 255, 255 )
			
			--for the frist item writes the title
			if i == 1 then
				love.graphics.setColor( 0, 0, 0, 255 )
				love.graphics.print(n, self.posX + 103, self.posY + count + 1)
			else
				love.graphics.setColor( 255, 255, 255, 255 )
				love.graphics.print(n, self.posX + 103, self.posY + count + 1)
			end
			
			count = count + 25
		end
		
		--Reset to the previous color
		love.graphics.setColor( r, g, b, a )
	end
	
	return self
end

return PopUpMenu