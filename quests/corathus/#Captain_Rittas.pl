sub EVENT_SAY
{
	if($text=~ /Hail/i)
	{
		quest::say("Well met [soldier] I assume you're here for your [assignment]?");
	}
	elsif($text=~ /soldier/i)
	{
		quest::say("Well they didn't give word of sending anyone else but soldiers up here. We have no use of anything else right now, we're critically undermanned and wont hold out much longer without some help. Now are you here for your [assignment] or are you just going to keep talking like a fool, I don't really have time for the former.")
	}
	elsif($text=~ /assignment/i)
	{
		quest::say("Excellent! As you can see we're boxed in at the moment, we haven't had the man power to push forward yet. What I need you to do is to gather your fellow soldiers and lead them into battle into the courtyard. Our intelligence indicates that the courtyard is loosly defended by some malfunctioning robots that are kept in check by their [leader], who appears to have power to control the machines through some form of arcane power.")
	}
	elsif($text=~ /leader/i)
	{
		quest::say("Grank's initial report shows that their leader is a large fellow native to this area named Duke Rumith but not as powerful as he may seem. Still he appears to control the robots in the area that are hounding us. So we need someone to [destroy the Duke] in order to move our base came forward and give our soldiers some much needed rest.");
	}
	elsif($text=~ /destroy the duke/i)
	{
		quest::say("That's great to hear $name, don't let us down. Destroy the Duke and we can make a forward base camp.");
		if (quest::istaskcompleted(142) == 0 && quest::istaskactive(142) == 0)
		{
			quest::assigntask(142); #assign Duking it out with the Duke
		}
	}
}