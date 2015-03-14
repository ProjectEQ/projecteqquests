sub EVENT_SPAWN
{
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 5, $x + 5, $y - 5, $y + 5);
}

sub EVENT_ENTER
{
   quest::movepc(31,-485,-476,73);
} 