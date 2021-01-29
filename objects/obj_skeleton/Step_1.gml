if(hp<=0)
{
	with(instance_create_layer(x,y,layer,obj_skeleton_dead))
	{
		direction = other.hitfrom;
		hsp = lengthdir_x(8,direction);
		vsp = lengthdir_y(16,direction)-4;
		image_xscale = sign(hsp)*other.size;
		image_yscale = other.size;
	}
	with(mygun)
		instance_destroy();
	if(instance_exists(obj_player))
	{
		global.kills++;
		global.killsthisroom++;
		with(obj_game)
			killtextscale = 2;
	}
	instance_destroy();
}