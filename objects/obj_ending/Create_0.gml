if(global.kills>0 && global.kills<37)
{
	endtext[0] = "Congratulations you successfully escaped the skeleton infested dungeon.";
	endtext[1] = "Your run resulted in the deaths of "+string(global.kills)+" mindless skeletons.";
	endtext[2] = "Maybe try again and be a bit more merciful?\nOr go all out and defeat every last one of them.";
	endtext[3] = "Thats all for now.\nThank you for playing!";
}
else if (global.kills==0)
{
	endtext[0] = "Congratulations you have successfully evaded the skeletons without hurting them.";
	endtext[1] = "Very few have managed to achieve this feat of pacifism so far.";
	endtext[2] = "But maybe going toe to toe with every one of the skeletons is something worth trying?";
	endtext[3] = "Thank you for playing! - The Skeletons";
}
else
{
	endtext[0] = "You have massacred the skeletons.\nNot a single one lives to tell the tale.";
	endtext[1] = "You have mastered the gun and its ways.\nMaybe now is a time to try out a peaceful approach?";
	endtext[2] = ":( - The Skeletons";
}
spd = 0.5;
letters = 0;
currentline = 0;
length = string_length(endtext[currentline]);
text="";