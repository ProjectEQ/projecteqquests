
sub EVENT_SPAWN
{
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
}

sub EVENT_ENTER
{
   quest::movepc(27,-12.72,113.31,-62.95);
} 