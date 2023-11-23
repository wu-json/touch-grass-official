extends Node

var _params = null

func change_scene(next_scene, params=null):
	_params = params
	get_tree().change_scene_to_file(next_scene)
	
func get_param(param_name):
	if _params != null and _params.has(param_name):
		return _params[param_name]
	return null
