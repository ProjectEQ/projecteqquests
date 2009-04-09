#Tagrin Maldric is the blacksmith of the Zeks, and is part of obtaining Black Insanity (Zek bane) weapons. When aggro'd, he spawns 5 animated swords, who drop the actual ore for the bane weapons.

sub EVENT_SPAWN {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  my $counter = 0;
}

sub EVENT_AGGRO {
 quest::depopall(214119);
 quest::settimer(1,1);
 if(!defined $counter || $counter == 0){
  quest::spawn2(214119,0,0,$x-15,$y-15,$z,$h);
  quest::spawn2(214119,0,0,$x+15,$y-15,$z,$h);
  quest::spawn2(214119,0,0,$x-15,$y+10,$z,$h);
  quest::spawn2(214119,0,0,$x+15,$y+10,$z,$h);
  quest::spawn2(214119,0,0,$x,$y-15,$z,$h);
  $counter = 1;
 }
}

sub EVENT_TIMER {
 if($timer == 1 && $mob->IsEngaged()) {}
  else {
  quest::stoptimer(1);
  $counter = 0;
 }
}
sub EVENT_DEATH {
  my $counter = 0;
}

#Submitted by Jim Mills