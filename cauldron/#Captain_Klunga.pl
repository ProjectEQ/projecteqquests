sub EVENT_SPAWN {
	#:: Appearance 1 - Sit
	$npc->SetAppearance(1);
}

sub EVENT_ITEM {
	#:: Match a 12278 - Abandoned Orc Shovel
	if (plugin::takeItems(12278 => 1)) {
		#:: Appearance 0 - Stand
		$npc->SetAppearance(0);
		#:: Move to the specified location and guard 
		quest::moveto(-395.87, 807.04, 71.78, 0, 1);
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}

sub EVENT_WAYPOINT_ARRIVE {
	#:: Create a 12274 - Chalice of Conquest at specified coordinates (lower z to appear on ground)
	quest::creategroundobject(12274, -395.87, 807.04, 68, 0);
	#:: Create a proximity, 20 units across, 20 units tall, without proximity say
	quest::set_proximity($x - 10, $x + 10, $y - 10, $y + 10, $z - 10, $z + 10, 0);
}

sub EVENT_ENTER {
	quest::attack($name);
}
