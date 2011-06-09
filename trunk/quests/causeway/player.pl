#BeginFile: causeway\player.pl
#Quest file for Nobles Causeway - Tarlang: Spawn Chest during Necromancer Epic 1.5 (Soulwhisper)
sub EVENT_ENTERZONE {
if (defined $qglobals{whimsy}) {
quest::delglobal("whimsy");
}
if($hasitem{69059}) { 
  quest::settimer(1,72);
  }
}
sub EVENT_TIMER  {
$whimsy_count++;
if($whimsy_count == 1) {
 quest::setglobal("whimsy",1,5,"F");
 }
if($whimsy_count == 2) {
 quest::setglobal("whimsy",2,5,"F");
 }
if($whimsy_count == 3) {
 quest::setglobal("whimsy",3,5,"F");
 }
if($whimsy_count == 4) {
 quest::setglobal("whimsy",4,5,"F");
 }
if($whimsy_count == 5) {
 quest::setglobal("whimsy",5,5,"F");
 }
if($whimsy_count == 6) {
 quest::setglobal("whimsy",6,5,"F");
 }
if($whimsy_count == 7) {
 quest::setglobal("whimsy",7,5,"F");
 }
if($whimsy_count == 8) {
 quest::setglobal("whimsy",8,5,"F");
 }
if($whimsy_count == 9) {
 quest::setglobal("whimsy",9,5,"F");
 }
if($whimsy_count == 10) {
 quest::setglobal("whimsy",10,5,"F");
 quest::stoptimer(1);
 }
}

sub EVENT_LOOT {
  if(($looted_id == 55855) && ($corpse eq "#Tarlang") && (defined($qglobals{Soulwhisper}) && ($qglobals{Soulwhisper} == 3))) { #Tarlang's Head
    $x = $client->GetX();
    $y = $client->GetY();
    $z = $client->GetZ();
    quest::spawn2(303120,0,0,$x,$y,$z,0); #a chest (Tarlang)
  }
}
#EndFile: causeway\player.pl