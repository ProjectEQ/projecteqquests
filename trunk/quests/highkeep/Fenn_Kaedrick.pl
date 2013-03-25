sub EVENT_SPAWN {
  quest::settimer("depop", 1800); #Despawn after 30 minutes
}

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("What brings you to the top of the castle? Me? I am just the Highkeep exterminator. We have had a nasty time with rats.");
  }
  if($text=~/xentil herkanon/i && defined($qglobals{FennKaedrick}) && ($qglobals{FennKaedrick} == 1)) {
    quest::say("Xentil Herkanon is related to one of the bigwigs of the Circle of Unseen Hands, the rogue guild in Qeynos. Killing him would greatly decrease your popularity with them, but who do they like, anyway? He travels with two bodyguards, Lartin and Grex, very tough customers. It's best to avoid them. Goodbye and good luck.");
    quest::unique_spawn(6185, 0, 0, -258, -102, 4, 16); #Xentil Herkanon
    quest::unique_spawn(6186, 0, 0, -259, -78, 4, 0); #Lartin
    quest::unique_spawn(6187, 0, 0, -240, -78, 4, 0); #Grex
    quest::delglobal("FennKaedrick");
    quest::stoptimer("depop");
    quest::depop();

  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12185 => 1)) { #Useless Coin
    quest::say("So you are the one Laren sent. I myself was trained by Laren. Imagine that, a human trained by elven rogues. I share the concerns of the scouts. You were sent to assassinate [Xentil Herkanon]. He betrayed the scouts and Kelethin. He is somewhere in this keep. Return his head to Laren in Kelethin.");
    quest::setglobal("FennKaedrick",1,5,"M30");
    quest::exp(2000);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop();
}