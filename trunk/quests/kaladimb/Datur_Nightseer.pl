sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to our temple.  We are the paladins of the Church of Underfoot.  I am lord of our holy order.  I call upon you to assist us in the defense of Kaladim.  Speak with the master paladins or priests and find ways to prove your allegiance to Brell."); }
}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 18768 => 1)){
quest::summonitem(13514);
quest::faction(44, 4);
quest::faction(169, 4);
quest::faction(246, 4);
quest::faction(351, 4);
}
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:kaladimb  ID:67029 -- Datur_Nightseer 
