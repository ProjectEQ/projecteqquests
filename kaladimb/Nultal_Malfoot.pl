# items: 14030, 15203, 15229, 15560, 15036, 15216
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("May the power of Underfoot be with you. Welcome. I am here to serve the will of the king as should you. If you [need healing], then speak. Or perhaps you are here to [return skunk glands]?");
  }
  if($text=~/need healing/i) {
    quest::say("Before the power of Underfoot can attempt to bind your wounds you must pay tribute. Three gold coins!!");
  }
  if($text=~/return skunk glands/i) {
    quest::say("I have made an offer to all clerics of this cathedral. I shall reward one cleric scroll from our scribes for the return of four skunk scent glands. This offer is best left to our clerics.");
  }
}

sub EVENT_ITEM {
  if($gold == 3) {
    quest::say("Be healed!");
    $npc->CastSpell(17,$userid); #Light Healing
  }
  if(plugin::check_handin(\%itemcount, 14030 => 4)) { #Skunk Scent Gland
    quest::say("I thank you for your good deed. I trust it was not a problem. Take this scroll. A cleric of this cathedral will find it useful. May the power of Underfoot be with you.");
    quest::summonitem(quest::ChooseRandom(15203,15229,15560,15036,15216)); # Item(s): Spell: Cure Poison (15203), Spell: Fear (15229), Spell: Furor (15560), Spell: Gate (15036), Spell: Stun (15216)
    quest::faction(227,5); #Clerics of Underfoot
    quest::faction(274,5); #Kazon Stormhammer
    quest::faction(293,5); #Miners Guild 249
    quest::exp(2000);
    quest::givecash(0,5,0,0); #Silver x 5
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:kaladimb  ID:67023 -- Nultal_Malfoot
