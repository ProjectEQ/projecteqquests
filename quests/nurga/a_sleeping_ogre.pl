sub EVENT_SPAWN {
$npc->SetAppearance(1);
}

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("yawns, and utters some gibberish, then falls back asleep.");
 }
}

sub EVENT_ITEM {
 if((plugin::check_handin(\%itemcount, 1685 => 1)) && ($ulevel>=46) && ($class=="Monk")){
  # Monk Epic 1.0
  quest::say("Your path of wanton destruction ends here, $name. Gwan and Eejag were impatient and hot-headed. You will not defeat me, for I have the patience and perseverance of stone, unlike the children you have beaten before me.");
  quest::depop();
  # Spawn: Trunt
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(107161,0,0,$x,$y,$z,$h);
 }
}
# End of File