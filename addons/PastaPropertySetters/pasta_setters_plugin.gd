@tool
extends EditorPlugin


var apply_and_record_inspector_plugin
var angle_autosetter_record_inspector_plugin

func _enter_tree() -> void:
	
	#region Load Property State Managers
	add_custom_type("PastaSetterComponent", "Node", 
			preload("Setinators/pasta_setter_component.gd"), 
			preload("Setinators/Icons/icon_bone_state_component.png"))
	add_custom_type("PastaSetterComponentGroup", "Node", 
			preload("Setinators/pasta_setter_component_group.gd"), 
			preload("Setinators/Icons/icon_bone_state.png"))
	add_custom_type("PastaSetterVariant", "Node", 
			preload("Setinators/pasta_setter_variant.gd"), 
			preload("Setinators/Icons/icon_bone_state_component.png"))
	add_custom_type("PastaSetterTransform", "Node", 
			preload("Setinators/pasta_setter_transform.gd"), 
			preload("Setinators/Icons/icon_bone_state_component.png"))
	add_custom_type("PastaSetterSprite", "Node", 
			preload("Setinators/pasta_setter_sprite.gd"), 
			preload("Setinators/Icons/icon_bone_state_component.png"))
	add_custom_type("PastaSetterAnimatedSprite", "Node", 
			preload("Setinators/pasta_setter_animatedsprite.gd"), 
			preload("Setinators/Icons/icon_bone_state_component.png"))
	add_custom_type("PastaSetterInator", "Node", 
			preload("Setinators/pasta_setter_inator.gd"), 
			preload("Setinators/Icons/icon_state.png"))
	add_custom_type("PastaAutoSetterAngle", "Node", 
			preload("Setinators/pasta_auto_setter_angle.gd"), 
			preload("Setinators/Icons/icon_state_angle_fixer.png"))
	#endregion
	
	angle_autosetter_record_inspector_plugin = preload(
		"Setinators/Buttons/pasta_angle_setter_record_button.gd"
	).new()
	add_inspector_plugin(angle_autosetter_record_inspector_plugin)
	
	apply_and_record_inspector_plugin = preload(
		"Setinators/Buttons/pasta_apply_record_buttons.gd"
	).new()
	add_inspector_plugin(apply_and_record_inspector_plugin)


func _exit_tree() -> void:
	remove_inspector_plugin(apply_and_record_inspector_plugin)
	remove_inspector_plugin(angle_autosetter_record_inspector_plugin)
	
	#region Unload Property State Managers
	remove_custom_type("PastaAutoSetterAngle")
	remove_custom_type("PastaSetterInator")
	remove_custom_type("PastaSetterAnimatedSprite")
	remove_custom_type("PastaSetterSprite")
	remove_custom_type("PastaSetterTransform")
	remove_custom_type("PastaSetterVariant")
	remove_custom_type("PastaSetterComponentGroup")
	remove_custom_type("PastaSetterComponent")
	#endregion
