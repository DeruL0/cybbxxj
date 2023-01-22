extends Node2D

export (int) var level

export (Texture) var cloud_tex

onready var city_cloud = $cloud1

func _process(delta):
	if GameDataManager.level_info.has(level) and GameDataManager.level_info[level]["pass"] == 1 :
		visible = false
	city_cloud.texture = cloud_tex

