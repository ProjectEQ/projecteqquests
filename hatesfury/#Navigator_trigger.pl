sub EVENT_SPAWN
{
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 25, $x + 25, $y - 100, $y + 100);
}

sub EVENT_ENTER
{
   quest::spawn2(228107,0,0,0,0,0,0); # NPC: #Navigator_counter
   quest::depop_withtimer();
} 