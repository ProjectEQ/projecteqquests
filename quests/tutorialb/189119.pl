# Emotes
# Zone: Tutorialb

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
	quest::delglobal("amote");
	quest::setglobal("amote",3,3,"F");
	$amote=undef;
}

sub EVENT_ENTER
{
	quest::emote("A vast mine lays before you. From deep within the mine you can hear the clanging of pulleys and carts. It appears as though they are inhabited . . .");
	quest::depop();
	quest::delglobal("amote");
	quest::setglobal("amote",2,3,"F");
	$amote=undef;
}