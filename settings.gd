# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2025-2026 Johannes Ewers


# GLOBAL VARIABLES
extends Node

# [audio]

var bus_idx: int = 0
const THRESHOLD_DB := -40.0 # Level threshold in dB; more negative = faster trigger  

# [visuals]

const FADE_TINT  := Color(0.3, 0.3, 0.3, 1.0) # Dark grey color for fading
const REGULAR_TINT := Color(1.0, 1.0, 1.0, 1.0) # Full color
var max_shuffle_px := 20.0 # Maximum offset in pixels
var tint_speed := 8.0 # Blend speed, higher = faster

# [flags]

var is_debug_mode: bool = false # default is false
var flag_debug_audio_meter: bool = false # default is false
var flag_debug_audio_meter_debugmode: bool = false # default is false
var flag_shuffle: bool = true # default is true
var flag_fading: bool = true # default is true
