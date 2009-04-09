#Note--All text is COMPLETELY wrong.  But, it's a template, and it gets you the important item--a key to Jaled-Dar's Tomb so that you may get your sleeper key.
#Fix this please.

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hrmm, who have we here?  A fleshling that managed to work past my guards...apparently, then, you have your wits about yourself.  In that case, perhaps you might be useful.  I need you to kill a ratman named Neb, because I cannot find him and he resides in an area too small for me to reach.  He and his clan of Paebala rats are of great annoyance to me, and need to be eradicated so that I may focus on greater tasks at hand.");
  }
  if ($text=~/who is neb/i) {
    quest::say("Neb is an enemy of my clan of Chetari ratmen, and a thorn in my side.  Slaughter him and bring me his head, and I will give you the key to Jaled-Dar's Tomb.");
  }
}

sub EVENT_ITEM {
  if($faction==1 && plugin::check_handin(\%itemcount,26010=>1)) {
    quest::say("Thank you for your assistance.  Now I may get back to higher matters at hand.  Leave me.");
    quest::summonitem(28060);
    quest::faction(32, 3);
    quest::faction(365, 3);
    quest::faction(42, -6);
    quest::faction(273, -6);
    quest::exp(250000);
    quest::ding();
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:necropolis  ID:123115 -- Zlandicar
