extends Node

onready var music_player = $MusicPlayer
onready var sound_player = $SoundPlayer

var possible_music = [
preload("res://Match 3 Sounds/Music/bgm-1.mp3"),
preload("res://Match 3 Sounds/Music/bgm-2.mp3"),
preload("res://Match 3 Sounds/Music/bgm-3.mp3"),
preload("res://Match 3 Sounds/Music/bgm-4.mp3")
]

var possible_sounds = [
preload("res://Match 3 Sounds/Sounds/1.ogg"),
preload("res://Match 3 Sounds/Sounds/3.ogg"),
preload("res://Match 3 Sounds/Sounds/4.ogg"),
preload("res://Match 3 Sounds/Sounds/5.ogg"),
preload("res://Match 3 Sounds/Sounds/6.ogg"),
preload("res://Match 3 Sounds/Sounds/7.ogg"),
preload("res://Match 3 Sounds/win.mp3"),
preload("res://Match 3 Sounds/lose.mp3")
]


func _ready():
	possible_sounds[6].loop = false
	possible_sounds[7].loop = false
	randomize()
	set_volume()
	play_random_music()
	
func _process(delta):
	if !music_player.is_playing():
		play_random_music()
	
func play_random_music():
	var temp = floor(rand_range(0, possible_music.size()))
	music_player.stream = possible_music[temp]
	music_player.play()

func play_random_sound():
	var temp = floor(rand_range(0, 5))
	sound_player.stream = possible_sounds[temp]
	sound_player.play()

func play_fixed_sound(sound):
	sound_player.stream = possible_sounds[sound]
	sound_player.play()

func set_volume():
	if ConfigManager.sound_on:
		music_player.volume_db = -15
		sound_player.volume_db = -15
	else:
		music_player.volume_db = -80
		sound_player.volume_db = -80
