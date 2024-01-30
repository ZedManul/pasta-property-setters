@tool
@icon("Icons/icon_bone_state_component.png")
class_name PastaSetterAnimatedSprite
extends PastaSetterComponent
## Can apply and record certain important properties of an AnimatedSprite2D node.

## The monitored and modified node.
@export var target_node: AnimatedSprite2D

## Number of saved setter values.
@export var set_count: int = 1:
	set(new_value):
		set_count = max(1,new_value)
		_resize_value_arrays()

## Selected setter value.
@export var current_set: int:
	set(new_value):
		current_set = clampi(new_value,0,set_count-1)

@export_group("Sprite Frames")
## If true, the node will set or record this property when calling apply() or record() 
@export var modify_spriteframes: bool = false
## The recorded value.
@export var spriteframe_value: Array[SpriteFrames]:
	set(new_value):
		spriteframe_value = new_value
		spriteframe_value.resize(set_count)


@export_group("Animation")
## If true, the node will set or record this property when calling apply() or record() 
@export var modify_animation: bool = false
## The recorded value.
@export var animation_value: Array[StringName]:
	set(new_value):
		animation_value = new_value
		animation_value.resize(set_count)


@export_group("Frame")
## If true, the node will set or record this property when calling apply() or record() 
@export var modify_frame: bool = false
## The recorded value.
@export var frame_value: PackedInt32Array:
	set(new_value):
		frame_value = new_value
		frame_value.resize(set_count)


@export_group("Offset")
## If true, the node will set or record this property when calling apply() or record() 
@export var modify_offset: bool = false
## The recorded value.
@export var offset_value: PackedVector2Array:
	set(new_value):
		offset_value = new_value
		offset_value.resize(set_count)

## If true, the node will set or record this property when calling apply() or record() 
@export var modify_flip_h: bool = false
## The recorded value.
@export var flip_h_value: Array[bool]:
	set(new_value):
		flip_h_value = new_value
		flip_h_value.resize(set_count)

## If true, the node will set or record this property when calling apply() or record() 
@export var modify_flip_v: bool = false
## The recorded value.
@export var flip_v_value: Array[bool]:
	set(new_value):
		flip_v_value = new_value
		flip_v_value.resize(set_count)


## When called, will set chosen properties on the target node to the recorded values.
func apply()->void:
	if !target_node:
		return
	
	super()
	
	if modify_spriteframes:
		target_node.sprite_frames = spriteframe_value[current_set]
	
	if modify_frame:
		target_node.frame = frame_value[current_set]
	
	if modify_offset:
		target_node.offset = offset_value[current_set]
	
	if modify_flip_h:
		target_node.flip_h = flip_h_value[current_set]
	
	if modify_flip_v:
		target_node.flip_v = flip_v_value[current_set]
	
	if modify_animation:
		target_node.animation = animation_value[current_set]


## When called, will record chosen properties from the target node.
func record()->void:
	if !target_node:
		return
	
	super()
	
	if modify_spriteframes:
		spriteframe_value[current_set] = target_node.sprite_frames
	
	if modify_frame:
		frame_value[current_set] = target_node.frame
	
	if modify_offset:
		offset_value[current_set] = target_node.offset 
	
	if modify_flip_h:
		flip_h_value[current_set] = target_node.flip_h 
	
	if modify_flip_v:
		flip_v_value[current_set] = target_node.flip_v 
	
	if modify_animation:
		animation_value[current_set] = target_node.animation

func _resize_value_arrays() -> void:
	frame_value.resize(set_count)
	offset_value.resize(set_count)
	flip_h_value.resize(set_count)
	flip_v_value.resize(set_count)
	spriteframe_value.resize(set_count)
	animation_value.resize(set_count)
