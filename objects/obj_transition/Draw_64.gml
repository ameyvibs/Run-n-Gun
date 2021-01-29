if(mode!=TRANS_MODE.OFF)
{
	draw_set_color(c_black);
	draw_rectangle(0,0,w,h_half*percent,false);
	draw_rectangle(0,h,w,h-(h_half*percent),false);
}