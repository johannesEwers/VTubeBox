# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2025-2026 Johannes Ewers


extends Object
class_name VTAudio


static func get_bus_index(bus_name: String) -> int:
	var idx = AudioServer.get_bus_index(bus_name)
	if idx == -1: push_error("Audio-Bus '%s' not found!" % bus_name)
	return idx


static func get_linear_db(bus_idx: int) -> float:
	return db_to_linear(AudioServer.get_bus_peak_volume_left_db(bus_idx, 0)) # Convert from dB to linear level


static func calculate_peak_ratio(bus_idx: int) -> float:
	var l_db = AudioServer.get_bus_peak_volume_left_db(bus_idx, 0)
	var l = db_to_linear(l_db)
	var ref = db_to_linear(-18.0)
	return clamp(l / ref, 0.0, 1.0)
