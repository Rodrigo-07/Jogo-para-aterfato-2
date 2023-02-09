extends Node2D

var rngx1 = randi()
var rngy1 = randi()
var rngx2 = randi()
var rngy2 = randi()
# Sprite e Sprite2 são os elemementos que vão andar pela tela
# RichTextLabel é o texto que vai aparecer na tela

# cria números aleatórios para cada variável 

var random_number_x = rngx1
var random_number_y = rngy1
var random_number_x_1 = rngx2
var random_number_y_1 = rngy2

func _process(delta):
	pass
func _ready():
	set_process(false)
	print($Sprite.position)
	

func _on_Button_pressed():
	set_process(true)
		# adiciona um valor aleatório a posição atual dos objetos e define essa posição como posição atual
	# clamp -> se o valor é menor que o mínimo, retorna o mínimo, se o valor é maior que o máximo, retorna o máximo. Caso contrário retorna o valor atual 
	$Sprite.position.x = clamp($Sprite.position.x + random_number_x, 0, get_viewport_rect().size.x)
	$Sprite.position.y = clamp($Sprite.position.y + random_number_y, 0, get_viewport_rect().size.y)
	
	
	$Sprite2.position.x = clamp($Sprite2.position.x + random_number_x_1, 0, get_viewport_rect().size.x)
	$Sprite2.position.y = clamp($Sprite2.position.y + random_number_x_1, 0,  get_viewport_rect().size.y)
		# Faz com que quando os objetos estão próximos um dos outros o comando é executado (o texto aparece)

func _on_Button2_pressed():
		if $Sprite.position.distance_to($Sprite2.position) < 50:
			$RichTextLabel.text = "BUUUMM"
			set_process(false)
