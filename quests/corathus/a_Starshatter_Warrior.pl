sub EVENT_SPAWN
{
	if($npc->GetSpawnPointID() == 76224 || $npc->GetSpawnPointID() == 76225)
	{
		quest::modifynpcstat("aggro", 17);
	}
}