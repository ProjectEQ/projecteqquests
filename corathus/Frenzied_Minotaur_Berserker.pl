sub EVENT_KILLED_MERIT
{
	if(quest::istaskactivityactive(500145, 0))
	{
		quest::updatetaskactivity(500145, 0, 1);
	}
}