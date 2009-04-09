sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello $name. it seems that you have caught me relaxing a bit on my off time at the tavern here. No matter. though if you are a bard in need of assistance. just let me know and we will get right to work."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Bard');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:shadowhaven  ID:150240 -- Darian_Shallowsong 
