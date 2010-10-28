#This is the true version of Shei. When aggro'd, 4 adds will spawn. If anyone is killed by this mob, a random mob (of 4 possible) will spawn.
my $adds;

sub EVENT_SPAWN {
   $adds = 0;
}

sub EVENT_AGGRO {
   if($adds == 0) {
       quest::spawn2(179161,0,0,-1714,1128,19.7,128);
       quest::spawn2(179147,0,0,-1715,1034,19.7,0);
       quest::spawn2(179160,0,0,-1771,1126,18.2,82);
       quest::spawn2(179142,0,0,-1769,1035,18.2,45);
       $adds = 1;
   }
}

sub EVENT_SLAY {
   my $a = quest::ChooseRandom(179161,179147,179160,179142);
   my $x = $npc->GetX();
   my $y = $npc->GetY();
   my $z = $npc->GetZ();
   my $h = $npc->GetHeading();
   quest::spawn2($a,0,0,$x,$y,$z,$h);
}

#Submitted by Jim Mills
#modified by Reno