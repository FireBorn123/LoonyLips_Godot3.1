extends Control

var player_words = []
var StoryIntro = "Welcome to Loony lips, a fun party game to tell weird stories!\n\n"


var CurrentStory 

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText
onready var ButtonLabel = $VBoxContainer/HBoxContainer/ButtonLabel

func _ready():
	set_current_story()
	DisplayText.text = StoryIntro
	check_player_words_length()
	PlayerText.grab_focus()
	


func set_current_story():
	var stories = read_JSON_File("StoryBook.json")
	randomize()
	CurrentStory = stories[randi() % stories.size()]
#	CurrentStory = Template[randi() % Template.size()]


func read_JSON_File(StoryFileName):
	var file = File.new()
	file.open(StoryFileName, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data


func _on_PlayerText_text_entered(new_text):
	add_to_player_words()


func _on_ProceedButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()
	


func add_to_player_words():
	PlayerText.grab_focus()
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()

func is_story_done():
	
	return player_words.size() == CurrentStory.StoryWordType.size()
	


func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()


func tell_story():
	DisplayText.text  = CurrentStory.StoryScript % player_words

func prompt_player():
	DisplayText.text += "May I have " + CurrentStory.StoryWordType[player_words.size()] + " please ?"


func end_game():
	PlayerText.queue_free()
	ButtonLabel.text = "Play Again?"
	tell_story()
	