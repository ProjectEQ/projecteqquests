sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello there. $name. I am responsible for all of the newly recruited Defenders of the Haven. I make sure that our soldiers are trained well and ready for any conflict that may present itself. All of those that pass though my training exercises are sure to be the best of the best."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:shadowhaven  ID:150190 -- Garon_Battlehand 
