extends Node2D


func _ready():
	var miner = load("res://src/Miner.tscn")
	var new_miner = miner.instance()
	new_miner.position = Vector2(50,50)
	add_child(new_miner)
	
