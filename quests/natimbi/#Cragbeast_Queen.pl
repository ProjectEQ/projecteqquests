#BEGIN FILE: natimbi\#Cragbeast_Queen.pl (280080)

my $event = 0;

sub EVENT_SPAWN {
  if ($zonehour >= 2) {
    quest::depop();
  }
  else {
    quest::settimer("CBQ", 10);
    quest::ze(15,"A muffled roar echoes in the distance.");
  }
}

sub EVENT_TIMER {
  if (($zonehour >= 2) && ($event == 0)) {
    quest::stoptimer("CBQ");
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
#END of FILE zone:natimbi ID:280080 -- #Cragbeast_Queen.pl