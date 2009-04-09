# proximity trigger to spawn Tanik Greskil for 4th coldain prayer shawl
#

my $x;
my $y;
my $z;
my $exist;

sub EVENT_SPAWN {
  $x = $npc->GetX();
  $y = $npc->GetY();
  quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
  $x = $npc->GetX();
  $y = $npc->GetY();
  $z = $npc->GetZ();
  $exist = $entity_list->GetMobByNpcTypeID(116542);
  if ($exist) {
    quest::emote("in the snow.");
  }
  else {
    quest::emote("and uncover the body of an injured coldain.");
    quest::spawn2(116542,0,0,$x,$y,$z,0);
    quest::depop();
  }
}

# EOF zone: eastwastes ID: 116558 NPC: #You_stumble

