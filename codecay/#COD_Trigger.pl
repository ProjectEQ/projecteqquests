sub EVENT_SPAWN
{
quest::settimer(77,1); #1 hour depop
$high_priest=0;
}

sub EVENT_TIMER {
{
quest::stoptimer(77);
quest::settimer(77,1);
}

if($timer == 77 && $high_priest == 2)
  {
quest::spawn2(200032,0,0,310,328,-71.5,250); # NPC: High_Priest_Ultor_Szanvon
$high_priest=0;
quest::stoptimer(69);
  }
if($timer == 69) {
$high_priest=0;
quest::stoptimer(69);
}
}

sub EVENT_SIGNAL
{
$high_priest=$high_priest+1;
quest::settimer(69,14400);
}

