#This will spawn an aggro version of Neh`Ashiir (which will drop the shaman epic diary instead of her normal loot) upon a hand in.

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 1681 => 1)){ #Part of Shaman Epic 1.0
  quest::say("Nothing is left to hide now. You shall have the truth. But truth is not won easily and if you cannot defeat me, you have not the ability to see that vengeance is served. Brace yourself!");
  quest::faction(342,50);
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  my $h = $npc->GetHeading();
  quest::spawn2(90181,0,0,$x,$y,$z,$h);
  quest::depop();
 }  
}

#Submitted by: Jim Mills (Gilmore Girls`Is`Awesome`XOXO)