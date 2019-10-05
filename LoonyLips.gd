extends Control



func _ready():
	var StoryWords = ["Bob", "fast", "tired" , "bed" ]
	var StoryScript = "In the beginning, there was %s and he was %s. In the end, he felt %s, and thus went to %s."
	print(StoryScript % StoryWords)
	
	StoryWords = ["Ted", "slow", "hyper" , "the game" ]
	print(StoryScript % StoryWords)
	

