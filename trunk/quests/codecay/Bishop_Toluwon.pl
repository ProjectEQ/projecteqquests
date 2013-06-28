sub EVENT_SPAWN
{
quest::settimer(3,3600);
}

sub EVENT_TIMER
{
if($timer == 3)
{
quest::depop();
}
}

sub EVENT_DEATH_COMPLETE
{
quest::spawn2(200034,33,0,325,325,-71.5,138.6);
quest::spawn2(200033,34,0,290,325,-71.5,138.6);
}

