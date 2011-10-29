sub EVENT_SPAWN {
	quest::SetRunning(1);
}

sub EVENT_COMBAT {
	if($combat_state==1){
		quest::say("In the name of the Rainkeeper, I strike at thee!!");
	}
}

sub EVENT_DEATH {
	quest::say("You will meet your own doom soon enough, my friend.. my influence with the Knights of Thunder is great, and they will not rest until I am avenged!");
}

sub EVENT_SAY
{
 if($text=~/Hail/i)
  {
   quest::say("No time to talk!! I must be on my way. I am in a race with the paladins from the Temple of Life.");
  }
}
