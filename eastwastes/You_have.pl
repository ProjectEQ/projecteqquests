# proximity trigger to spawn Kromrif Death Squad
#

my $x;
my $y;
my $z;

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20);
}

sub EVENT_ENTER {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  quest::emote("been ambushed!");
  quest::spawn2(116540,0,0,$x+5,$y-5,$z,0); # NPC: Kromrif_Death_Squad
  quest::spawn2(116540,0,0,$x-5,$y+5,$z,0); # NPC: Kromrif_Death_Squad
  quest::depop_withtimer();
}

# EOF zone: eastwastes ID: 116565 NPC: You_have

