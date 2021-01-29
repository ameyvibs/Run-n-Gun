vsp = vsp+grv;

//avoid falling
if(!place_meeting(x+(hsp*18),y+1,obj_ground))
	hsp = -hsp;

//horizontal collision
if(place_meeting(x+hsp,y,obj_ground))
{
	while(!place_meeting(x+sign(hsp),y,obj_ground))
	{
		x = x+sign(hsp);
	}
	hsp = -hsp;
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
	sprite_index = spr_skeleton_air;
	image_speed = 0;
	if(vsp>0)
		image_index = 1;
	else
		image_index = 0;
}
else
{
	image_speed = 1;
	if(hsp==0)
		sprite_index = spr_skeleton;
	else
	{
		sprite_index = spr_skeleton_run;
	}
}
if(hsp!=0)
	image_xscale = sign(hsp)*size;
image_yscale = size;