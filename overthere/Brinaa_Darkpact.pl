sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Hello, $name. It's nice to see more able bodies around this part of the outland. We came here in search of the magical powers that are supposed to exist in the ruins and dungeons of this area. We need you to bring back evidence of this power in the form of scrolls. I can't offer much coin in payment, but I do have some rare scrolls I already brought back that may interest you, if you wish to [help in the search].");
  }
  if($text=~/help in the search/i){
    quest::say("Excellent! Here is what we are still seeking. The scrolls of Death Pact. Upheaval. Yaulp IV. and Reckoning. If you return one of these to me. I'll release one of my rare scrolls to you.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19203 => 1) ||
      plugin::check_handin(\%itemcount, 19205 => 1) ||
      plugin::check_handin(\%itemcount, 19209 => 1) ||
      plugin::check_handin(\%itemcount, 19212 => 1)) {
    quest::say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");      
    quest::summonitem(quest::ChooseRandom(19210,19224,19420,19206));
    quest::exp(1000);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:overthere  ID:93103 -- Brinaa_Darkpact 

