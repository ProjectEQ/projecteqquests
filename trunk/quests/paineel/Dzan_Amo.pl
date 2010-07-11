sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome to the Tabernacle of Terror. Perhaps you can control your fear long enough to be of [service] to us.");
  }
  if($text=~/service/i) {
    quest::say("I need some things fetched from the creatures just outside our city for some ritual experimentation. Bring me two tufts of bat fur and two fire beetle legs and I will school you in the ways of terror.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13069 => 2, 13250 => 2)) { #Bat Fur x 2, Fire Beetle Leg x 2
    quest::say("Very good young one. Here is something to assist in your studies of the principles of terror.");
    #quest::summonitem(); #Cleric scroll? Still need to figure out true reward.
    quest::faction(143, 5);  #Heretics
    quest::faction(79, -5);  #Deepwater Knights
    quest::faction(112, -5); #Gate Callers
    quest::faction(56, -5);  #Craftkeepers
    quest::faction(60, -5);  #Crimson Hands
    quest::exp(1000);
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:paineel  ID:75018 -- Dzan_Amo