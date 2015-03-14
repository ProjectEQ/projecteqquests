# The Fourteen Great Adventures
# Created by Gonner

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("focuses her attention on $name.");
	quest::emote("wipes away a tear as she turns to face you. Hello $name, sorry if I seem somewhat antisocial but it has been many days since I last saw my father Lyndro and as each hour passes the possibility that he may never return becomes more apparent. While I have not given up hope it gets harder each day not to. If he is never to return to me I wish that I had something to remember him by, something that let me know he died just as brave a man as he has always been.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67615 => 1)) { # Lyndro's Writings
    quest::emote("takes the dusty tome from $name's hands.");
    quest::emote("eyes open wide as she takes the journal and runs her hands over the front cover. Opening the book to the last page tears begin to roll down her cheeks and land on the parchment. Finishing the last line Sophia looks up to you and says, 'I don't know what to say but thank you. De'van mentioned that he had told someone of my worries and now here you are with the final writings of my father. You are truly a blessing sent by the Gods and I thank you once again, but I must ask that you do the same for the others who are worried about the loved ones that traveled with my father. If you have already helped everyone please tell De'van that your task is complete and he will reward you.");
    quest::setglobal("writingsd", 1, 5, "F");
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_SIGNAL {
	quest::emote("smiles and happily exclaims, 'I want to taste my drink!  I want something with flavor.  I'll 'ave a nice dark ale, my dear!'");
}

# END of FILE Zone:abysmal  ID:279037 -- #Sophia_Florence.pl