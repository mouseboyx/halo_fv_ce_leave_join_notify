# INSTALLATION:<br>
Copy the files in the Halo folder to your halo game directory (same location as halo.exe or haloce.exe)<br>
<br>
Put the lua scripts in the global folder into the chimera global folder (My Documents\My Games\Halo\chimera\lua\scripts\global\) or (My Documents\My Games\Halo CE\chimera\lua\scripts\global\)<br>
<br>
If you want either join sounds or leave sounds but not both, then copy one of the two scripts<br>
<br>
# COMMANDS:<br>
(player_join_sound.lua)<br>
>player_join_sound always <-- DEFAULT SETTING<br>
	Tells the script to always play the notification sound when a player joins, and saves this as the default setting<br>
>player_join_sound empty<br>
	Tells the script to only play the notification sound if you are the only player (1) in the server, and saves this as the default setting<br>
>player_join_sound<br>
	Lets you know the current configuration<br>
<br>
# WHAT THIS PACKAGE COMES WITH:<br>
2 lua scripts<br>
player_join_sound.lua (see known bugs)<br>
	configurable to always notify when a player joins or only notify if you are the only player in the server<br>
	this script saves a file to the halo directory called "player_join_sound_settings.txt" which saves the setting<br>
	<br>
player_leave_sound.lua (see known bugs)<br>
	always plays a sound if a player leaves<br>
<br>
2 wav files<br>
player_join.wav<br>
player_leave.wav<br>
	you can replace these with your own samples if you don't like them<br>
<br>
2 dll files<br>
lua53.dll<br>
	a standard lua library for windows that allows playwavfile.dll to be loaded by chimera<br>
playwavfile.dll<br>
	a very basic dll that allows wav sound playing on a per lua script basis<br>
<br>
1 cpp file<br>
dllmain.cpp<br>
	the source code for playwavfile.dll<br>
<br>
# KNOWN BUGS:<br>
Between one game ending, after the post game carnage report shows, when the next game begins the player leave sound will play once (when no players have left).  Due to an api limitation I don't know how to fix this.  If there is a memory address for both CE and PC/FV that would allow a chimera script to know when the game ends I could fix this, but I haven't deeply searched for it. (I don't readily know of a way to differentiate FV/CE either)<br>
<br>
Upon joining some servers, the player join sound will play, even though no players have joined since your client has.<br>
<br>
# NOTES:<br>
This should work with both FV (PC) and Custom edition, although I did not rigorously test compatibility.  The playwavfile.dll was compiled with visual studio 2019 (I used the 2019 compiler). It's compatible with windows 10 and wine-5.0, you may need certain visual c++ redistributables on older operating systems, or winetricks to install certain visual c++ redistributables on wine.<br>
<br>
To adjust the volume of the notification sound, the best way with the current script is to apply negative amplification the audio clip in an audio editor and replace the existing wav file so that it will be at a lower volume.
