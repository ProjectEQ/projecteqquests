use POSIX qw/floor/;

sub EVENT_SCALE_CALC {
  my $charKey = $client->CharacterID() . "-TL";
  my $charTargetsFaydwer = quest::get_data($charKey . "-F");
  my $charTargetsAntonica = quest::get_data($charKey . "-A");
  my $charTargetsOdus = quest::get_data($charKey . "-O");
  my $charTargetsLuclin = quest::get_data($charKey . "-L");
  my $charTargetsKunark = quest::get_data($charKey . "-K");
  my $charTargetsVelious = quest::get_data($charKey . "-V");
  
  my $factor = 5; 
  my $count = 0;
	

  $count = (
            ($charTargetsFaydwer =~ tr/://) + 
	    ($charTargetsAntonica =~ tr/://) + 
            ($charTargetsOdus =~ tr/://) + 
            ($charTargetsKunark =~ tr/://) + 
            (($charTargetsVelious =~ tr/://) * 2) +
	    (($charTargetsLuclin =~ tr/://) * 3)
            ) / $factor;

  $count = floor($count);

  if ($count <= 0) {
	$count = 1;
  }

  $questitem->SetScale($count);	
}
