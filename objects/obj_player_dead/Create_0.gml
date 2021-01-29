hsp = 0;//6
vsp = 0;//-13
grv =  0.7;
done = 0;
srp_screenshake(6,60);
image_speed = 0;
image_index = 0;
audio_play_sound(snd_death,10,false);
game_set_speed(30,gamespeed_fps);
with(obj_camera)
	follow = other.id;