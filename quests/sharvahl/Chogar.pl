sub EVENT_SPAWN {
 quest::settimer(1,10);
}

 sub EVENT_TIMER {
 if($timer eq "1") {
  $npc->SetAppearance(1);
  quest::stoptimer(1);
 }
}


sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello. Would you care to dabble in the art of ceramics? My prices are quite fair. Feel free to make use of my pottery wheel if you would like to try your hand in the art.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 5955 => 1)) { #Vase Pieces
    quest::say("I can do nothing to repair this mess, but a skilled potter like you should be able to create a new one with little trouble. One second please. I'll jot a rough sketch of what I surmise the original looked like when it was intact. You can take the sketch and make a new one. It will require of you a medium sized block of clay, a little water, and this sketch. Here you go. The sketch is a little crude, but I am sure that it will suffice. Fire it with a quality firing sheet and give the resulting product to Gawfed. Jihli told me that he was eager to receive it.");
    quest::summonitem(5956); #Rough Vase Sketch
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:sharvahl  ID:155181 -- Chogar