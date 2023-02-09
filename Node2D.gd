extends Node2D

var rng = RandomNumberGenerator.new()
var stop = Vector2()
# Sprite e Sprite2 são os elemementos que vão andar pela tela
# RichTextLabel é o texto que vai aparecer na tela

func _ready():
	pass

func _process(delta):
	# cria números aleatórios para cada variável 
	rng.randomize()
	var random_number_x = rng.randf_range(-10, 10)
	var random_number_y = rng.randf_range(-10, 10)
	var random_number_x_1 = rng.randf_range(-10, 10)
	var random_number_y_1 = rng.randf_range(-10, 10)
	
	# adiciona um valor aleatório a posição atual dos objetos e define essa posição como posição atual
	# clamp -> se o valor é menor que o mínimo, retorna o mínimo, se o valor é maior que o máximo, retorna o máximo. Caso contrário retorna o valor atual 
	$Sprite.position.x = clamp($Sprite.position.x + random_number_x, 0, get_viewport_rect().size.x)
	$Sprite.position.y = clamp($Sprite.position.y + random_number_y, 0, get_viewport_rect().size.y)
	$Sprite2.position.x = clamp($Sprite2.position.x + random_number_x_1, 0, get_viewport_rect().size.x)
	$Sprite2.position.y = clamp($Sprite2.position.y + random_number_x_1, 0,  get_viewport_rect().size.y)
	
	# teste das posição do objeto
	print($Sprite.position)
	
	# Faz com que quando os objetos estão próximos um dos outros o comando é executado (o texto aparece)
	if $Sprite.position.distance_to($Sprite2.position) < 50:
		$RichTextLabel.text = "BUUUMM"
		set_process(false)
