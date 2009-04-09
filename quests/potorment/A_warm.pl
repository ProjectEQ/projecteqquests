sub EVENT_SPAWN {
  my $x = $npc->GetX();
  my $y = $npc->GetY();
  my $z = $npc->GetZ();
  quest::set_proximity($x - 21, $x + 21, $y - 100, $y + 100, $z - 50, $z + 50);
}

sub EVENT_ENTER {
     quest::movepc(207,-16,-49,452);
}

sub EVENT_SIGNAL {
{
  quest::depop();
}
}