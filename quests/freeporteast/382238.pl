sub EVENT_WAYPOINT_ARRIVE {
	if($wp == 14) {
		$x = $npc->GetX();
		$y = $npc->GetY();
		quest::set_proximity($x - 40, $x + 40, $y - 40, $y + 40);
	}
	if($wp ==15) {
		quest::clear_proximity();
	}
}

sub EVENT_ENTER
{
#	quest::selfcast("2279");
	quest::emote ("'s spirit moves you to another land ...");
	quest::movepc(69,-9193.3,386.7,5.2);
}
