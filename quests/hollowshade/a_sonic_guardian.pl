#Generic Sonic Wolf Script

my %AggroText = (
  1 => "growls as it senses the presence of an outsider.",
  2 => "lunges forward, saliva dripping from its fanged jaw.",
  3 => "sniffs at the ground, picking up the scent of a threat."
);

my %DeathText = (
  1 => "collapses, its fur matted with blood.",
  2 => "defiantly tries to make one final swipe at you with its claws.",
  3 => "whines pitifully as an attack cuts his life short."
);

sub EVENT_AGGRO { 
  my $RandomNumber = int(rand(3)) + 1;
  quest::emote("$AggroText{$RandomNumber}");
}

sub EVENT_DEATH {
  my $RandomNumber = int(rand(3)) + 1;
  quest::emote("$DeathText{$RandomNumber}");
}