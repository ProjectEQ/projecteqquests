# Romar Sunto
# Location: soltemple - Temple of Sol Ro
# npcID: 80026
# spawngroupID: 80030
# Quests:
#    Part of quest for Darkwood Staff by Mystic414
#    Part of quest for Spell: Tashania   by darkonig

sub EVENT_SAY {
  if($text=~/hail/i) {
   quest::say("I am Romar Sunto, servant of Solusek Ro. I am searching for the [Coin] of the mighty enchanter [Tash] - if you are interested in helping me acquire it, I will [reward] you with a powerful spell. I am also dispenser of [Darkwood Staves] - sometimes also called the Staff of Ro.");
  }

  elsif($text=~/darkwood staves/i) {
   quest::say("Bring me a Lambent Stone from a Hill Gant, a Sand Giant or a Griffon and I will give you a Darkwood Staff.");
  }

  elsif($text=~/tash/i) {
   quest::say("Tash was a mighty enchanter and a master jewelcrafter.");
  }

  elsif($text=~/coin pouch/i) {
    quest::say("I will gladly lend you this coin pouch - put all 10 antique silver coins into it and combine them into the Coin of Tash.");
    quest::summonitem(17511); # A coin pouch - to combine the coins in
  }
 
  elsif($text=~/coin/i) {
    quest::say("Tash had a collection of ten antique silver coins that were left in different cities around the world. If you were to collect all 10 coins, I would give you a [coin pouch] that would let you combine them into the master Coin of Tash. If you are interested I will sell you a copy of the Tome of Tash, detailing where the coins were reportedly left, for a mere 50 gold.");
  }

}

sub EVENT_ITEM {
  # Darkwood Staff
  if($itemcount{10000} == 1) {
    quest::say("Very well, $name.  Here is your staff."); # Made this text up
    quest::summonitem(6048);
    quest::faction("320","15");
    quest::faction("291","-15");
    quest::exp(1000);
  }

  # Tashania Quest
  # items needed:
  #     10793 Radiant Coin of Tash
  # items received:
  #     15678 Spell: Tashania
  # plus faction received:
  #     442   Temple of Sol Ro
  # minus faction received:
  #     291   Shadowed Men
  # experience received:
  #     1000
  elsif($itemcount{10793} == 1) {
    quest::say("The Coin of Tash - fully enchanted! I am in your debt. Here is the scroll of Tashania that was promised to you.");
    quest::summonitem(15678);
    quest::faction(442,  10);
    quest::faction(291, -10);
    quest::exp(1000);
  }

  # Tashania Quest
  # items needed:
  #     10790 Coin of Tash
  # items received:
  #     10790 Coin of Tash
  # plus faction received:
  #     none
  # minus faction received:
  #     none
  # experience received:
  #     none
  elsif($itemcount{10790} == 1) {
    quest::say("The Coin of Tash. It is of no use to me like this. You must take the coin to Tarn Visilin in High Keep to get it enchanted.");
    quest::summonitem(10790);
  }

 elsif($gold >= 50) {
    quest::summonitem(18032);
    
    }
}
