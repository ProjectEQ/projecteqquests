sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Do I look like your best friend?!!  Well I'm not. bixie buster!!  You will address an officer with the word 'Hail' like every other deputy.  Stand up straight. hunchback. or you'll be patrolling Rivervale till dawn!"); }
}

sub EVENT_ITEM {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:rivervale  ID:19059 -- Marshal_Anrey 
