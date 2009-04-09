sub EVENT_DEATH
{
quest::signal(206033,1);
quest::spawn2(202368,0,0,$x,$y,$z,$h);
}