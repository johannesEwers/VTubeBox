# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2025-2026 Johannes Ewers


extends Object
class_name VTPhysics


var sprite_list: Array = []
var sprite_origins_pos: Dictionary = {}


func collect_sprite_nodes(root: Node) -> void:
	if root is Sprite2D:
		sprite_list.append(root)
	for child in root.get_children():
		if child is Node:
			collect_sprite_nodes(child)
	if Globals.is_debug_mode: print("List Node: ", root)


func collect_sprite_positions(arr: Array) -> void:
	for s in arr:
		sprite_origins_pos[s] = s.position
		if Globals.is_debug_mode: print("Sprite Positions: ", sprite_origins_pos[s])


func draw_flat_physics(delta, bus_idx: int) -> void:
	var l_db = VTAudio.calculate_peak_ratio(bus_idx)
	if Globals.is_debug_mode: print("l_db: ", l_db, " | RAW db: ", AudioServer.get_bus_peak_volume_left_db(bus_idx, 0), " | THRESHOLD: ", Globals.THRESHOLD_DB)
	
	# If sound appears, the images shakes:
	if Globals.flag_shuffle:
		if AudioServer.get_bus_peak_volume_left_db(bus_idx, 0) > Globals.THRESHOLD_DB: # Shaking
			var off = Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized() * Globals.max_shuffle_px * l_db 
			# Use on all sprites:
			for s in sprite_list:
				s.position = sprite_origins_pos[s] + off
		else: # Stopp shaking
			for s in sprite_list:
				s.position = s.position.lerp(sprite_origins_pos[s], 5 * delta)
	# If no sound appears, the images fading into a grayscale and vice versa:
	if Globals.flag_fading:
		if AudioServer.get_bus_peak_volume_left_db(bus_idx, 0) > Globals.THRESHOLD_DB: # Coloring
			for s in sprite_list:
				s.modulate = s.modulate.lerp(Globals.REGULAR_TINT, Globals.tint_speed * delta)
		else: # Fading
			for s in sprite_list:
				s.modulate = s.modulate.lerp(Globals.FADE_TINT, Globals.tint_speed * delta)
