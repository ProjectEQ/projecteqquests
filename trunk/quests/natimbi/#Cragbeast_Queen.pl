#BEGIN FILE: natimbi\#Cragbeast_Queen.pl (280080)

my $event = 0;

sub EVENT_SPAWN {
  quest::settimer("CBQ_Depop", 10);
  quest::ze(15,"A muffled roar echoes in the distance.");
}

sub EVENT_TIMER {
  if (($zonehour >= 2) && ($event == 0)) {
    quest::stoptimer("CBQ_Depop");
    quest::depop();
  }
}

sub EVENT_COMBAT {
  if ($combat_state == 0) {
    $event = 0;
  }
  else {
    $event = 1;
  }
}

sub EVENT_DEATH_COMPLETE {
  my $variance = 720; #Minute variance for respawn (Currently: 12 hours)
  my $new_time = int(rand($variance)) + 6840; #4 days 18 hours + 12 hour random to give us 5 day respawn with a 12 hour variance
  quest::setglobal("CBQ",1,3,"M$new_time");
}

#END of FILE zone:natimbi ID:280080 -- #Cragbeast_Queen.pl
