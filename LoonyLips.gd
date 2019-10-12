extends Control



func _ready():
	var StoryWords = ["Bob", "fast", "tired" , "bed" ]
	var StoryScript = "In the beginning, there was %s and he was %s. In the end, he felt %s, and thus went to %s."
	$VBoxContainer/DisplayText.text = StoryScript % StoryWords


func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)


func update_DisplayText(words):
	$VBoxContainer/DisplayText.text = words
	$VBoxContainer/PlayerText.clear()

