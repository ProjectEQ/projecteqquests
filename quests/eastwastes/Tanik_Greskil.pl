# Tanik Greskil dialogue - hand him a vial of velium vapors to complete quest
#

sub EVENT_SPAWN {
  $npc->SetAppearance(3);
  quest::settimer("moveloc",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Outlander! Thank Brell you've found me! I am the last surviving member of my unit. Our mission was somehow compromised, the bloody Kromrif knew just where to find us... I can't imagine how they knew. I was barely able to escape with my life and wandered into a trap here. I am badly hurt and need your help.");
  }
  if ($text=~/help/i) {
    quest::say("Quickly, give me a vial of Velium Vapors so I can return home, I am in desperate need of some attention from our clerics.");
  }
  if ($text=~/velium vapors/i) {
    quest::say("Drat! Are you telling me you don't have one with you? Run back to Thurgadin at once and speak with Frundle, she can make you one. I will do what I can to stay alive. I may need to move about a bit to keep from being discovered. Hurry now outlander, you're my only hope.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 1553 => 1)) {
    quest::say("Thank you, $name. I shall be eternally grateful to you. Should you ever require my assistance I pledge to you my aid. Please deliver this to Borannin, it is imperative that he deliver this to the Dain at once. Farewell for now outlander....");
    quest::summonitem(1560);
    quest::stoptimer("moveloc");
    quest::depop();
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  if ($timer eq "moveloc") {
    quest::stoptimer("moveloc");
    quest::depop();
  }
}

sub EVENT_AGGRO {
  $npc->SetAppearance(0);
}

sub EVENT_DEATH_COMPLETE {
  quest::stoptimer("moveloc");
}

# EOF zone: eastwastes ID: 116542 NPC: Tanik_Greskil

