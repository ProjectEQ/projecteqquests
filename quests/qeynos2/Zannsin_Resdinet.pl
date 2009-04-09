sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hey..  My name's Zannsin. but you can call me [Zan]."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos2  ID:2077 -- Zannsin_Resdinet 
