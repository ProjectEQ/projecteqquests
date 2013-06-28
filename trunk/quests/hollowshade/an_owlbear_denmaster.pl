#Generic Owlbear Script

my %AggroText = (
  1 => "assails you with a deafening shriek!",
  2 => "catches sight of an enemy and ruffles its feathers in anger.",
  3 => "emits a loud screech, vibrating the ground at your feet.",
  4 => "snaps its powerful beak."
);

my %DeathText = (
  1 => "emits a muffled screech as it collapses.",
  2 => "twitches as life fades from its round yellow eyes."
);

sub EVENT_AGGRO {
  my $RandomNumber = int(rand(4)) + 1;
  quest::emote("$AggroText{$RandomNumber}");
}

sub EVENT_DEATH_COMPLETE {
  my $RandomNumber = int(rand(2)) + 1;
  quest::emote("$DeathText{$RandomNumber}");
}