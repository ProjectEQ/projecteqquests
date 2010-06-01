sub EVENT_SPAWN  {
quest::settimer(1,600);
}

sub EVENT_SAY {
if($text=~/Hail/)
	{
	quest::setglobal("god_vxed_access", 1, 5, "F");
	$client->Message(4,"You receive a character flag!");
	}
if($text=~/Hail/)  {
  if (defined $qglobals{bic} && $qglobals{bic} == 10) {
  quest::summonitem(67526);
  quest::setglobal("bic",11,5,"F");
}
}
}

sub EVENT_TIMER {

if($timer == 1)
	{
	quest::depop;
	}
}