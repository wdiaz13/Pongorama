require("player")
require("ball")
require("ai")
require("background")

--LOAD
function love.load()
    Player:load()
    Ball:load()
    AI:load()
    Background:load()

    Score = {player = 0, ai = 0}
end

--UPDATE
function love.update(dt)
    Player:update(dt)
    Ball:update(dt)
    AI:update(dt)
    Background:update(dt)
end

--DRAW
function love.draw()
    Background:draw()
    Player:draw()
    Ball:draw()
    AI:draw()
    love.graphics.print("Player: "..Score.player, 50, 50)
    love.graphics.print("AI: "..Score.ai, 1175, 50)

end

    --collision checker
function checkCollision(a, b)
    if a.x + a.width > b.x and a.x < b.x + b.width and a.y + a.height > b.y and a.y < b.y + b.height then
        return true
    else
        return false
    end
end