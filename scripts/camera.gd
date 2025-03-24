extends Camera2D

var shake_amount : float
var shake_decay : float = 0.4
func _ready() -> void:
	GlobalSignals.shake.connect(func(amount: float):
		shake_amount = amount
		set_process(true)
	)
	
func _process(delta: float) -> void:
	shake_amount -= shake_decay
	if shake_amount < 0: 
		set_process(false)
		offset = Vector2.ZERO
	offset = generate_offset(shake_amount)
	
func generate_offset(max: int) -> Vector2:
	return Vector2(randf() * max, randf() * max)
