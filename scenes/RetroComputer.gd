extends Node2D

var captures = []

func _ready():
	#resize_window()
	pass

func resize_window():
	OS.window_maximized = false
	OS.window_fullscreen = false
	OS.window_borderless = false
	OS.window_resizable = true
	#OS.set_window_size(Vector2(1280, 720))
	OS.set_window_size(Vector2(640, 360))
	OS.center_window()

func set_stretch_mode_for_game():
	self.get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_VIEWPORT, SceneTree.STRETCH_ASPECT_KEEP, Vector2(320,180))
	
func capture_frame():
	var cap = get_viewport().get_texture().get_data()
	cap.flip_y()
	self.captures.append(cap)

func export_frames():
	var frame_number = 1
	for cap in self.captures:
		cap.save_png("/home/kevin/Pictures/Art/Pixel Art/RetroComputer/Exports/Frames/frame_%02d.png" % frame_number)
		frame_number += 1
