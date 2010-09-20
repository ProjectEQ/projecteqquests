#Ghost_Of_Ridossan
#NPC ID: 100222
#Stonebrunt

sub EVENT_SPAWN {
  quest::settimer(1,300);
  quest::say("Thank you, $name. I am not long for this world. Before I leave, I would like to reward the one who helped me have my revenge. Please, hand me the token of my God, of Cazic-Thule, and I shall pass you the spear I once used. You've earned it."); #Text is made up
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 2297 => 1)) { #Idol of Fear
    quest::emote("takes the idol into his spectral hand and shoves the lance into your arms. After letting go of the lance, the ghost immediately begins to fade away. Before it is gone completely, it looks into your eyes and says, 'Suffer.'");
    quest::summonitem(2099); #Soulfiend Lance
    quest::stoptimer(1);
    quest::depop();
  }
  else {
    quest::emote("ignores you.");
    plugin::return_items(\%itemcount);
  }
}

sub EVENT_TIMER {
  quest::stoptimer(1);
  quest::depop();
}