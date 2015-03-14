sub EVENT_SAY
{
	if($text=~ /Hail/i)
	{
		quest::say("Hail, friend, Izzik's my name and tinkering is my game. It's a good thing you're [here]");
	}
	elsif($text=~ /Here/i)
	{
		quest::say("Where here is is unimportant the real question I'm sure you must be asking is [why] you are here.");
	}
	elsif($text=~ /Why/i)
	{
		quest::say("Now see that's a good question, sometimes I even ask it myself. Put simply you are here to help us stop [Wilfred] I imagine, I mean why else would anyone send you here.");
	}
	elsif($text=~ /Wilfred/i)
	{
		quest::say("Wilfred is my brother but I'm afraid he's gone a bit mad of late. It really is a shame he was the most excellent and dedicated [tinker] I've ever seen.");
	}
	elsif($text=~ /Tinker/i)
	{
		quest::say("Oh yes, we were both tinkers you see. Wilfred always had such a knack for it, one might say he was born to do it. He really sort of let it go a bit when he got mixed up in the [arcane arts].");
	}
	elsif($text=~ /Arcane Arts/i)
	{
		quest::say("Yes, he began to study magic. On his own of course, and lacking any sort of supervision it seemed to take over his world. His mind was never really the same... He's convinced he's a god now and that he can move stars, sort of silly yes? Anyway we need to capture him and bring him home before he hurts someone, if you'd like to help the Captain over there is looking for people to bolster our forces.");
	}
}