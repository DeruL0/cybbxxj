extends Node

func _on_ice_holder_break_ice(goal_type):
	check_goals(goal_type)

func _on_oncrete_holder_remove_concrete(goal_type):
	check_goals(goal_type)
