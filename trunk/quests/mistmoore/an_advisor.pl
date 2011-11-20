sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("How dare you speak to me, you impudent sack of nauseating refuse!  For this outrage of insubordination I call forth the vengeance of House Mistmore!  You now have little time left to live.  Enjoy it.");
		quest::attack($name);
	}
}

sub EVENT_DEATH {
	quest::say("With my last breath, I call upon the vengeance of House Mistmoore!  Stalk the filth that strikes against our house and leave their organs strewn about the Lesser Faydark!");
}