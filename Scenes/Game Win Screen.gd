extends "res://Scripts/BaseMenuPanel.gd"

var is_out = false
export (int) var level
export (String) var knowledge_to_load
export (bool) var enabled

export (Texture) var blocked_texture
export (Texture) var open_texture

onready var score_label = $ScoreLabel
onready var know = $HBoxContainer/knowledge

func _on_ContinueButton_pressed():
	get_tree().change_scene("res://Scenes/LevelSelectScene.tscn")

func _on_GameManager_game_won(score_to_display):
	SoundManager.play_fixed_sound(6)
	#SoundManager.play_fixed_sound(1)
	if GameDataManager.level_info[level]["stars unlocked"] == 1:
		enabled = true
		know.texture_normal = open_texture
	else:
		enabled = false
		know.texture_normal = blocked_texture
	score_label.text = String(score_to_display)
	if is_out == false:
		is_out = true
		slide_in()

func _on_knowledge_pressed():
	if enabled:
		get_tree().change_scene(knowledge_to_load)
