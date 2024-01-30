@tool
@icon("Icons/icon_bone_state_component.png")
class_name PastaSetterVariant
extends PastaSetterComponent
## Can apply and record any property on a given node;

## The monitored and modified node.
@export var target_node: Node

## Number of saved set values.
@export var set_count: int = 1:
	set(new_value):
		set_count = max(1,new_value)
		_resize_value_arrays()

## Selected set value.
@export var current_set: int:
	set(new_value):
		current_set = clampi(new_value,0,set_count-1)

## The monitored and modified property.
@export var target_property: StringName

## The recorded value of the monitored and modified property.
@export var value: Array[Variant]

## When called, will set the chosen property on the target node to the recorded value.
func apply()->void:
	if !target_node:
		return
	
	if !(target_property in target_node):
		return
	
	target_node.set(target_property,value[current_set])


## When called, will record the chosen property from the target node.
func record()->void:
	if !target_node:
		return
	
	if !(target_property in target_node):
		return
	
	value[current_set] = target_node.get(target_property)


func _resize_value_arrays() -> void:
	value.resize(set_count)
