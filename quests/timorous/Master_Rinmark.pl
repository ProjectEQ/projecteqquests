#Master Rinmark is spawned from an iksar master in this zone and is part of the Test of Patience. Please see the iksar master's quest file for details.

sub EVENT_SPAWN {
  quest::settimer("Depop2",90);
}

sub EVENT_TIMER {
 if ($timer eq "Depop2") {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::emote("stares off into the horizon, lost in his thoughts.");
  quest::spawn2(96320,0,0,$x,$y,$z,$h);
  quest::stoptimer("Depop2");
  quest::depop();
 }
}

#Submitted by: Jim Mills