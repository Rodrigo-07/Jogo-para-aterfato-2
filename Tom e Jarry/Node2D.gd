extends Node2D

# Sprite e Sprite2 são os elemementos que vão andar pela tela
# RichTextLabel é o texto que vai aparecer na tela
var test_value = false
var test_value1 = false

func _ready():
	pass

func _on_start_tom_pressed():
	if test_value == false:
		test_value = true

func _on_stop_tom_pressed():
	if test_value == true:
		test_value = false

func _on_start_jerry_pressed():
	if test_value1 == false:
		test_value1 = true

func _on_stop_jerry_pressed():
	if test_value1 == true:
		test_value1 = false

func _process(delta):
	# cria números aleatórios para cada variável 
	var random_number_x = rand_range(-10, 10)
	var random_number_y = rand_range(-10, 10)
	var random_number_x_1 = rand_range(-10, 10)
	var random_number_y_1 = rand_range(-10, 10) 


	# adiciona um valor aleatório a posição atual dos objetos e define essa posição como posição atual
	# clamp -> se o valor é menor que o mínimo, retorna o mínimo, se o valor é maior que o máximo, retorna o máximo. Caso contrário retorna o valor atual 
	if (test_value1 == true):
		$jerry.position.x = clamp($jerry.position.x + random_number_x_1, 0, get_viewport_rect().size.x)
		$jerry.position.y = clamp($jerry.position.y + random_number_x_1, 0,  get_viewport_rect().size.y)
	else:
		test_value1 = false
	
	if (test_value == true):
		$tom.position.x = clamp($tom.position.x + random_number_x, 0, get_viewport_rect().size.x)
		$tom.position.y = clamp($tom.position.y + random_number_y, 0, get_viewport_rect().size.y)
	else:
		test_value = false

#	print(random_number_x)
#	print(button)
	# teste das posição do objeto
#	print($Sprite.position)
#	print(random_number_x)

	# Faz com que quando os objetos estão próximos um dos outros o comando é executado (o texto aparece)
	if $tom.position.distance_to($jerry.position) < 100:
		test_value = false
		test_value1 = false
		$RichTextLabel.text = "BUUUUUUUUMMMMMM"
		$Sprite.position.x = $tom.position.x
		$Sprite.position.y = $tom.position.y
		$Sprite/AnimationPlayer.play("explosão")
		
