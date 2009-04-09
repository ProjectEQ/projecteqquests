sub EVENT_SPAWN
{
quest::settimer(7,3600); #1 hour depop
}

sub EVENT_TIMER
{
if($timer == 7)
{
quest::depop();
}
}