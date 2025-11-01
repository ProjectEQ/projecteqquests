#Agent of Chaos by Osious

sub EVENT_SAY {
my $harder = quest::saylink("harder",1);

  if ($text =~ /hail/i) {
	quest::say("Would you like to make trakanon $harder?");
	}
	
  if ($text =~ /harder/i){
	my $dz = quest::get_expedition();
	if (!$dz->HasLockout("Trakanon")) {
    quest::spawn2(89128, 0, 0, -679, -2133, -131, 0); # npc: Overlord_Mata_Muram
	quest::say("Trakanon is now harder.");
	quest::depop(89154); # depop normal trak if hes up
	quest::depop(89181); # depop undead bard trak
    } else {
	quest::say("You cannot spawn Trakanon, you are currently on a lockout timer.");
	}
  }
}