sub EVENT_DEATH {
if ($Death !=1) {
quest::emote("flesh and bones are reformed by dark magic");
quest::spawn2(298141,0,0, $x, $y, $z, 0.5);
}
}

sub EVENT_SIGNAL {

if ($signal == 1) {
$Death = 1;
}
}
