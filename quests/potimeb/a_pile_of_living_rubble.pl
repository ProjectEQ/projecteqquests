sub EVENT_DEATH {
    my $x = $npc->GetX();
    my $y = $npc->GetY();
    my $z = $npc->GetZ();
    my $h = $npc->GetHeading();
    quest::signalwith(223186,14018,0);
    quest::spawn2(223147,0,0,$x,$y + 5,$z,$h); #a rock shaped assassin
    quest::spawn2(223147,0,0,$x,$y - 5,$z,$h);
    quest::spawn2(quest::ChooseRandom(0,223147),0,0,$x,$y + 10,$z,$h);
    quest::spawn2(quest::ChooseRandom(0,223147),0,0,$x,$y - 10,$z,$h);
}

sub EVENT_SIGNAL {
  if ($signal == 66) {
    quest::depop();
}
 }

