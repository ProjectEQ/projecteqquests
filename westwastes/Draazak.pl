# items: 1908, 1896
sub EVENT_SAY {
  if ($faction <= 3) {
    if($text=~/hail/i) {
     quest::say("Greetings, $name. It cannot be that you would present yourself before me without reason. What brings you to these lands on this day? Please be quick for I have many ancient runes I must study.");
    }
    if($text=~/ancient rune/i) {
     quest::say("There are many that wish to gain our power through knowledge of the magic that we practice. I am afraid that I cannot simply give this treasure to just anyone. I must wait for the chosen that Jualicn speaks of only then can I release the rune I still carry from the great Relinar.");
    }
    if($text=~/jualicn/i) {
     quest::say("If you are truly sent from Jualicn then he must have surely given you something to present me.");
    }
  }
  else {
    quest::say("You seem like a decent sort for a snack food, but there is nothing you can do for me this day.  Come back when you have done more work for the Claws.");
  }
}

sub EVENT_ITEM {
  if ($faction <= 3) {
  if(plugin::check_handin(\%itemcount, 1908 => 1)) { #Jualicn's Token
    quest::say("$name, whom Relinar found to be necessary for the success of the magic against those foul giants. I present this Rune of Concentration to you with faith that you are trusted amongst us or you would not have been sent to me. Make haste so that no time is wasted in extracting revenge for their past transgressions.");
    quest::faction(430,10);   #Claws of Veeshan
    quest::faction(436,10);  #Yelinak
    quest::faction(448,-30); #Kromzek
    quest::exp(1000);
    quest::summonitem(1896); #Rune of Concentration
    if(!plugin::check_hasitem($client,1893) || !plugin::check_hasitem($client,1894) || !plugin::check_hasitem($client,1895)) {
      quest::summonitem(1908); #Jualicn's Token
    }
    quest::depop_withtimer();
  }
  }
  plugin::return_items(\%itemcount);
}

#NpcID: 120019 - NpcName: Draazak - Zone: westwastes
