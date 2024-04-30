AI = {}

--LOAD
function AI:load()
    self.img = love.graphics.newImage("assets/ai.png")
    self.width = self.img:getWidth()
    self.height = self.img:getHeight()
    self.x = love.graphics.getWidth() - self.width - 50
    self.y = love.graphics.getHeight() / 2
    self.yVel = 0
    self.speed = 1500

    --beatable AI by slowing rate of aquire target call (AI mortality lol)
   -- self.timer = 0
   -- self.rate = 0.5
end

--UPDATE
function AI:update(dt)
    self:move(dt)

    -- Comment this back in for AI Mortality
    --(AI mortality)
    --self.timer = self.timer + dt
    --if self.timer > self.rate then
       -- self.timer = 0
    -- end
   
    self:aquireTarget()
end

    --move function
function AI:move(dt)
    self.y = self.y + self.yVel * dt
end
    --aquire target (to change y velocity)
function AI:aquireTarget()
    if Ball.y + Ball.height < self.y then
        self.yVel = -self.speed
    elseif Ball.y > self.y + self.height then
        self.yVel = self.speed
    else
        self.yVel = 0
    end
end


--DRAW
function AI:draw()
    love.graphics.draw(self.img, self.x, self.y)
end