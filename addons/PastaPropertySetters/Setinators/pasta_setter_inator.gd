@tool
@icon("Icons/icon_setter_manager.png")
class_name PastaSetterInator
extends Node
## Not necessary, but the intended use is to store multiple property setter components in one tidy place;

## Emitted when apply_setter() function is called.
signal setter_applied(last_setter_node: PastaSetterComponentGroup )

## Applies a child "setter group" node.
func apply_setter(setter_name: StringName) -> void:
	var setter_node: PastaSetterComponentGroup
	for i: Node in get_children():
		if i.name == setter_name:
			setter_node = i
	if !(setter_node is PastaSetterComponentGroup):
		return
	setter_node.apply()
	setter_applied.emit(setter_node)
