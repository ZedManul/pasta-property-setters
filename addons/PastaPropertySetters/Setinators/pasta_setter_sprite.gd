@tool
@icon("Icons/icon_setter_sprite.png")
class_name PastaSetterSprite
extends PastaSetterComponent
## Can apply and record certain important properties of a Sprite2D node.

## The monitored and modified node.
@export var target_node: Sprite2D

## Number of saved set values.
@export var set_count: int = 1:
	set(new_value):
		set_count = max(1,new_value)
		_resize_value_arrays()

## Selected set value.
@export var current_set: int:
	set(new_value):
		current_set = clampi(new_value,0,set_count-1)

@export_group("Frame")

## If true, the node will apply or record this property when calling apply() or record() 
@export var modify_frame: bool = false
## The recorded value.
@export var frame_value: PackedInt32Array:
	set(new_value):
		frame_value = new_value
		frame_value.resize(set_count)

## If true, the node will apply or record this property when calling apply() or record() 
@export var modify_frame_x: bool = false
## If true, the node will apply or record this property when calling apply() or record() 
@export var modify_frame_y: bool = false
## The recorded value.
@export var frame_coords_value: PackedVector2Array:
	set(new_value):
		frame_coords_value = new_value
		frame_coords_value.resize(set_count)


@export_group("Offset")
## If true, the node will apply or record this property when calling apply() or record() 
@export var modify_offset: bool = false
## The recorded value.
@export var offset_value: PackedVector2Array:
	set(new_value):
		offset_value = new_value
		offset_value.resize(set_count)

## If true, the node will apply or record this property when calling apply() or record() 
@export var modify_flip_h: bool = false
## The recorded value.
@export var flip_h_value: Array[bool]:
	set(new_value):
		flip_h_value = new_value
		flip_h_value.resize(set_count)

## If true, the node will apply or record this property when calling apply() or record() 
@export var modify_flip_v: bool = false
## The recorded value.
@export var flip_v_value: Array[bool]:
	set(new_value):
		flip_v_value = new_value
		flip_v_value.resize(set_count)


@export_group("Region")

## If true, the node will apply or record this property when calling apply() or record() 
@export var modify_region: bool = false
## The recorded value.
@export var region_value: Array[Rect2]:
	set(new_value):
		region_value = new_value
		region_value.resize(set_count)


@export_group("Texture")

## If true, the node will apply or record this property when calling apply() or record() 
@export var modify_tex: bool = false
## The recorded value.
@export var tex_value: Array[Texture2D]:
	set(new_value):
		tex_value = new_value
		tex_value.resize(set_count)


## When called, will set chosen properties on the target node to the recorded values.
func apply()->void:
	if !target_node:
		return
	
	super()
	
	if modify_frame:
		target_node.frame = frame_value[current_set]
	
	if modify_frame_x:
		target_node.frame_coords.x = frame_coords_value[current_set].x
	
	if modify_frame_y:
		target_node.frame_coords.y = frame_coords_value[current_set].y
	
	if modify_offset:
		target_node.offset = offset_value[current_set]
	
	if modify_flip_h:
		target_node.flip_h = flip_h_value[current_set]
	
	if modify_flip_v:
		target_node.flip_v = flip_v_value[current_set]
	
	if modify_region:
		target_node.region_rect = region_value[current_set]
	
	if modify_tex:
		target_node.texture = tex_value[current_set]


## When called, will record chosen properties from the target node.
func record()->void:
	if !target_node:
		return
	
	super()
	
	if modify_frame:
		frame_value[current_set] = target_node.frame
	
	if modify_frame_x:
		frame_coords_value[current_set].x = target_node.frame_coords.x 
	
	if modify_frame_y:
		frame_coords_value[current_set].y = target_node.frame_coords.y
	
	if modify_offset:
		offset_value[current_set] = target_node.offset 
	
	if modify_flip_h:
		flip_h_value[current_set] = target_node.flip_h 
	
	if modify_flip_v:
		flip_v_value[current_set] = target_node.flip_v 
	
	if modify_region:
		region_value[current_set] = target_node.region_rect
	
	if modify_tex:
		tex_value[current_set] = target_node.texture

func _resize_value_arrays() -> void:
	frame_value.resize(set_count)
	frame_coords_value.resize(set_count)
	offset_value.resize(set_count)
	flip_h_value.resize(set_count)
	flip_v_value.resize(set_count)
	region_value.resize(set_count)
	tex_value.resize(set_count)
