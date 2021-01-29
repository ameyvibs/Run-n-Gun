if(place_meeting(x,y,obj_ground))
{
	instance_destroy();
	instance_create_layer(x+lengthdir_x(10,direction),y+lengthdir_y(10,direction),"Bullets",obj_skeleton_hitspark);
}