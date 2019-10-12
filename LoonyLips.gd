extends Control



func _ready():
	var StoryWords = ["Bob", "fast", "tired" , "bed" ]
	var StoryScript = "In the beginning, there was %s and he was %s. In the end, he felt %s, and thus went to %s."
	$VBoxContainer/DisplayText.text = StoryScript % StoryWords


func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)


func _on_ProceedButton_pressed():
	var words = $VBoxContainer/HBoxContainer/PlayerText.text
	update_DisplayText(words)
	

func update_DisplayText(words):
	$VBoxContainer/DisplayText.text = words
	$VBoxContainer/HBoxContainer/PlayerText.clear()



