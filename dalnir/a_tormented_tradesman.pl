#The tormented tradesman is actually the skeleton/spirit of the Haggle Baron, Dalnir. Giving this skeleton the Mirror of Self Loathing will spawn Haggle Baron Dalnir so you can finish the Greenmist quest.
# items: 3889, 3896

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 3889 => 1)){ #Crusaders of Greenmist (Greenmist Quest 8/8)
  quest::emote("The undead entity looks in the mirror and appears to be stunned by the memory of his former self. He drops the mirror, which causes it to crack slightly. You immediately grab it and place it back in your bag. The spirit looks at you and begins to transform. Ethereal strands of muscle, blood, and flesh come together and the Haggle Baron Dalnir appears.");
  quest::summonitem(3896); # Item: Cracked Mirror of Self-Loathing
  quest::ding();
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(104075,0,0,$x,$y,$z,$h); # NPC: Haggle_Baron_Dalnir
  quest::depop_withtimer();
 }
  elsif(plugin::check_handin(\%itemcount, 3896 => 1)){ #Crusaders of Greenmist (Greenmist Quest 8/8)
  quest::emote("The undead entity looks in the mirror and appears to be stunned by the memory of his former self. He drops the mirror, which causes it to crack slightly. You immediately grab it and place it back in your bag. The spirit looks at you and begins to transform. Ethereal strands of muscle, blood, and flesh come together and the Haggle Baron Dalnir appears.");
  quest::ding();
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(104075,0,0,$x,$y,$z,$h); # NPC: Haggle_Baron_Dalnir
  quest::depop_withtimer();
 }
 plugin::return_items(\%itemcount);
}

#Submitted by Jim Mills