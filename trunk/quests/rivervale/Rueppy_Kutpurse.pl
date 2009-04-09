sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello. $name.  Rueppy's my name.  Why don't you buy us something to [drink] and we can talk?");
}
if($text=~/what drink/i){
quest::say("How about a short beer?  That sounds good."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:rivervale  ID:19064 -- Rueppy_Kutpurse 
