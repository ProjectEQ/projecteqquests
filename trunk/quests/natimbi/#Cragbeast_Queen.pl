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

sub EVENT_DEATH {
  my $variance = 240; #Minute variance for respawn (Currently: 4 hours)
  my $new_time = int(rand($variance)) + 6240;
  quest::setglobal("CBQ",1,3,"M$new_time");
}

#END of FILE zone:natimbi ID:280080 -- #Cragbeast_Queen.pl
