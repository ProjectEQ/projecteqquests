sub EVENT_SAY {
  if($text=~/hail/i){
   quest::say("Hello. I would shake your hand, but it would [hurt]. Ooooh! Owwy!");
  }
  if($text=~/hurt/i){
    #Bandages for Honeybugger (START)
    quest::say("I was attacked by the bixies. They swarmed on me!! I think I got too near their queen. I need that honey to make a living! Get me a bandage and I will tell you where all their worker bee's buzz around.");
  }
  if ($text=~/I need the honeycomb/i) {
    quest::say("If you're looking for the honeycombs, I don't have any right now. I have been unable to get any since I was attacked by the little [buggers]. I will tell you where to get some if you will only get me a bandage for my bites.");
  }
  if ($text=~/what buggers/i) {
    quest::say("I was attacked by the bixies. They swarmed on me!! I think I got too near their queen. I need that honey to make a living! Get me a bandage and I will tell you where all their worker bees buzz around.");
  }
}

sub EVENT_ITEM {
  my $bandage = 0;
  #Handin: Bandage
  if(plugin::check_handin(\%itemcount, 13009 => 4)){ $bandage=4;
  } elsif(plugin::check_handin(\%itemcount, 13009 => 3)){ $bandage=3;
  } elsif(plugin::check_handin(\%itemcount, 13009 => 2)){ $bandage=2;
  } elsif(plugin::check_handin(\%itemcount, 13009 => 1)){ $bandage=1;
  }
  if($bandage>=1){
    for($i=0; $i<$bandage; $i++){ 
      #Bandages for Honeybugger (END) 
      quest::say("Oh thank you, $name. If you are ever going to gather bixie honeycomb's pray you do not run into the queen. The only way I know of collecting the honey is by intercepting the drone's and taking the honeycomb's they sometime's carry. Good luck!!");
      quest::ding();
      quest::exp(10);
      quest::faction(77,10);   # +Deeppockets
      quest::faction(133,10);  # +Guardians of the Vale
      quest::faction(208,10);  # +Mayor Gubbin
      quest::faction(218,10);  # +Merchants of Rivervale
      quest::faction(369,-10); # -Coalition of Trade Folk III
     }
}
  plugin::return_items(\%itemcount);
}


#EOF

