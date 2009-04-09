sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 1671 => 1)){ #Part of Shaman Epic 1.0
  quest::emote("looks down at the icon in his hands for a long moment before speaking. 'Why did you bring me this? Are you here to accuse me of the queen's death?' High Scale Kirn chuckles venomously and continues, 'I am High Scale and beyond your petty laws. However, I wish the truth to be known. On my hand is a ring. If you can take it from me, show it to the queen and she will remember. However, I will not give up the ring easily. Defend yourself!");
  quest::exp(100000);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(39083,0,0,$x,$y,$z,$h);
  quest::depop();
 }  
}

#Submitted by: Jim Mills (Gilmore Girls`Is`Awesome`XOXO)