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
var grabbed_offset = Vector2()



func _input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton:
		can_grab = event.pressed
		grabbed_offset = position - get_global_mouse_position()


func _process(_delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and can_grab:
		position = get_global_mouse_position() + grabbed_offset
	
