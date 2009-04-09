sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the mines of Kaladim!"); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:kaladimb  ID:67019 -- Mater 
