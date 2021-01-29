x = owner.x;
y = owner.y+10;
image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);
if(instance_exists(obj_player))
{
	if(obj_player.x<x)
		image_yscale = -image_yscale;
	if(point_distance(obj_player.x,obj_player.y,x,y)<1000)
	{
		image_angle = point_direction(x,y,obj_player.x,obj_player.y);
		countdown--;
		if(countdown<0)
		{
			countdown=countdownrate;
			if(!collision_line(x,y,obj_player.x,obj_player.y,obj_ground,false,false))
			{
				audio_sound_pitch(snd_shoot,choose(0.9,1,1.1));
				audio_play_sound(snd_shoot,5,false);
				with(instance_create_layer(x,y,"Bullets",obj_skeleton_bullet))
				{
					speed = 20;	
					direction = other.image_angle + random_range(-3,3);	
					image_angle = direction;
				}
			}
		}
	}
}