sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail traveler. may I assist you with something. or are you just [passing through]?");
}
if($text=~/passing through/i){
quest::say("Very well friend. please take care when passing beyond the river to the east.  Several researchers and their mercenary escort passed through our camp en route to the temple.  That was last week and they have yet to return.  We are holding off on our expedition until we can [learn more] about what happened to them."); }
if ($text=~/learn more/i) { #made up
  quest::say("We are not sure exactly what happened to them. They were researching an ancient ritual performed by the lizards. It is rumored to summon the very dead to walk again. Should you dare to venture inside the temple, should you discover anything about this I would greatly appreciate it.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 8720 => 1)) {
  quest::summonitem(8732);
  quest::say("Thank You. This is most interesting. I must study it immediatly"); #made up
  quest::exp(100000);  
  }
}
#END of FILE Zone:feerrott  ID:47132 -- Aqaar_Aluram 

