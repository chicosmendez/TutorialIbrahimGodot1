extends Node
export (PackedScene) var Malo
var Score

func _ready():
	randomize()
	
func nuevo_juego():
	Score = 0
	$Player.inicio($InicioPosicion.position)
	$InicioTimer.start()
	$Interfaz.mostrar_mensaje("Listo!")
	$Interfaz.update_score(Score)
	$Musica.play()
	

func game_over():
	$ScoreTimer.stop()
	$MaloTimer.stop()
	$Interfaz.game_over()
	$AudioMuerte.play()
	$Musica.stop()


func _on_InicioTimer_timeout():
	$MaloTimer.start()
	$ScoreTimer.start()


func _on_ScoreTimer_timeout():
	Score += 1
	$Interfaz.update_score(Score)


func _on_MaloTimer_timeout():
	$Camino/PosMalo.set_offset(randi())
	 
	var R = Malo.instance()
	add_child(R)
	
	var d = $Camino/PosMalo.rotation + PI /2
	
	R.position = $Camino/PosMalo.position
	
	d = rand_range(-PI /4, PI /4)
	R.rotation = d
	R.set_linear_velocity(Vector2(rand_range(R.velocidad_min, R.velocidad_max),0).rotated(d))
	
	
