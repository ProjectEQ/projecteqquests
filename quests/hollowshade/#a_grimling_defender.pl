#Grimling War defenders

my $local_total=0;

my %AggroText = (
  1 => "snarls and waves its arms as it senses the presence of an outsider.",
  2 => "leaps forward, anger on its face.",
  3 => "looks about, sensing a threat."
);

my %DeathText = (
  1 => "collapses, its body covered with blood.",
  2 => "defiantly pokes at you as it dies",
  3 => "cries out in pain as an attack cuts his life short."
);

sub EVENT_AGGRO 
	{ 
	my $RandomNumber = int(rand(3)) + 1;
	quest::emote("$AggroText{$RandomNumber}");
	}

sub EVENT_DEATH {

	$local_total = $qglobals{DeadDefenderCount}+1;

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
