sub EVENT_SPAWN
{
quest::settimer(8,3600); #1 hour depop
}

sub EVENT_TIMER
{
if($timer == 8)
{
quest::depop();
}
}
