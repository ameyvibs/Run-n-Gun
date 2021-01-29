global.hasgun = true;
instance_create_layer(obj_player.x,obj_player.y,"Gun",obj_gun);
audio_play_sound(snd_gun_pickup,7,false);
instance_destroy();