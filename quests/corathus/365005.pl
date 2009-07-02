sub EVENT_SAY
{
	if($text=~ /Hail/i)
	{
		quest::say("Quick, we don't have much time, [they] don't keep prisoners alive long.");
	}
	elsif($text=~ /They/i)
	{
		quest::say("I'm not sure what they are exactly, they looked like mushrooms but they walked and talked like people! They kidnapped my brother from Ak`Anon last night, luckily I was able to [track] him here in time.");
	}
	elsif($text=~ /Track/i)
	{
		quest::say("I paid some elven ranger to track my brother after he was taken. He tracked him here but now he seems to have disappeared when it became apparent there was going to be some [danger]. Can't say I'm too surprised, not everyone can have my gnomish tenacity!");
	}
	elsif($text=~ /Danger/i)
	{
		quest::say("Take a look around kid there's bots swarming all over this place, I was able to scout a bit with my sentry bot but I didn't [see] much.");
	}
	elsif($text=~ /See/i)
	{
		quest::say("Well other than a lot of giant robots who don't take too kindly to yours truely I saw three things...");
		quest::say("The left passage leads to some sort of camp, I'm not sure what's in the camp however, my sentry bot couldn't get past a giant octo-bot that guarded the passage. I think this camp is important.");
		quest::say("The passage straight ahead doesn't seem to be much safer, the left fork is filled with mushroom men and what looks like the largest mushroom I've ever seen! The right fork appears to just lead down to the river.");
		quest::say("The passage to the right leads down to a river, it doesn't look very important but I know it's probably the fastest travel through the zone.");
	}
}