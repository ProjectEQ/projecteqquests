################## SPEECH CODE ##################

sub EVENT_SAY {
  if($text =~ /Hail/i) {
    quest::say("Greetings, friend! I am Bubar, merchant from the burning sands. You must be thirsty or, perhaps, hungry. Please look over my goods.");
  }
}

################### ITEM CODE ##################

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12351 => 1, 12352 => 1, 12350 => 1)) {
    quest::say("Mmmph!!.. *Pop!!* Ouch, my thumb!! Here you are. You had a gem inside.");
    quest::ding();
    quest::summonitem(12349);
    quest::exp(15000);
  }
   quest::say("I need at least two of the case keys and the gem case.");
   plugin::return_items(\%itemcount);
}
   
#EOF -- ZONE: ecommons -- NAME: Bubar -- ID: 22033

