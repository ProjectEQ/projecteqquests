my $counter = 0;
#needs live text
sub EVENT_SPAWN {
  $counter = 0;
  quest::settimer(1,1800);
}
  
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I'm emaciated, I require crab.");
  }
}

sub EVENT_TIMER {
  quest::emote("falls to the ground dead");
  $npc->Depop(1);
}

sub EVENT_ITEM {
  #accepts items in the range: 58288 - 58379
  my $i = 0;

  for ($i = 58288; $i<=58379 ; $i++) {
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
    $npc->Depop(1);
  }
  plugin::return_items(\%itemcount);
}