sub EVENT_SPAWN
{
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10);
}

sub EVENT_ENTER
{
   quest::spawn2(228113,0,0,0,0,0,0);
   quest::depop_withtimer();
} 