sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, $name. It cannot be that you would present yourself before me without reason. What brings you to these lands on this day? Please be quick for I have many ancient runes I must study.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 1908 => 1)) { #Jualicn's Token
    quest::say("$name, whom Relinar found to be necessary for the success of the magic against those foul giants. I present this Rune of Concentration to you with faith that you are trusted amongst us or you would not have been sent to me. Make haste so that no time is wasted in extracting revenge for their past transgressions.");
    quest::faction(42,10);   #Claws of Veeshan
    quest::faction(362,10);  #Yelinak
    quest::faction(189,-30); #Kromzek
    quest::exp(1000);
    quest::summonitem(1896); #Rune of Concentration
    if(!plugin::check_hasitem($client,1893) || !plugin::check_hasitem($client,1894) || !plugin::check_hasitem($client,1895)) {
      quest::summonitem(1908); #Jualicn's Token
    }
    quest::depop_withtimer();
  }
  else {
    quest::say("I have no need for this item, $name, you can have it back.");
    plugin::return_items(\%itemcount);
  }
}

#NpcID: 120019 - NpcName: Draazak - Zone: westwastes