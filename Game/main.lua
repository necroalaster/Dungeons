

function love.load()
  
end

function love.update(dt)
  
end

function love.draw(dt)
	love.graphics.clear(0,0,0,0)
end

function love.keypressed(key) --works
   if key == "escape" then
      love.event.quit()
   end
end