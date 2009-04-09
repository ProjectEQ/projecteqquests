# Angelox

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 90, $x + 90, $y - 90, $y + 90);
	quest::delglobal("krak");
	quest::setglobal("krak",2,3,"F");
	$krak=undef;
	quest::delglobal("lava");
	quest::setglobal("lava",2,3,"F");
	$lava=undef;
	quest::delglobal("kars");
	quest::setglobal("kars",2,3,"F");
	$kars=undef;
	quest::delglobal("bres");
	quest::setglobal("bres",2,3,"F");
	$bres=undef;
	quest::delglobal("hanr");
	quest::setglobal("hanr",2,3,"F");
	$hans=undef;
	quest::delglobal("grums");
	quest::setglobal("grums",2,3,"F");
	$grums=undef;
	quest::delglobal("razo");
	quest::setglobal("razo",2,3,"F");
	$razo=undef;
	quest::delglobal("peer");
	quest::setglobal("peer",2,3,"F");
	$peer=undef;
}

sub EVENT_ENTER
{
	quest::depop();
}
# EOF zone: nadox  Global Watcher