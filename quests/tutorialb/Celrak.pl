# Emotes
# Zone: Tutorialb

sub EVENT_SPAWN
{
	$x = $npc->GetX();
	$y = $npc->GetY();
	quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER
{
  quest::setglobal("$name",1,3,"F");
  $name=undef;
}