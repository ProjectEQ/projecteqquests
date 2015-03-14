sub EVENT_DEATH {
$Check_EntID = $entity_list->GetMobByNpcTypeID(298139);
if ($Check_EntID) {
quest::emote("flesh and bones are reformed by dark magic");
quest::spawn2(298143,0,0, $x, $y, $z, 0.5);
}
}

sub EVENT_SIGNAL {

if ($signal == 1) {
$Death = 1;
}
}
