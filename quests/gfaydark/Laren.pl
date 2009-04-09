sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome. my friend!  What is it you seek from Laren and the Scouts of Tunare?"); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:gfaydark  ID:54085 -- Laren 
