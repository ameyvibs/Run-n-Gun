menu_x += (menu_x_target - menu_x)/menu_speed;

//keyboard control
if(menu_control)
{
	if(keyboard_check_pressed(ord("W")))
	{
		menu_cursor++;
		if(menu_cursor>=menu_items)
			menu_cursor = 0;
	}
	if(keyboard_check_pressed(ord("S")))
	{
		menu_cursor--;
		if(menu_cursor<=-1)
			menu_cursor = menu_items-1;
	}
	if(keyboard_check_pressed(vk_enter))
	{
		menu_x_target = gui_width+350;
		menu_commited = menu_cursor;
		srp_screenshake(6,30);
		menu_control = false;
		audio_play_sound(snd_shoot,10,false);
	}
	var mouse_y_gui = device_mouse_y_to_gui(0);
	if(mouse_y_gui<menu_y && mouse_y_gui>menu_top)
	{
		menu_cursor = (menu_y-mouse_y_gui) div (menu_itemheight*1.5);
		if(mouse_check_button_pressed(mb_left))
		{
			menu_x_target = gui_width+350;
			menu_commited = menu_cursor;
			srp_screenshake(6,30);
			menu_control = false;
			audio_play_sound(snd_shoot,10,false);
		}
	}
}

if(menu_x>gui_width+300 && menu_commited!=-1)
{
	switch(menu_commited)
	{
		case 2: srp_slide_transition(TRANS_MODE.NEXT);
			break;
		case 1: if(!file_exists(SAVEFILE))
				srp_slide_transition(TRANS_MODE.NEXT);
			else
			{
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				global.kills = file_text_read_real(file);
				global.hasgun = file_text_read_real(file);
				file_text_close(file);
				srp_slide_transition(TRANS_MODE.GOTO,target);
			}	
			break;
		case 0: game_end();
			break;
	}
}	