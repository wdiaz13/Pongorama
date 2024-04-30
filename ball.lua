

Ball = {}

--LOAD
function Ball:load()
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight() / 2
    self.img = love.graphics.newImage("assets/ball.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.speed = 600
    self.xVel = -self.speed
    self.yVel = 0
end

--collision functions
    --ball vs Player
function Ball:collide()
    if checkCollision(self, Player) then
        self.xVel = self.speed
        local middleBall = self.y + self.height / 2
        local middlePlayer = Player.y + Player.height / 2
        local collisionPosition = middleBall - middlePlayer
        self.yVel = collisionPosition * 5
    end

    --ball vs border
    if self.y < 0 then
        self.y = 0 
        self.yVel = -self.yVel
    elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
    end

    --ball vs AI
    if checkCollision(self, AI) then
        self.xVel = -self.speed
        local middleBall = self.y + self.height / 2
        local middleAI = AI.y + AI.height / 2
        local collisionPosition = middleBall - middleAI
        self.yVel = collisionPosition * 5
    end

    if self.y < 0 then
        self.y = 0
        self.yVel = -self.yVel
     elseif self.y + self.height > love.graphics.getHeight() then
        self.y = love.graphics.getHeight() - self.height
        self.yVel = -self.yVel
     end
  
     --if Player loses (reset toward AI)
     if self.x < 0 then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVel = 0
        self.xVel = self.speed
     end
     -- if AI loses (reset toward Player)
     if self.x + self.width > love.graphics.getWidth() then
        self.x = love.graphics.getWidth() / 2 - self.width / 2
        self.y = love.graphics.getHeight() / 2 - self.height / 2
        self.yVel = 0
        self.xVel = -self.speed
     end
end


--UPDATE
function Ball:update(dt)
    self:move(dt)
    self:collide()
end
    --ball movement
function Ball:move(dt)
    self.x = self.x + self.xVel * dt
    self.y = self.y + self.yVel * dt
end

--DRAW
function Ball:draw()
    love.graphics.draw(self.img, self.x, self.y)
end