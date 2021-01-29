function srp_kill_player() {
	with(obj_gun)
		instance_destroy();
	instance_change(obj_player_dead,true);
	direction = point_direction(other.x,other.y,x,y);
	hsp = lengthdir_x(8,direction);
	vsp = lengthdir_y(16,direction)-4;
	if(sign(hsp)!=0)
		image_xscale = sign(hsp);
	global.kills -=global.killsthisroom;


}
