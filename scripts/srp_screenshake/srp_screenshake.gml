/// @desc screenshake(magnitude,frames)
/// @arg magnitude sets strength of the shake
/// @arg frames sets length of the shake in frames
function srp_screenshake() {

	with(obj_camera)
	{
			if(argument[0]>shake_remain)
			{
				shake_magnitude = argument[0];
				shake_remain = argument[0];
				shake_length = argument[1];
			}
	}


}
