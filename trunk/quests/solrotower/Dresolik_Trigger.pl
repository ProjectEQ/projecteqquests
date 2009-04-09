sub EVENT_SIGNAL {
{
$dresolik=$dresolik+1;
quest::stoptimer(5);
quest::settimer(5,7200); #if group leaves and only kills 1-2 mobs, the variable will be reset after 2 hours and no mobs killed
}
if($dresolik == 4) {
quest::spawn2(212061,0,0,607,1585,-162,63);
$dresolik=undef;
}
}

sub EVENT_TIMER {
if($timer == 5) {
quest::stoptimer(5);
$dresolik=undef;
}
}