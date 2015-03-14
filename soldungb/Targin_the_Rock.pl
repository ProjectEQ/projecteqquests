sub EVENT_SAY { 
if ($text=~/Hail/i){
  quest::say("You have much to learn.' and 'Your actions and history are a personal affront to all I stand for.");
}
}

sub EVENT_ATTACK { 
quest::say("You have much to learn.' and 'Your actions and history are a personal affront to all I stand for.");	
}
#END of FILE Zone:soldungb  ID:4900 -- Targin_the_Rock 

