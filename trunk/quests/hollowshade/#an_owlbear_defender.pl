#Owlbear war defenders

my $local_total=0;

my %AggroText = (
  1 => "growls as it senses the presence of an outsider.",
  2 => "lunges forward, paws in the air seeking your flesh.",
  3 => "sniffs the air, picking up the scent of a threat."
);

my %DeathText = (
  1 => "collapses, its fur matted with blood.",
  2 => "defiantly tries to make one final swipe at you with its claws.",
  3 => "roars a final roar."
);

sub EVENT_AGGRO 
	{ 
	my $RandomNumber = int(rand(3)) + 1;
	quest::emote("$AggroText{$RandomNumber}");
	}

sub EVENT_DEATH_COMPLETE {
	$local_total =  $qglobals{DeadDefenderCount}+1;
  	quest::setglobal("DeadDefenderCount", $qglobals{DeadDefenderCount}+1, 7, "F"); # how many dead

	# Need to test local_total - refresh of global based on above set not
	# fast enough.

	if ($local_total >= 5)
		{
		# Defenders are down - send signal.
		quest::signalwith(166257, 1, 0);
		}
  my $RandomNumber = int(rand(3)) + 1;
  quest::emote("$DeathText{$RandomNumber}");
}
