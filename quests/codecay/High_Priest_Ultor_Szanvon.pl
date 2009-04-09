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

sub EVENT_DEATH {
quest::spawn2(200040,0,0,$x,$y,$z,$h);
}
