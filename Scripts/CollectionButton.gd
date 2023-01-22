extends Node2D

export (int) var level
export (String) var scene_to_load
export (bool) var enabled

export (Texture) var blocked_texture
export (Texture) var open_texture

onready var button = $TextureButton

func _ready():
	if GameDataManager.level_info.has(level):
		if GameDataManager.level_info[level]["stars unlocked"] == 1:
			enabled = true
			button.texture_normal = open_texture
		else:
			enabled = false
			button.texture_normal = blocked_texture



func _on_TextureButton_pressed():
	if enabled:
		get_tree().change_scene(scene_to_load)
