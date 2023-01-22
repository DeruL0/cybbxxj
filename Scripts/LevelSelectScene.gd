extends CanvasLayer

var scroll_value = 0

var possible_dialogs = [
"enter","LZ_start","LZ_end",
"DX_start","DX_end",
"ZY_start","ZY_end",
"JQ_start","JQ_end",
"DH_start","DH_end","all_end"
]

func _ready():
	yield(get_tree(), "idle_frame")
	$ScrollContainer.scroll_vertical = GameDataManager.level_scroll_value
	check_dialog()
	GameDataManager.save_data()

func check_dialog():
	var new_dialog
	# enter2LZ
	if !GameDataManager.level_info.has(2) and GameDataManager.level_info[1]["pass"] != 1:
		GameDataManager.level_info[1]["pass"] = 1
		new_dialog = Dialogic.start(possible_dialogs[0])
		get_parent().add_child(new_dialog)
		new_dialog.connect("timeline_end",self,"after_dialog")

	# LZ2DX
	elif GameDataManager.level_info.has(5) and GameDataManager.level_info[5]["pass"] != 1:
		new_dialog = Dialogic.start(possible_dialogs[2])
		get_parent().add_child(new_dialog)
		new_dialog.connect("timeline_end",self,"after_dialog")

	#DX2ZY
	elif GameDataManager.level_info.has(8) and GameDataManager.level_info[8]["pass"] != 1:
		new_dialog = Dialogic.start(possible_dialogs[4])
		get_parent().add_child(new_dialog)
		new_dialog.connect("timeline_end",self,"after_dialog")

	#ZY2JQ
	elif GameDataManager.level_info.has(12) and GameDataManager.level_info[12]["pass"] != 1:
		new_dialog = Dialogic.start(possible_dialogs[6])
		get_parent().add_child(new_dialog)
		new_dialog.connect("timeline_end",self,"after_dialog")

	#JQ2DH
	elif GameDataManager.level_info.has(16) and GameDataManager.level_info[16]["pass"] != 1:
		new_dialog = Dialogic.start(possible_dialogs[8])
		get_parent().add_child(new_dialog)
		new_dialog.connect("timeline_end",self,"after_dialog")

	#DH2end	
	elif GameDataManager.level_info.has(19) and GameDataManager.level_info[19]["pass"] == 1:
		new_dialog = Dialogic.start(possible_dialogs[10])
		get_parent().add_child(new_dialog)
		new_dialog.connect("timeline_end",self,"after_dialog")		
		


func after_dialog(timeline_name):
	var new_dialog1
	if timeline_name == 'enter':
		new_dialog1 = Dialogic.start(possible_dialogs[1])
		get_parent().add_child(new_dialog1)
	elif timeline_name == 'LZ_end':
		#emit_signal("cloudDX")
		GameDataManager.level_info[5]["pass"] = 1
		new_dialog1 = Dialogic.start(possible_dialogs[3])
		get_parent().add_child(new_dialog1)
	elif timeline_name == 'DX_end':
		#emit_signal("cloudZY")
		GameDataManager.level_info[8]["pass"] = 1
		new_dialog1 = Dialogic.start(possible_dialogs[5])
		get_parent().add_child(new_dialog1)
	elif timeline_name == 'ZY_end':
		#emit_signal("cloudJQ")
		GameDataManager.level_info[12]["pass"] = 1
		new_dialog1 = Dialogic.start(possible_dialogs[7])
		get_parent().add_child(new_dialog1)
	elif timeline_name == 'JQ_end':
		#emit_signal("cloudDH")
		GameDataManager.level_info[16]["pass"] = 1
		new_dialog1 = Dialogic.start(possible_dialogs[9])
		get_parent().add_child(new_dialog1)
	elif timeline_name == 'DH_end':
		$TextureRect.visible = true
		GameDataManager.level_info[19]["pass"] = 2
		new_dialog1 = Dialogic.start(possible_dialogs[11])
		get_parent().add_child(new_dialog1)
		new_dialog1.connect("timeline_end",self,"all_clear")		

func all_clear(none):
	$TextureRect.visible = false
	
func _on_LevelBackdrop_save_scroll_value():
	# set the global scroll value to the current scroll value
	var current_scroll_value = $ScrollContainer.scroll_vertical
	GameDataManager.level_scroll_value = current_scroll_value

func _on_Collection_pressed():
	get_tree().change_scene("res://Scenes/Collections.tscn")
	
func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Game Menu.tscn")
