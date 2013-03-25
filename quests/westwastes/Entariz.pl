sub EVENT_SAY {
  if($text=~/hail/i){
   quest::say("Greetings, $name. I have heard that one is amongst us in the lands which will aid us in our cause. If you are the one that seeks my ancient rune for your studies please make sure it is not used in vain. I do not talk to many that pass through here and I feel in my heart that it is you that shall help us.");
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 1908 => 1)){ #Jualicn's Token
    quest::say("Ah of course, $name. You will need a Rune of Eradication for your lexicon. We are counting on your loyalty. Remember that you will need to bring the teachings of Relinar to Lawyla for further instructions, as she requires them to pass on the magic to those worthy of it. I bid you farewell, $name.");
    quest::faction(42,10);   #Claws of Veeshan
    quest::faction(362,10);  #Yelinak
    quest::faction(189,-30); #Kromzek
    quest::exp(1000);
    quest::summonitem(1893); #Rune of Eradication
    if(!plugin::check_hasitem($client,1894) || !plugin::check_hasitem($client,1895) || !plugin::check_hasitem($client,1896)) {
      quest::summonitem(1908); #Jualicn's Token
    }
    quest::depop_withtimer();
  } 
  plugin::return_items(\%itemcount);
}

#NpcID: 120018 - NpcName: Entariz - Zone: westwastes