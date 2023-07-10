-- Débogueur Visual Studio Code tomblind.local-lua-debugger-vscode
if pcall(require, "lldebugger") then
    require("lldebugger").start()
end

-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf("no")

local tankImg = love.graphics.newImage("img/tank.png")

local tank = {}
tank.x = 100
tank.y = 100
tank.angle = 0
tank.movespeed = 100

function love.load()
end

function love.update(dt)
    if love.keyboard.isDown("left") then
        tank.angle = tank.angle - 2 * dt
    elseif love.keyboard.isDown("right") then
        tank.angle = tank.angle + 2 * dt
    end
    if love.keyboard.isDown("up") then
        tank.x = tank.x + (tank.movespeed * math.cos(tank.angle)) * dt
        tank.y = tank.y + (tank.movespeed * math.sin(tank.angle)) * dt
    elseif love.keyboard.isDown("down") then
        tank.x = tank.x - (tank.movespeed * math.cos(tank.angle)) * dt
        tank.y = tank.y - (tank.movespeed * math.sin(tank.angle)) * dt
    end
end

function AfficheCentree(img, objet, angle)
    love.graphics.draw(img, objet.x, objet.y, angle, 1, 1, img:getWidth() / 2, img:getHeight() / 2)
end

function love.draw()
    AfficheCentree(tankImg, tank, tank.angle)
end

function love.keypressed(key)
    if key == "space" then
    end
end
