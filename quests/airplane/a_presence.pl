sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("ignores you.");
 }
}

sub EVENT_ITEM {
 if((plugin::check_handin(\%itemcount, 1684 => 1)) && ($ulevel >= 46) && ($class eq "Monk")) {
  # Monk Epic 1.0
  quest::say("Hahaha! That dolt Eejag fell to the likes of you? Im not surprised. So, I guess this means you are here to challenge me. Normally, I wouldnt waste my time, but since you have defeated my younger brother, I suppose Im obligated.");
  quest::depop_withtimer();
  # Spawn: Gwan
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $h = $npc->GetHeading();
  quest::spawn2(71069,0,0,$x,$y,-8,$h);
 }
  else {
    quest::say("I have no need for this, $name.");
    quest::return_items(\%itemcount);
  }
}
# End of File