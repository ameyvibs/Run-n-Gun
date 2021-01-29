function srp_slide_transition() {
	// @desc slide_transition(mode,target_room)
	// @arg mode sets transition mode between next, restart and goto
	// @arg target sets target room when setting the goto mode

	with(obj_transition)
	{
		mode = argument[0];
		if(argument_count >1)
			target = argument[1];
	}


}
