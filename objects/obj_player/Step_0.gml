//input

if(hascontrol)
{
	key_left = keyboard_check(ord("A"));
	key_right = keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(ord("W"));

	//keyboard
	if(key_left || key_right || key_jump)
		controller = 0;
	
	//controller
	if(abs(gamepad_axis_value(0,gp_axislh))>0.2)
	{
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
		key_left = max(gamepad_axis_value(0,gp_axislh),0);
		controller = 1;
	}

	if(gamepad_button_check_pressed(0,gp_face1))
	{
		key_jump = 1;
		controller = 1;
	}
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}

//movement
var move=key_right-key_left;
hsp = (move*walksp)+gunkickx;
gunkickx = 0;
vsp = (vsp+grv)+gunkicky;
gunkicky = 0;

canjump--;
if(canjump>0 && key_jump)
{
	vsp = -25;
	audio_play_sound(snd_jump,6,false);
	canjump = 0;
}

//horizontal collision
if(place_meeting(x+hsp,y,obj_ground))
{
	while(!place_meeting(x+sign(hsp),y,obj_ground))
	{
		x = x+sign(hsp);
	}
	hsp = 0;
}
x = x+hsp;

//vertical collision
if(place_meeting(x,y+vsp,obj_ground))
{
	while(!place_meeting(x,y+sign(vsp),obj_ground))
	{
		y = y+sign(vsp);
	}
	vsp = 0;
}

y = y+vsp;

//animation
if(!place_meeting(x,y+1,obj_ground))
{
	sprite_index = spr_player_air;
	image_speed = 0;
	if(vsp>0)
		image_index = 1;
	else
		image_index = 0;
}
else
{
	canjump = 10;
	image_speed = 1;
	if(sprite_index == spr_player_air)
	{
		repeat(5)
		{
			with(instance_create_layer(x,bbox_bottom,"Bullets",obj_dust))
				vsp = 0;
		}
	}
	if(hsp==0)
		sprite_index = spr_player;
	else
		sprite_index = spr_player_run;
}
if(hsp!=0)
	image_xscale = sign(hsp);