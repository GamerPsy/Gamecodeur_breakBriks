pad = { x = 0, y = 0, hauteur = 20, largeur = 80}
balle = { x = 0, y =0, rayon = 10, touchePad = true, vitesse_x = 2, vitesse_y = 2 }

function resetGame()
    pad.x = largeurEcran/2 - pad.largeur/2
    pad.y = hauteurEcran - 20
    balle.touchePad = true
    balle.x = pad.x + (pad.largeur/2)
    balle.y = hauteurEcran - pad.hauteur - balle.rayon
end

function love.load()
    largeurEcran = love.graphics.getWidth()
    hauteurEcran = love.graphics.getHeight()
    resetGame()
end

function love.update()
    pad.x = love.mouse.getX()
    if balle.touchePad == false then
        balle.x = balle.x + balle.vitesse_x
        balle.y = balle.y - balle.vitesse_y

        if balle.x <= 0 then
            balle.vitesse_x = -balle.vitesse_x
            balle.x = 0 + balle.rayon
        end
        if balle.x >= largeurEcran - balle.rayon then
            balle.vitesse_x = -balle.vitesse_x
            balle.x = largeurEcran - balle.rayon
        end
        if balle.y - balle.rayon <= 0 then
            balle.vitesse_y = -balle.vitesse_y
            balle.y = 0 + balle.rayon
        end
        if balle.y >= hauteurEcran - balle.rayon*2 then
            resetGame()
        end
    else
        balle.x = pad.x + (pad.largeur/2)
        balle.y = hauteurEcran - pad.hauteur - balle.rayon
    end
end

function love.draw()
    love.graphics.rectangle("fill", pad.x, pad.y, pad.largeur, pad.hauteur)
    love.graphics.circle("fill", balle.x, balle.y, balle.rayon)
end

function love.mousepressed(x, y, z)
    if balle.touchePad==true then
        balle.touchePad = false
    end
end