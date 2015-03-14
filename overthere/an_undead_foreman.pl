sub EVENT_SAY {
 if($text=~/hail/i){
  # The New Worker [Part 1]
  quest::me("an undead foreman turns to face you. You can see a faint green glow emanating from his vacant eye sockets.");
  quest::say("Are you a [new worker]? Huh? Speak or go!!");
 }
 elsif($text=~/new worker/i){
  # The New Worker [Part 2]
  quest::say("Hmmph!! Too much flesh!! If you want to work, you must first fill my eye sockets with my favorite gem. This shall be your payment for your sledgehammer.");
 }
}

sub EVENT_ITEM {
 #Handin: 1x Jade (10023)
 if($faction <= 4){
 if(plugin::check_handin(\%itemcount, 10023 => 1)){
 }  else {
      plugin::return_items(\%itemcount);
      return 1;
    }
  # The New Worker [Part 3][End]
  quest::me("an undead foreman places the gem deep within his hollow eye socket. He pulls a giant sledgehammer from thin air and hands it to you.");
  quest::say("Here!! You shall be assigned to the lower decks of the Scaled Trident.");
  #Summon: a worker sledgemallet (12863)
  quest::summonitem(12863);
 }
  else {
    quest::say("I do not know you well enough to entrust such an item to you, yet.");
  }
}


#Quest: The New Worker (Submitted By: Senzo)
