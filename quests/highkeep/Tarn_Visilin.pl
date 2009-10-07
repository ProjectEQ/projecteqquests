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
    quest::say("Hello. I am Tarn Visilin.");
  }
}

sub EVENT_ITEM {
  if(($gold >= 50) && plugin::check_handin(\%itemcount, 10086 => 1)) { #Gold x 50, Glamour Stone
    quest::say("Here is your stone, fully enchanted."); #Made this text up
    quest::summonitem(10087); #Glowing Glamour Stone
  }
  elsif(plugin::check_handin(\%itemcount, 10019 => 1)) { #Bloodstone
    quest::say("I see that Sultin has sent you to me.  Very well, here are your gloves."); # Made this text up
    quest::summonitem(2355);  # Gleaming Gloves
  }
  elsif(plugin::check_handin(\%itemcount, 10790 => 1)) { #Coin of Tash
    quest::say("The Coin of Tash. Very good. I have laid a basic enhancement on it - to get it further enhanced you must take the coin to Mizn N'Mar in the Library of Neriak.");
    quest::summonitem(10791); #Glowing Coin of Tash
    quest::faction(442, 10);  #Temple of Sol Ro
    quest::faction(291, -10); #Shadowed Men
    quest::exp(1000);
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}