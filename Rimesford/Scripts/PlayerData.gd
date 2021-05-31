extends Node

var character = "skunk"

# basic axis information 
var honesty = 0
var deceit = 0
var kindness = 0
var cruelty = 0

# skills information: each skill is a bool indicating whether
# the player has it. 

# the four major ends of the compass rose, which are solutions to the problem
# if useful, these can store what these solutions are
var honestSol = false
var deceitSol = false
var kindnessSol = false
var crueltySol = false

# the four 2/3rds skills for each direction
var honestSkill = false
var deceitSkill = false
var kindnessSkill = false
var crueltySkill = false

# the eight other skills. one task and one insight skill 

func callfunc(val):
	if (val == "add_honesty"):
		honesty += 1
		print("honesty: ", honesty)
	
	elif (val == "add_deceit"):
		deceit += 1
		print("deceit: ", deceit)
	
	elif (val == "add_kindness"):
		kindness += 1
		print("kindness: ", kindness)
		
	elif (val == "add_cruelty"):
		cruelty += 1
		print("cruelty: ", cruelty)

	
	
func set_honest():
	honestSol = true
	print("honesty solution")




