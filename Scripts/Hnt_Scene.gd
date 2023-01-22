extends Node2D

export (String) var scene_to_load
export (String) var scene_to_load1

func _ready():
	pass # Replace with function body.

func _on_TextureButton_pressed():
	get_tree().change_scene(scene_to_load)


func _on_TextureButton2_pressed():
	get_tree().change_scene(scene_to_load1)
