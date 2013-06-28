sub EVENT_SAY
{
	if($text=~/hail/i)
	{
		quest::say("Please, let me go. I shall leave the [Freeport Militia]. I did not know they were such a vile group.");
	}
	
	if($text=~/What about the Freeport Militia/i)
	{
		quest::say("I thought they were nothing more than the local militia. Little did I know they were so vile. Now I am stuck [here] and I ask for your forgiveness.");
	}
	
	if($text=~/Why are you here/i)
	{
		quest::say("I came here to escape the militia and ask [Merko to forgive] me.");
	}
	
	if($text=~/Why ask Merko to forgive you/i)
	{
		quest::say("I had a small encounter with his wife, my aunt. She was quite red after that altercation. I guess I upset her in a great way, somehow. Could you please go ask Merko to forgive [Willia]. I shall wait here for his answer.");
	}
}

sub EVENT_DEATH_COMPLETE
{
	quest::say("Your name shall be added to the most wanted list of the Freeport Militia!!");
}
#END of FILE Zone:freportn  ID:8110 -- Guard_Willa