extends Node

const DEFAULT_SCENE = Scene.START
enum Scene {
	START,
	APPLICATION,
	SUBMITTED,
}

var scenes = {
	Scene.START: preload("res://scenes/start_screen.tscn"),
	Scene.APPLICATION: preload("res://scenes/application.tscn"),
	Scene.SUBMITTED: preload("res://scenes/submitted.tscn")
}
func get_scene(scene:Scene) -> PackedScene:
	if scenes.has(scene):
		return scenes.get(scene)
	else: 
		print("Failed to get scene #(%s), returning scene#(%s)" % [scene, DEFAULT_SCENE])
		return scenes.get(DEFAULT_SCENE)
