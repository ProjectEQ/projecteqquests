# nesiff's statue
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name!  Nesiff Tallaherd, owner and operator of Nesiff's Wooden Weapons, at your service.  I am the finest woodworker in all of Qeynos.  Even the Qeynos Guard uses my arrows, thanks to [Guard Weleth].");
  }
  if ($text=~/guard weleth/i) {
    quest::say("Guard Weleth is like a son to me.  He is responsible for purchasing supplies for the Qeynos Guard.  He buys arrows from me.  He is usually stationed near the North Gate.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18012 => 1)) {
    quest::say("Oh.  Vesteri sent you?  Here you go.  I hope Te'Anara likes it.");
    quest::summonitem(13864);
    quest::exp(250);
    quest::faction(218,10); #merchants of qeynos
    quest::faction(33,-30); #circle of unseen hands
    quest::faction(9,10); #antonius bayle
    quest::faction(47,10); #coalition of tradefolk
    quest::faction(135,10); #guards of qeynos
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: qeynos ID: 1098 NPC: Nesiff_Tallaherd

