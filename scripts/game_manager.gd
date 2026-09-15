extends Node

var score = 0
@onready var ui_score: Label = %"UI Score"


func add_coin():
	score += 1
	var score_txt = "Collected coins: " + str(score) + " of 5"
	ui_score.text = score_txt
