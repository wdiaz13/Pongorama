

Player = {}

--LOAD
function Player:load()
    self.x = 50
    self.y = love.graphics.getHeight() / 2
    self.img = love.graphics.newImage("assets/player.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 1000
end

--UPDATE
function Player:update(dt)
    -- call move function
    self:move(dt)
    -- call border constraints function
    self:checkBoundaries()
end

    -- up / down controls (move function)
function Player:move(dt)
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * dt
    elseif love.keyboard.isDown("s") then
        self.y  = self.y + self.speed * dt
    end
end

    -- border constraints function
function Player:checkBoundaries()
    if self.y < 0 then
        self.y = 0
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
    end
end

--DRAW
function Player:draw()
    love.graphics.draw(self.img, self.x, self.y)
end