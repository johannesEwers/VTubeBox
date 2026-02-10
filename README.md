# VTubeBox

## Controlls
F1: Opens the settings menu

## 2D Models

### Disclaimer
All 2D model features are currently in development.

### Requirement: Sprite Sheet
0. Layer: Background textures with shadows
1. Layer: Character body with colored shadows (same object with 30% transparency)
3. Layer: Clothes with shadows
4. Layer: Accessoirs

You probably need to scale your models / textures to fit the 720 x 1280 window 
(vertical). Basic models / textures needs to be in 500 x 500 px. Place your 
model stuff into the "3rd_model_assets" folder to use them.

### Notice
- Currently the textures are placed directly in the middle.
- Face needs to be in its elemental parts
- Provide mouth textures for every vowel
- Do not change audio volumes inside Godot anymore! It is the users 
  responsibility via audio equipment and audio software settings.
- Do not unmute the Master bus to keep your ears safe!

## 3D Models
Currently not in development. Maybe in the future.

## Use in OBS

### Windows
1. Run VTubeBox
2. Add the app window as a "Game Capture" source in OBS
3. Select in "Mode" capture specific window
4. Select in "Window" VTubeBox
5. Check "Allow transparency"
6. Uncheck "Record Mouse Pointer"
7. Crop or move the OBS capture to your needs

### Linux
1. Run VTubeBox
2. Taskbar > RMB on VTubeBox icon > More > Check "No Titlebar and Frame"
3. Add the app window as a "Screen Capture" source in OBS
4. Screen Sharing > Windows > VTubeBox
5. Uncheck "Record Mouse Pointer"
6. Transform or move the OBS capture to your needs

## FAQ

### My condenser microphone do not work. Does the app use the microphone on my audio interface?
It does, but Godot always use the first (default) source it founds. Check where your
mic is connected.

SOLUTION: If it is in IN2, connect it with IN1 instead. Solved it for me as
much as I can say.

### Why do my model not react, when I speak?
You need to set your device as default input device (mostly speaker icon on
the right side of the tasbar).
Also it seems Godot only support WASAPI/WDM input devices on Windows. If
OBS grabs your microphone, other apps can not use it at the same time.

SOLUTION: Try a second USB- or 3.5-mm-jack-microphone just for this app instead.

### Why does my model react on every sound?
Maybe your mic settings are to high (mostly a value above 70 %). Reduce it 
until it is right for you.
To prevent reactions by noise, a noise gate filter is configurated and tested.

### Why is the sound weird (mono) after the app runs?
You're probably using bluetooth heaphones. Windows switches it into "Hands Free 
Mode" (Freisprechtelefonie) and causes that behavior after running the program.

SOLUTION: Do not use a bluetooth headphone/in-ear microphone under Windows.
          I do not found any other solution for this. Windows audio drivers sucks...
          I cannot change Microsoft's bad audio support or Godot's WASAPI-only support.

### Why is my audio level going to reduced, when I speak?
As far as I know, this is a Windows/Realtek audio driver thing. I do not really 
know why this happens.

SOLUTION: Install and use Microsoft's default audio driver. Worked for me, until
the next updates...

## Feature ideas
- Analyzes live microphone input by computing frequency-band energy and selecting the most energetic (dominant) frequency band for downstream use.
- Live Cam Support
- Face expressions and gestures running over hotkeys (Stage 1)
- Automatically face expressions and gestures (Stage 2)
- Whole model needs to be flippable on its y-axis by a hotkey for convenience
