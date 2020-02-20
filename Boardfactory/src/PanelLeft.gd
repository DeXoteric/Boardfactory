extends Control


func _on_MinerButton_pressed():
	var miner = load("res://src/Miner.tscn")
	var new_miner = miner.instance()
	get_parent().add_child(new_miner)
