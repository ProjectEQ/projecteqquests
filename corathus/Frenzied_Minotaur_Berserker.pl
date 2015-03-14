sub EVENT_KILLED_MERIT
{
	if(quest::istaskactivityactive(145, 0))
	{
		quest::updatetaskactivity(145, 0, 1);
	}
}