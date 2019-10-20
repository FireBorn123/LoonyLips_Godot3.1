extends Control

var player_words = []
var StoryIntro = "Welcome to Loony lips, a fun party game to tell weird stories!\n\n"
#var Template = [
#		{
#		"StoryWordType":["a name", "an adverb", "an adjective" , "a noun" ],
#		"StoryScript" : "In the beginning, there was %s and he was %s. In the end, he felt %s, and thus went to %s."
#		}, 
#
#		{"StoryWordType" : ["a noun", "an adjective", "an noun" , "a verb" ],
#		"StoryScript" : "In the end the world was on %s. It was a %s day, and there was much %s in prepration. However, humanity was determined to %s. In the end, he felt %s, and thus went to %s."
#		}, 
#
#		{
#		"StoryWordType" : ["name", "number",  "fast food", "number", "openable object"],
#		"StoryScript" : "Once upon a time %s bought %s %s's even though only %s cound fit in the %s."
#		},
#
#		{
#		"StoryWordType" : ["name", "object",  "adjective", "adverb"],
#		"StoryScript" : "In a land never seen %s found a %s, and used it for his own %s purposes. From there time progressed %s"
#		},
#
#		{
#		"StoryWordType" : ["object", "noun",  "place", "adjective", "adjective", "adjective", "noun"],
#		"StoryScript" : "In a galexy far far away a tiny %s tried to find %s way to the %s. It was a %s and %s jorney that was %s with %s."
#		}]

# var CurrentStory 
var CurrentStory = {}

onready var PlayerText = $VBoxContainer/HBoxContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText
onready var ButtonLabel = $VBoxContainer/HBoxContainer/ButtonLabel

func _ready():
	set_current_story()
	DisplayText.text = StoryIntro
	check_player_words_length()
	PlayerText.grab_focus()
	

func set_current_story():
	randomize()
	var Stories = $Storybook.get_child_count()
	var SelectedStory = randi() % Stories
	
	CurrentStory.StoryWordType  = $Storybook.get_child(SelectedStory).StoryWordType
	CurrentStory.StoryScript = $Storybook.get_child(SelectedStory).StoryScript
#	CurrentStory = Template[randi() % Template.size()]

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
	