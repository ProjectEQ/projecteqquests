sub EVENT_SPAWN {
	quest::SetRunning(1);
}

sub EVENT_COMBAT {
	if($combat_state==1){
		quest::say("Rodcet Nife!!  Give me strength to smite your foe!!");
	}
}

sub EVENT_DEATH {
	quest::say("Your name has been stricken from the book of the Prime Healer!!  I shall be avenged!");
}


sub EVENT_SAY
{
 if($text=~/Hail/i)
  {
   quest::say("No time to talk!! I must be off. The grains of sand are falling and I must prove that we paladins from the Temple of Thunder are the quickest.");
  }
}
