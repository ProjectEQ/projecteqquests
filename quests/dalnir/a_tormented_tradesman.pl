#The tormented tradesman is actually the skeleton/spirit of the Haggle Baron, Dalnir. Giving this skeleton the Mirror of Self Loathing will spawn Haggle Baron Dalnir so you can finish the Greenmist quest.

sub EVENT_ITEM {
  if(($itemcount{3889} == 1)){ #Crusaders of Greenmist (Greenmist Quest 8/8)
  quest::emote("The undead entity looks in the mirror and appears to be stunned by the memory of his former self. He drops the mirror, which causes it to crack slightly. You immediately grab it and place it back in your bag. The spirit looks at you and begins to transform. Ethereal strands of muscle, blood, and flesh come together and the Haggle Baron Dalnir appears.");
  quest::summonitem(3896);
  quest::ding();
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(104075,0,0,$x,$y,$z,$h);
  quest::depop_withtimer();
 }
  elsif(($itemcount{3896} == 1)){ #Crusaders of Greenmist (Greenmist Quest 8/8)
  quest::emote("The undead entity looks in the mirror and appears to be stunned by the memory of his former self. He drops the mirror, which causes it to crack slightly. You immediately grab it and place it back in your bag. The spirit looks at you and begins to transform. Ethereal strands of muscle, blood, and flesh come together and the Haggle Baron Dalnir appears.");
  quest::ding();
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(104075,0,0,$x,$y,$z,$h);
  quest::depop_withtimer();
 }
 plugin::return_items(\%itemcount);
}

#Submitted by Jim Mills