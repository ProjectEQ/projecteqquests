sub EVENT_ENTERZONE 
{
	if (quest::istaskcompleted(138) == 0 && quest::istaskactive(138) == 0) #Check if completed Task: New Beginnings
	{
		quest::assigntask(138); #Force assign Task: New Beginnings
	}
	
	if(defined $qglobals{$name}) 
	{
		quest::delglobal("$name");
	}	
}