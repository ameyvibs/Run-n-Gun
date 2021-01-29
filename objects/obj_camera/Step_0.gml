//get position of player
if(instance_exists(follow))
{
	xto = follow.x;
	yto = follow.y;
	if(follow.image_index==obj_player_dead)
	{
		xto = x;
		yto = y;
	}
}

//update position
x += (xto-x)/25;
y += (yto-y)/25;

x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);

//screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//set position
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
if(room!=room_menu && room!=room_ending)
{
	if(layer_exists("Stalactites"))
	{
		layer_x("Stalactites",x/2);
	}
	if(layer_exists("Stalactites_2x"))
	{
		layer_x("Stalactites_2x",x/3);
	}
}