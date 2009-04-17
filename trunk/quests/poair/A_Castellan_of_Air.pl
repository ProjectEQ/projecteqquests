#This script causes the Castellans of Air to spawn 1-4 Vengeful Air Spirits on their death 95% of the time and to spawn Inlokher the Warlord 5% of the time.

sub EVENT_AGGRO {
 quest::emote("takes form with weapons drawn and begins to pursue you.");
}

sub EVENT_DEATH {
 quest::emote("'s corpse keels over and falls into numerous pieces of dented armor.");
 quest::signalwith(215483,0,0);
  my $Chance = quest::ChooseRandom(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
 if ($Chance == 20) {
  quest::spawn2(215064,0,0,$x,$y,$z,$h);
 }
 elsif ($Chance >= 1 && $Chance < 6) {
  quest::spawn2(215063,0,0,$x-5,$y,$z,$h);
 }
 elsif ($Chance >= 6 && $Chance < 11) {
  quest::spawn2(215063,0,0,$x-5,$y,$z,$h);
  quest::spawn2(215063,0,0,$x+5,$y,$z,$h);
 }
 elsif ($Chance >= 11 && $Chance < 16) {
  quest::spawn2(215063,0,0,$x-5,$y,$z,$h);
  quest::spawn2(215063,0,0,$x+5,$y,$z,$h);
  quest::spawn2(215063,0,0,$x,$y+5,$z,$h);
 }
 elsif ($Chance >= 16 && $Chance < 20) {
  quest::spawn2(215063,0,0,$x-5,$y,$z,$h);
  quest::spawn2(215063,0,0,$x+5,$y,$z,$h);
  quest::spawn2(215063,0,0,$x,$y+5,$z,$h);
  quest::spawn2(215063,0,0,$x,$y-5,$z,$h);
 }
}

#Submitted by Jim Mills