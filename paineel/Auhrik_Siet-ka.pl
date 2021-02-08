#BeginFile: Auhrik_Siet`ka.pl
#Quest for Paineel - Auhrik Siet`ka: Neonate Cowardice
# items: 17802, 14041, 12993
sub EVENT_SAY {
  if($text=~/understand common/i) {
    quest::say("Of course you do. Now, listen carefully. It may be too much for your feeble mind to gather all at once, and I hate to repeat myself. Bring me one bat wing, one rat ear, one snake egg, and one fire beetle eye. Take this bag, and make sure it's sealed before you return it to me. Snake eggs spoil. Now, quit staring at me with your jaw hanging open like a dead codfish. I would have mistaken you for one, but dead codfish smell better. Haha!");
    quest::summonitem(17802); #Small Sealable Bag
  }
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 14041 => 1)) { #A Rolled Up Note
    quest::say("Why are you giving this to me? Oh I see. I forgot that rats don't know how to read. Haha! Well, then. I shall read it for you. You do [understand common] don't you? Haha.");
  }
  elsif(plugin::check_handin(\%itemcount, 12993 => 1)) { #Small Sealed Bag
    quest::say("My revenge has been satisfied. Thank you, my child. You have proven yourself to be a most worthy asset to our cause. Here, I no longer have any use for this, my ties to the old life are now severed.");
    quest::exp(2000);
    quest::givecash(5,3,0,0);
    quest::faction(265,5);  #Heretics
    quest::faction(242,-5);  #Deepwater Knights
    quest::faction(254,-5); #Gate Callers
    quest::faction(231,-5);  #Craftkeepers
    quest::faction(233,-5);  #Crimson Hands
  }
  plugin::return_items(\%itemcount);
}
#EndFile: Auhrik_Siet`ka.pl
