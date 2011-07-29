my $emote = 0;
sub EVENT_SPAWN {
  quest::set_proximity($x-70,$x+120,$y-180,$y+180);
}

sub EVENT_ENTER {
  quest::settimer(1,3);
  quest::ze(15,"As you step into the room, all combat stops and every eye turns to you. The champion in the center finishes his opponent and yells 'HOLD!' stopping the Muramites before they can charge.");
}

sub EVENT_TIMER {
  if ($timer == 1) {
    if ($emote == 0) {
	  quest::say("Look what we have here, boys? One of them softies found its way into our pit. What is it that we do with softies again?");
	} elsif ($emote == 1) {
	  quest::ze(15,'The cry goes up from the crowd, "KILL THEM!"');
	} elsif ($emote == 2) {
	  quest::say("Yeah! We kill them! But, this here's a combat pit and I've been thinkin...");
	} elsif ($emote == 3) {
	  quest::say("Them softies always travel in big packs, but I bet they're real weak by themselves.");
	} elsif ($emote == 4) {
	  quest::ze(15,"A mix of cheers and laughter comes out of the gathering crowd.");
	} elsif ($emote == 5) {
	  quest::say("They probably crumble like a rag doll the first time they go toe-to-toe with a real warrior.");
	} elsif ($emote == 6) {
	  quest::say("I bet this one here can't even take the runt!");
	} elsif ($emote == 7) {
	  quest::ze(15,"The crowd bursts into jeers as a wretched creature pulls itself out of the pond and cowers before the champion.");
	  quest::spawn2(297209,0,0,-27,0,-439,66);
	} elsif ($emote == 8) {
	  quest::say("Go on, show us what you're made of! Just you and the runt. No pets, no friends, no healing, no nuttin! You win and you can walk away with your head still on your shoulder. But I warn you, we don't take kindly to cheaters.");
	  quest::stoptimer(1);
	} else {
	  $emote = 0;
	}
	$emote++;
  }
}