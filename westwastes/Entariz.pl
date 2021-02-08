# items: 1908, 1893
sub EVENT_SAY {
  if ($faction <= 3) {
    if($text=~/hail/i) {
     quest::say("Greetings, $name. I have heard that one is amongst us in the lands which will aid us in our cause. If you are the one that seeks my ancient rune for your studies please make sure it is not used in vain. I do not talk to many that pass through here and I feel in my heart that it is you that shall help us.");
    }
    if($text=~/ancient rune/i) {
     quest::say("This rune is very powerful and I will not release it to just anyone. Are you the one that Jualicn sends?");
    }
    if($text=~/jualicn sends/i) {
     quest::say("That is excellent. Jualicn is very wise indeed however he does not send just anyone on such an important task. If you are the one that he has informed me will come I am sure he must have given you something to present to me.");
    }
  }
  else {
    quest::say("You seem like a decent sort for a snack food, but there is nothing you can do for me this day.  Come back when you have done more work for the Claws.");
  }
}

sub EVENT_ITEM {
  if ($faction <= 3) {
  if(plugin::check_handin(\%itemcount, 1908 => 1)){ #Jualicn's Token
    quest::say("Ah of course, $name. You will need a Rune of Eradication for your lexicon. We are counting on your loyalty. Remember that you will need to bring the teachings of Relinar to Lawyla for further instructions, as she requires them to pass on the magic to those worthy of it. I bid you farewell, $name.");
    quest::faction(430,10);   #Claws of Veeshan
    quest::faction(436,10);  #Yelinak
    quest::faction(448,-30); #Kromzek
    quest::exp(1000);
    quest::summonitem(1893); #Rune of Eradication
    if(!plugin::check_hasitem($client,1894) || !plugin::check_hasitem($client,1895) || !plugin::check_hasitem($client,1896)) {
      quest::summonitem(1908); #Jualicn's Token
    }
    quest::depop_withtimer();
  }
  }
  plugin::return_items(\%itemcount);
}

#NpcID: 120018 - NpcName: Entariz - Zone: westwastes
