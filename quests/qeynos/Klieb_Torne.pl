sub EVENT_SPAWN {
	quest::settimer("paw",600);
	}

sub EVENT_TIMER {
	quest::say("Can you believe that? That guy actually thinks he is going to find the [Paw of Opolla!]! Bwah ha ha ha!");
	quest::signal(1072,1);
	}
	



sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hey, $name!  Do I know you from somewhere?  Highpass?  Nah, you ain't who I thought you were.  If I were you I would just keep my trap shut and buy some drinks."); 
}
if ($text=~/paw of opolla/i) {
  quest::say("Heh? Why don't you mind your own business bub?! Buzz off!");
}
}
#END of FILE Zone:qeynos  ID:1080 -- Klieb_Torne 

