sub EVENT_SPAWN
{
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
}

sub EVENT_ENTER
{
    if(($client->GetClientVersionBit() & 2147483660)!= 0)
	{
		quest::MovePCInstance(25, 1, 778.8, 2226.3, 22.4, 150.4);
	}
	else
	{
		quest::movepc(25,472.29,2952.41,-11.39);
	}
} 