if(room!=room_menu && instance_exists(obj_player) && global.kills>0)
{
	killtextscale = max(killtextscale*0.95,1)
	draw_set_color(c_black);
	draw_set_font(fmenu);
	draw_set_halign(fa_right);
	draw_set_valign(fa_top);
	draw_text_transformed(1920-8,12,"Kills : "+string(global.kills),killtextscale,killtextscale,0);
	draw_set_color(c_white);
	draw_text_transformed(1920-10,10,"Kills : "+string(global.kills),killtextscale,killtextscale,0);
}