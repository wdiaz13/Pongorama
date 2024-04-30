Background = {}


--LOAD
function Background:load()
   self.bgTexture = love.graphics.newImage("assets/bg.png")
end

--UPDATE
function Background:update(dt)
 
end

--DRAW
function Background:draw()
    love.graphics.draw(self.bgTexture, 0, 0)
end

