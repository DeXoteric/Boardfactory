extends KinematicBody2D

enum MINER_TYPE {
	minerMK1,
	minerMK2,
	minerMK3
}
enum OUTPUT_TYPE {
	iron_ore,
	copper_ore,
	limestone,
	coal
}

export(MINER_TYPE) var miner_type = MINER_TYPE.minerMK1
export(OUTPUT_TYPE) var output_type = OUTPUT_TYPE.iron_ore
var power_required : float = 0.0
var output_amount : float = 0.0

var can_grab = false
var is_new = true


func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed


func _process(_delta):
	if is_new:
		position = get_global_mouse_position()
		if Input.is_mouse_button_pressed(BUTTON_LEFT):
			is_new = false
			var new_parent = get_node("/root/MainScene/IconContainer")
			get_parent().remove_child(self)
			new_parent.add_child(self)
		elif Input.is_mouse_button_pressed(BUTTON_RIGHT):
			get_parent().remove_child(self)
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position()
