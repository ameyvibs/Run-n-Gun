x = obj_player.x;
y = obj_player.y-10;

//mouse aim
if(obj_player.controller==0)
	 image_angle = point_direction(x,y,mouse_x,mouse_y);
else
{
	var controller_x = gamepad_axis_value(0,gp_axisrh);
	var controller_y = gamepad_axis_value(0,gp_axisrv);
	if (abs(controller_x)>0.2 || abs(controller_y)>0.2)
	{
		controller_angle = point_direction(0,0,controller_x,controller_y);
	}
	image_angle = controller_angle;
}

firingdelay = firingdelay-1;
recoil = max(0,recoil-1);

//shooting
if((mouse_check_button(mb_left) || gamepad_button_check(0,gp_shoulderrb)) && firingdelay<0)
{
	recoil = 12;
	firingdelay = 5;
	srp_screenshake(2,10);
	audio_sound_pitch(snd_shoot,choose(0.9,1,1.1));
	audio_play_sound(snd_shoot,5,false);
	with(instance_create_layer(x,y,"Bullets",obj_bullet))
	{
		speed = 40;	
		direction = other.image_angle + random_range(-3,3);	
		image_angle = direction;
	}
	with(obj_player)
	{
		gunkickx = lengthdir_x(3,other.image_angle-180);
		gunkicky = lengthdir_y(2,other.image_angle-180);
	}
}

//recoil
x = x-lengthdir_x(recoil,image_angle);
y = y-lengthdir_y(recoil,image_angle);

if(image_angle>90 && image_angle<270)
	image_yscale = -1;
else
	image_yscale = 1;