# This is to spawn a lesser spirit upon the Capn's death for Shaman epic 1.0

sub EVENT_AGGRO{
	quest::say("Dead men tell no tales!!");
}

sub EVENT_DEATH {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(69149,0,0,$x,$y,$z,$h);
  quest::say("You have run me through!  Beware the Pirates of Gunthak.. They will avenge me... Unngh!!");
}


#Submitted by: Jim Mills