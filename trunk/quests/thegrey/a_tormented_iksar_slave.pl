# event_aggro text

#sub EVENT_SAY { 
#if($text=~/attack a_tormented_iksar_slave07/i){
#quest::say("Death shall enslave you. as it has me!"); }
#}

sub EVENT_AGGRO {
  quest::say("Death shall enslave you, as it has me!");
}

#END of FILE Zone:thegrey  ID:171031 -- a_tormented_iksar_slave 

