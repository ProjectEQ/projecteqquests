#This fallen monk will spawn the fallen monk master when we give him our Shackle of Tynnonium. This is part of the Whistling Fists quest line.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::emote("Failed to find the rest I have. If you wish what is mine then give proof of the final shackle unto me.");
 }
}

sub EVENT_ITEM {
  if($itemcount{4199} == 1){
  quest::say("Earn what is mine. Show me you have the power worthy to wield what I possess.");
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(89183,0,0,$x,$y,$z,$h);
  quest::depop_withtimer();
 }
 plugin::return_items(\%itemcount);
}

#Submitted by: Jim Mills