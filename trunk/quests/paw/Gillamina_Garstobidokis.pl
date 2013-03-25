#NPC: Gillamina Garstobidokis
#
#Quest: Gillamina's Elemental Research (Incomplete)
#
#To Do:
#Add level check
#Add Gillamina Garstobidokis
#Add Blazemaster Arnab
#Add Earthmaster Grundag
#Add Tidemaster Aquinius
#Add Windlord Brizoris

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings to you, fellow adventurer. Gillamina Garstobidokis, master mage at your service!");
    quest::emote("bows.");
    quest::say("Beware, should you wish to venture here. In case you didn't know, the lair of Splitpaw has been overrun by fierce elemental creatures.");
    quest::emote("looks down at the dead gnoll near her feet.");
    quest::say("Poor creatures. I am not a fan of the gnolls by any means, but it is still sad to see them all [slaughtered] in this manner.");
  }
  if($text=~/slaughtered/i) {
    quest::say("Yes, the gnolls that once laired here have been destroyed by the elementals it seems. I am not quite sure what happened. These elementals intrigue me so. But I suppose you would like to know what I am [doing here]?");
  }
  if($text=~/doing here/i) {
    quest::say("Good question! I have come here looking for a set of unique orbs that contain the essence of the various elementals that have invaded the lair. If you can find four of these orbs, one from a fire elemental, one from an air elemental, one from an earth elemental, and one from a water elemental, I will gladly repay you for your time. I wish to study these orbs and have not had much luck finding any unfortunately.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 55995 => 1, 55993 => 1, 55992 => 1, 55994 => 1)) { #Air Elemental Orb, Earthen Elemental Orb, Fiery Elemental Orb, Watery Elemental Orb
    quest::say("Remarkable! I cannot wait to study these! Here is your reward as promised! Safe travels.");
    quest::summonitem(71271); #Elemental Stone
    quest::exp(5000);
  }
  plugin::return_items(\%itemcount);
}