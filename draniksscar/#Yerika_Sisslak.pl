# items: 52906, 52907, 52908
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("You have the aura of a beastlord I should trust. If Elder Muada hasss sent you, you must prove it to me.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52906 =>1 )) {
    quest::say("I have seen the creature nearby, but I have not been able to defeat it.  I am not strong enough.  Perhaps you may have better luck.  You must hurry.  It has used the warder spirit to create twisted and dark companions of its own. If you should overcome this creature, return to me.");
    quest::unique_spawn(302085,0,0,157.1,262.6,-100.6,242.6); # NPC: #Girplan_Spiritleech
    quest::spawn2(302084,0,0,160.7,192.9,-91.3,506.8); # NPC: a_girplan_spiritminion
    quest::spawn2(302084,0,0,117.8,210.7,-84.9,47.2); # NPC: a_girplan_spiritminion
    quest::spawn2(302084,0,0,88.1,263.2,-97.9,118.2); # NPC: a_girplan_spiritminion
    quest::spawn2(302084,0,0,115,331.9,-130.3,210.6); # NPC: a_girplan_spiritminion
    quest::spawn2(302084,0,0,184.9,341.3,-152.8,276); # NPC: a_girplan_spiritminion
    quest::spawn2(302084,0,0,234.6,302.0,-136.4,351.6); # NPC: a_girplan_spiritminion
    quest::spawn2(302084,0,0,240.4,234.4,-120.0,421.2); # NPC: a_girplan_spiritminion
    quest::spawn2(302084,0,0,277.8,284,-101.7,381.2); # NPC: a_girplan_spiritminion
    quest::spawn2(302084,0,0,207.6,187.8,-100,471); # NPC: a_girplan_spiritminion
    quest::spawn2(302084,0,0,153.6,175,-81.2,507.6); # NPC: a_girplan_spiritminion
    quest::spawn2(302084,0,0,177.2,253.2,-118.2,324.2); # NPC: a_girplan_spiritminion
  }
  if (plugin::check_handin(\%itemcount, 52907 =>1 )) {
    quest::say("You have certainly accomplished what I was not able to. I must go now, but be sure to take this letter and the essence back to Rashara.");
    quest::summonitem(52907); # Item: Rashara's Warder's Essence
    quest::summonitem(52908); # Item: Sealed Response to the Elders
  }
  plugin::return_items(\%itemcount);
}
