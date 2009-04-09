# Sulgar
# Location: everfrost - Everfrost Peaks
# npcID: 
# spawngroupID:
# Quests:
#    Tarton's Wheel quest for Spell: Ice Comet by darkonig
#    quest text was not available so made up some. The initial keyword is correct to trigger it tho.

sub EVENT_SAY {
  if($text=~/hail/i) {
   quest::say("Greetings. I am searching for the [wheel of Tarton]. If you will assist me I will provide you with [runes] to create a powerful spell.");
  }

  elsif($text=~/runes/i) {
   quest::say("I have these runes, Rune of Frost and Rune of the Astral, which can be combined to produce a powerful spell that can call down destruction from the heavens. I will give them to you in exchange for the Staff of the Wheel and Star of Eyes");
  }

  elsif($text=~/case/i) {
   quest::say("You can use this case to reassemble the wheel. It has been infused with energy to combine the spokes. You will need to work quickly though or it will consume itself.");
   quest::summonitem(17510); # a glowing chest - quest combiner
  }

  elsif($text=~/wheel/i) {
   quest::say("The wheel was broken into several pieces and scattered throughout the world. This book will give you clues as to their whereabouts. Once you gather all the pieces, they can be reassembled in a special [case]");
   quest::summonitem(18031); # Tome of the Wheel
  }

}

sub EVENT_ITEM {
  # Tarton's Wheel quest
  # items needed:
  #     14360 Staff of the Wheel
  #     14361 Star of Eyes
  # items received:
  #     11880 Rune of Frost
  #     11881 Rune of the Astral
  # plus faction received
  #     none
  # minus faction received
  #     none
  # experience received:
  #	100000

  if(plugin::check_handin(\%itemcount, 14360 => 1, 14361 => 1)) {
    quest::say("Wonderful, you have brought me the Wheel. Here is the reward I promised you.");
    quest::summonitem(11880);
    quest::summonitem(11881);
    quest::exp(100000);
  }

  else {
    quest::say("I have no interest in these items.");
    plugin::return_items(\%itemcount);
  }

}
