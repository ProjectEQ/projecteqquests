# Raine Beteria
# Location: erudnext - Erudin
# npcID: 24021
# spawngroupID: 24021
# Quests:
#    Part of quest for Incandescent Wand
#    Part of quest for Spell: Tashania   by darkonig

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Welcome. I am Raine Beteria.");
  }
}

sub EVENT_ITEM {
  # Text is completely made up
  if(($itemcount{6339} == 1) && ($gold >= 50)) {
    quest::say("Here is your wand back - I assure you it is now fully enchanted.");
    quest::summonitem(6340);
    quest::faction(211, 10);
    quest::faction(145, 10);
    quest::faction(147, 10);
    quest::exp(1000);
  }

  # Tashania Quest
  # items needed:
  #     10792 Gleaming Coin of Tash
  # items received:
  #     10793 Radiant Coin of Tash
  # plus faction received:
  #     442   Temple of Sol Ro
  # minus faction received:
  #     291   Shadowed Men
  # experience received:
  #     1000
  elsif($itemcount{10792} == 1) {
    quest::say("Thank you very much. I have always wanted one of these! Hehehe? Just kidding. I see that you have enchanted this coin. I have placed the final enchantment on it - take it back to Romar.");
    quest::summonitem(10793);
    quest::faction(442,  10);
    quest::faction(291, -10);
    quest::exp(2067182);
  }

} 

