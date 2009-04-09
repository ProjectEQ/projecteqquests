sub EVENT_SPAWN
{
quest::settimer(6,3600); #1 hour depop
}

sub EVENT_TIMER
{
if($timer == 6)
{
quest::depop();
}
}