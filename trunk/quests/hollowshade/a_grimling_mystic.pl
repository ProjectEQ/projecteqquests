my %AggroText = (
  1 => "Don't run. Make this easier on both of us.",
  2 => "Don't worry, this will be quick.",
  3 => "I've always wanted to eat someone like you.",
  4 => "Interfere with our fishing will you? If you want to be eaten, you'll have to wait your turn!"
);

my %DeathText = (
  1 => "coughs up a bit of blood. 'You'll never escape us. . .'",
  2 => "says 'Tribesmen, we are under siege!'",
  3 => "screams as it collapses, 'Brothers and sisters, show no mercy to this outlander.'",
  4 => "staggers for a moment and then collapses."
);

sub EVENT_AGGRO { 
  quest::say($AggroText{int(rand(4)) + 1});
}

sub EVENT_DEATH_COMPLETE {
  quest::emote($DeathText{int(rand(4)) + 1});
}