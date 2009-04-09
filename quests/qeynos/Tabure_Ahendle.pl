sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("What have we here?  Perhaps a future Ebon Strongbear?  A [member of the Steel Warriors]?  If the way of the warrior is not to your liking, might I suggest joining the League of Antonican Bards?  The only damage you might take there is a sore throat! HAHAHA!");
}
if($text=~/i am a member of the steel warriors/i){
quest::say("The Steel Warriors have no cause to dislike you, but you have yet to truly prove your worth to this guild."); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeynos  ID:1098 -- Tabure_Ahendle 
