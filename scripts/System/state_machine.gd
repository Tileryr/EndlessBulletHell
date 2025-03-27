class_name StateMachine
extends Node

var current_state : State
@export var default_state : State

@export var debug_label : bool
var label : Label

@onready var root : Node = get_parent()

func _ready() -> void:
	for child_state in get_children() as Array[State]:
		child_state.root = root
		child_state.change_state.connect(change_state)
	
	if debug_label:
		label = Label.new()
		get_parent().add_child.call_deferred(label)
		label.text = default_state.name
		
	change_state(default_state)
	
func _process(delta: float) -> void:
	if current_state:
		current_state.state_process(delta)

func _physics_process(delta: float) -> void:
	if current_state:
		current_state.state_physics_process(delta)
	
func _input(event: InputEvent) -> void:
	if current_state:
		current_state.state_input(event)
	
func change_state(new_state: State) -> void:
	if debug_label:
		label.text = new_state.name

	if current_state:
		current_state.state_exit()
		current_state.state_exited.emit()
	
	current_state = new_state
	
	if current_state:
		current_state.state_enter()
		current_state.state_entered.emit()

func get_state_by_class(state_class: Variant) -> State:
	for child_state in get_children() as Array[State]:
		if is_instance_of(child_state, state_class):
			return child_state

	assert(false, "State not in machine")
	return null
