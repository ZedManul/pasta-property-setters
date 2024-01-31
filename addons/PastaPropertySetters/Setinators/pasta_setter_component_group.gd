@tool
@icon("Icons/icon_setter_group.png")
class_name PastaSetterComponentGroup
extends PastaSetterComponent
## Applies or records all child property set components at once.

## Number of saved set values.
@export var set_count: int = 1:
	set(new_value):
		set_count = max(1,new_value)
		_update_child_state_count()

## Selected set value.
@export var current_set: int:
	set(new_value):
		current_set = clampi(new_value,0,set_count-1)
		_update_child_current_state()


func _ready() -> void:
	child_order_changed.connect(_on_children_changed)


## Applies child set components
func apply() -> void:
	super()
	for i: Node in get_children():
		if i is PastaSetterComponent:
			i.apply()


## Records child set components
func record() -> void:
	super()
	for i: Node in get_children():
		if i is PastaSetterComponent:
			i.record()


func _update_child_current_state() -> void:
	for i: Node in get_children():
		if i is PastaSetterComponent:
			i.current_set = current_set


func _update_child_state_count() -> void:
	for i: Node in get_children():
		if i is PastaSetterComponent:
			i.set_count = set_count

func _on_children_changed():
	_update_child_state_count()
	_update_child_current_state()
