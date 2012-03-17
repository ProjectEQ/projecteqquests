sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::emote("glowers at you dubiously as though wondering what it is your tombstone might say.");
  }
  if($text=~/marais/i) {
    quest::say("Do you have my ring? No? Then quit your yammering.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 29849 => 1)) { #Promise Ring
    quest::say("Aye, this is it, did you kill her? Well anyway, here, I really didn't want this anymore- I was hoping some fool would give me something of value for it. Thanks.");
    quest::summonitem(29850); #Rifkin's Diary - sealed
  }
  else { 
    plugin::return_items(\%itemcount); 
  }
}

#END of FILE Zone:shadowhaven ID:150070 -- Rifkin