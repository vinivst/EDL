function love.load()
    larguraTela = 800
    alturaTela = 600
    posxBird = 62
    larguraBird = 30
    alturaBird = 25

    playerImg = love.graphics.newImage("frame.png")
    
    tamanhoPassagem = 100
    larguraCano = 54

    function novoCanoEspacoY()
        local espacoYMinCano = 54
        local posYEspacoCano = love.math.random(
            espacoYMinCano,
            alturaTela - tamanhoPassagem - espacoYMinCano
        )
        return posYEspacoCano
    end
    
    function reset()
        posyBird = 200
        velocidadeYBird = 0

        pipe1X = larguraTela
        cano1EspacoY = novoCanoEspacoY()

        pipe2X = larguraTela + ((larguraTela + larguraCano) / 2)
        cano2EspacoY = novoCanoEspacoY()

        score = 0

        proxCano = 1
    end

    reset()
end

function love.update(dt)
    velocidadeYBird = velocidadeYBird + (516 * dt)
    posyBird = posyBird + (velocidadeYBird * dt)
    
    local function movePipe(canoX, posYEspacoCano)
        canoX = canoX - (180 * dt)

        if (canoX + larguraCano) < 0 then
            canoX = larguraTela
            posYEspacoCano = novoCanoEspacoY()
        end
        
        return canoX, posYEspacoCano
    end

    pipe1X, cano1EspacoY = movePipe(pipe1X, cano1EspacoY)
    pipe2X, cano2EspacoY = movePipe(pipe2X, cano2EspacoY)

    function collisionCheck(canoX, posYEspacoCano)
        return
        posxBird < (canoX + larguraCano)
        and
        (posxBird + larguraBird) > canoX
        and (
            posyBird < posYEspacoCano
            or
            (posyBird + alturaBird) > (posYEspacoCano + tamanhoPassagem)
        )
    end

    if collisionCheck(pipe1X, cano1EspacoY)
    or collisionCheck(pipe2X, cano2EspacoY)
    or posyBird > alturaTela then
        reset()
    end

    local function atualizaScoreEProxCano(esseCano, canoX, outroCano)
        if proxCano == esseCano
        and (posxBird > (canoX + larguraCano)) then
            score = score + 1
            proxCano = outroCano
        end
    end

    atualizaScoreEProxCano(1, pipe1X, 2)
    atualizaScoreEProxCano(2, pipe2X, 1)
end

function love.draw()
    love.graphics.setColor(35, 92, 118)
    love.graphics.rectangle('fill', 0, 0, larguraTela, alturaTela)

    love.graphics.setColor(224, 214, 68)
    love.graphics.draw(playerImg, posxBird, posyBird, 0, 10/120, 10/120, larguraBird, alturaBird)
    
    local function desenhaCano(canoX, posYEspacoCano)
        love.graphics.setColor(94, 201, 72)
        love.graphics.rectangle(
            'fill',
            canoX,
            0,
            larguraCano,
            posYEspacoCano
        )
        love.graphics.rectangle(
            'fill',
            canoX,
            posYEspacoCano + tamanhoPassagem,
            larguraCano,
            alturaTela - posYEspacoCano - tamanhoPassagem
        )
    end

    desenhaCano(pipe1X, cano1EspacoY)
    desenhaCano(pipe2X, cano2EspacoY)
    
    love.graphics.setColor(255, 255, 255)
    love.graphics.print(score, 15, 15)
end

function love.keypressed(key)
    if posyBird > 0 then
        velocidadeYBird = -165
    end
end