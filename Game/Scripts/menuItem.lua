local MenuItem = {}

function MenuItem:create(title, behavior)
	local self = {}
	
	self.list = {}
	self.Title = title
	self.Behavior = behaviour
	
	function self:executeBehaviour()
		self.behavior()
	end
	
	return self
end

return MenuItem