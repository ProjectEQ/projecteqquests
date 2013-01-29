my $counter = 0;
#needs live text
sub EVENT_SPAWN {
  $counter = 0;
  quest::settimer(1,1800);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm hungry, I require hynid.");
  }
}

sub EVENT_TIMER {
  quest::emote("falls to the ground, dead.");
  quest::depop_withtimer();
}

sub EVENT_ITEM {
  #accepts items in the range: 58555 - 58637
  my $i = 0;

  for ($i = 58555; $i<=58637 ; $i++) {
    if($itemcount{$i}) {
	  my $c = $itemcount{$i};
      if (plugin::check_handin(\%itemcount, $i => $c )) {
        quest::faction( 363,5 * $c );
        quest::exp(100000 * $c );
        $counter += $c;
      }
    }
  }
  if($counter >= 11) {
    quest::depop_withtimer();
  }
  plugin::return_items(\%itemcount);
}