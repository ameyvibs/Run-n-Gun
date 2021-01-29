#macro SAVEFILE "Save.sav"

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;
menu_x = gui_width+350;
menu_y = gui_height-gui_margin;
menu_x_target = gui_width-gui_margin;
menu_speed = 25;
menu_itemheight = font_get_size(fmenu);
menu_commited = -1;
menu_control = true;
menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";
menu_items = array_length_1d(menu);
menu_top = menu_y-(menu_itemheight*1.5*menu_items);
menu_cursor = 2;