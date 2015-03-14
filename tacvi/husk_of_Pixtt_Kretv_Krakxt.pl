sub EVENT_SPAWN {
quest::settimer("sleep",1);
quest::settimer("Poison",15);
$DeathCount = 0;
}

sub EVENT_TIMER {

if ($timer eq "sleep") {
quest::stoptimer("sleep");
$npc->SetAppearance(0);
$npc->SetAppearance(3);
}

if ($timer eq "Poison") {
if ($qglobals{Pixtt_Kretv_Krakxt} == 1) {
my $TimeA = quest::ChooseRandom(45);
quest::stoptimer("Poison");
quest::settimer("Poison", $TimeA);
quest::spawn2(298203,0,0,$x, $y, $z, 189.1);
  }
if ($qglobals{Pixtt_Kretv_Krakxt} == 2) {
my $TimeA = quest::ChooseRandom(40);
quest::stoptimer("Poison");
quest::settimer("Poison", $TimeA);
quest::spawn2(298203,0,0,$x, $y, $z, 189.1);
  }
if ($qglobals{Pixtt_Kretv_Krakxt} == 3) {
my $TimeA = quest::ChooseRandom(35);
quest::stoptimer("Poison");
quest::settimer("Poison", $TimeA);
quest::spawn2(298203,0,0,$x, $y, $z, 189.1);
  }
if ($qglobals{Pixtt_Kretv_Krakxt} == 4) {
my $TimeA = quest::ChooseRandom(30);
quest::stoptimer("Poison");
quest::settimer("Poison", $TimeA);
quest::spawn2(298203,0,0,$x, $y, $z, 189.1);
  }
}
  }
sub EVENT_SIGNAL {

if ($signal == 1) {
$DeathCount = $DeathCount + 1;
#quest::shout("Death Count $DeathCount"); 
  if ( ($qglobals{Pixtt_Kretv_Krakxt} == 1) && ($DeathCount == 4) )  {
  #quest::shout("Death Count up");
  quest::spawn2(298201,0,0, $x, $y, $z, $h);
  quest::depopall(298146);
  quest::depop();
  }
  if ( ($qglobals{Pixtt_Kretv_Krakxt} == 2) && ($DeathCount == 5) )  {
  #quest::shout("Death Count up");
  quest::spawn2(298201,0,0, $x, $y, $z, $h);
  quest::depopall(298146);
  quest::depop();
  }
  if ( ($qglobals{Pixtt_Kretv_Krakxt} == 3) && ($DeathCount == 6) )  {
  #quest::shout("Death Count up");
  quest::spawn2(298201,0,0, $x, $y, $z, $h);
  quest::depopall(298146);
  quest::depop();
  }
  if ( ($qglobals{Pixtt_Kretv_Krakxt} == 4) && ($DeathCount == 7) )  {
  #quest::shout("Death Count up");
  quest::spawn2(298201,0,0, $x, $y, $z, $h);
  quest::depopall(298146);
  quest::depop();
  }
}
}




