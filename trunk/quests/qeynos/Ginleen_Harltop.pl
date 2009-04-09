sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail!  Keep all combat to the center of the ring. So says [Ebon Strongbear].");
}
if($text=~/who is ebon strongbear/i){
quest::say("Ebon Strongbear is the current champion of the Steel Warriors. As champion, he rules over the Steel Warriors."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos  ID:1144 -- Ginleen_Harltop 
