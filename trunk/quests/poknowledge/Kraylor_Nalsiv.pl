#Kraylor_Nalsiv.pl
#Code Support has been added. Perl script needs to be written.

sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		quest::say("Greetings $name! I've heard tell of powerful items unique to your profession. If you happen to come into possession of one [return] to me and tell me the tale behind it.");
	}
	
		else {
			quest::say("Hmmm, it doesn't look like you have any items I haven't seen before.");
		}
}

sub EVENT_ITEM {
	plugin::return_items(\%itemcount); #return items if not the ones required

	quest::say("That is truly a wonderous creation you have. Congratulations on your triumphs! I see great things in your future. Return to me should you acquire more powerful tools of your profession.");

	quest::say("I have heard tales of items such as that, but never thought to meet someone who had actually obtained one. My thanks for letting me know about your latest triumph.");

	quest::say("Ah! Most impressive! I haven't seen an artifact of that power in ages. You have truly earned renown among your peers.");
}
#END of FILE Zone:poknowledge ID:202337 --Kraylor_Nalsiv.pl