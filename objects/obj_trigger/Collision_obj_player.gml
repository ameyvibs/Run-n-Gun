with(obj_player)
{
	if(hascontrol)
	{
		hascontrol = false;
		srp_slide_transition(TRANS_MODE.GOTO,other.target);
	}
}