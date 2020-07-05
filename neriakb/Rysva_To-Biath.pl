#Rysva_To-Biath.pl
#Book of Turmoil
# items: 18200, 18201, 13846, 18202, 19071, 19070, 1000, 18302

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("Hello.  Let me know if I can get you a drink.");
	}
}
sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 18200 => 1)){#
		quest::say("Take this note and be gone with you.");
		quest::summonitem(18201);#a note (book of Turmoil, Text: TomeOfAges2)
		quest::faction(370, 10);#Dreadguard Inner
		quest::faction(334, 10);#Dreadguard Outer
		quest::faction(236, 10);#Dark Bargainers
	}
	elsif(plugin::check_handin(\%itemcount, 13846 => 1)){#Dark Elf Decapitated Head
		quest::say("Take this book and be gone with you.");
		quest::summonitem(18202);#Book of Turmoil
		quest::faction(370, 10);#Dreadguard Inner
		quest::faction(334, 10);#Dreadguard Outer
		quest::faction(236, 10);#Dark Bargainers
		quest::exp(72900);#10% of level 10 xp
		#The mob you kill for this quest is trivial at even level 10, or should be.  Giving a percentage of level 40
		#xp seems too much.
	}
    elsif(plugin::check_handin(\%itemcount, 19071 => 1, 19070 => 1) && $platinum >= 1000) {
        quest::summonitem(18302); # Item: Book of Scale
    }
  	plugin::return_items(\%itemcount);
}#END of FILE Zone:neriakb  ID:41042 -- Rysva_To`Biath 
