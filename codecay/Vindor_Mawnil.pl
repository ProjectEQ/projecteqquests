
sub EVENT_SPAWN
{
quest::settimer(4,3600); #1 hour depop
}

sub EVENT_TIMER
{
if($timer == 4)
{
quest::depop();
}
}
sub EVENT_DEATH_COMPLETE {

quest::signal(200041,1);
}