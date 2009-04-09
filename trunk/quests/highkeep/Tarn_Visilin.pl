# Tarn Visilin
# Location: highkeep - High Keep
# npcID: 6061
# spawngroupID: 6061
# Quests:
#    Part of quest for Incandescent Gloves by Mystic414
#    Part of quest for Rod of Insidious Glamour by Mystic414
#    Part of quest for Spell: Tashania   by darkonig

sub EVENT_SAY {
  if($text=~/Hail/i){
    quest::say("Hello.  I am Tarn Visilin.");
  }
}

sub EVENT_ITEM {

  # Glowing Glamour Stone
  if(($itemcount{10086} == 1) && ($gold >= 50)) {
    quest::say("Here is your stone, fully enchanted."); # Made this text up
    quest::summonitem(10087);
  }

  # Gleaming Gloves
  elsif($gold >= 50) { #need an elsif to keep both quests from triggering on glowing glamour stone handin
    quest::say("I see that Sultin has sent you to me.  Very well, here are your gloves."); # Made this text up
    quest::summonitem(2355);
  }

  # Tashania Quest
  # items needed:
  #     10790 Coin of Tash
  # items received:
  #     10791 Glowing Coin of Tash
  # plus faction received:
  #     442   Temple of Sol Ro
  # minus faction received:
  #     291   Shadowed Men
  # experience received:
  #     1000
  elsif($itemcount{10790} == 1) {
    quest::say("The Coin of Tash. Very good. I have laid a basic enhancement on it - to get it further enhanced you must take the coin to Mizn N'Mar in the Library of Neriak.");
    quest::summonitem(10791);
    quest::faction(442,  10);
    quest::faction(291, -10);
    quest::exp(1000);
  }

} 