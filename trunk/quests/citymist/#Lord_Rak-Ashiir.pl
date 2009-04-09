#This will spawn an aggro version of Rak`Ashiir (who will drop the shaman epic scale instead of his normal loot) upon a hand in.

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 1673 => 1)){ #Part of Shaman Epic 1.0
  quest::emote("looks down at the tear in his hand and says 'A minion of my god came to me one night. I knew it was of Cazic-Thule as I was frozen in terror. My mind screamed for me to flee but my body would not respond. The being took my daughter and vanished to only he knew where. When I regained control of my body and thoughts, I felt nothing but betrayal. I don't care anymore about anything. If you want repentance then slay me, $name");
  quest::faction(342,100);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(90183,0,0,$x,$y,$z,$h);
  quest::depop();
 }  
}

#Submitted by: Jim Mills (Gilmore Girls`Is`Awesome`XOXO)