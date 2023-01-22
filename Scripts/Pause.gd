extends "res://Scripts/BaseMenuPanel.gd"

func _on_Continue_pressed():
	get_tree().paused = false
	slide_out()

func _on_Quit_pressed():
	get_tree().change_scene("res://Scenes/LevelSelectScene.tscn")
	get_tree().paused = false

func _on_bottom_ui_pause_game():
	slide_in()

