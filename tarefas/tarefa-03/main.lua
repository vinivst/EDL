function love.load()
	image = love.graphics.newImage("lua.png")
end
function love.draw()
	love.graphics.draw(image, 500, 50, 0, 10/20,10/20)
	love.graphics.print("Hello World!", 300, 200)
	love.graphics.print("Aluno: Vinicius Santiago Tenente", 300, 300)
end
