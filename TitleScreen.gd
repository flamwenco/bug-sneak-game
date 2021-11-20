extends MarginContainer

onready var _continue_button = $VBoxContainer/Buttons/Continue
onready var _quit_button = $VBoxContainer/Buttons/Quit

func _init():
	OS.min_window_size = OS.window_size
	
func _ready():
	print(Global.game_state)
	Global.load_game()
	print(Global.game_state)	
	
	if (OS.get_name() == 'HTML5'):
		_quit_button.visible = false
	if not Global.does_save_file_exist():
		_continue_button.visible = false

func _on_NewGame_pressed():
	var _ret = get_tree().change_scene("res://Intro.tscn")

func _on_Quit_pressed():
	get_tree().get_root().notification(NOTIFICATION_WM_QUIT_REQUEST)
	get_tree().quit()


func _on_Continue_pressed():
	var _ret = get_tree().change_scene("res://LevelSelect.tscn")
