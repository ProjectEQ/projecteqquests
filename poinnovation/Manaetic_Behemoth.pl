my $goactive = 0;
my $first_signal = 0;

sub EVENT_SPAWN {
  $first_signal = 0;
  $goactive = 0;
}

sub EVENT_SIGNAL {
  #signal 1 is from the spiders.
  if($signal == 1 && $first_signal == 0) {
    #timer to increment $goactive
    quest::settimer(1,5);
    $first_signal = 1;
  } elsif($signal == 1 && $first_signal == 1) {
    #if we received a signal and it was not the first signal reset goactive back to 0
    $goactive = 0;
  }
}

sub EVENT_TIMER {
  if($timer == 1) {
    #increment $goactive
    $goactive++;
    #now check if we have been incrementing for 3 minutes.
    #increments at +1 per 5 seconds means $goactive == 36 is 3 minutes.
    if($goactive == 36) {
      quest::stoptimer(1);
      BEGIN_MB_EVENT();
    } elsif($goactive > 36) {
      #reset all the counters and start over something went wrong
      $first_signal = 0;
      $goactive = 0;
    }
  }
}

sub BEGIN_MB_EVENT {
  #spawn the targetable version and depop untargetable version.
  quest::spawn2(206074,0,0,$x,$y,$z,0);
  #depop with respawn timer active.
  quest::depop_withtimer();
}