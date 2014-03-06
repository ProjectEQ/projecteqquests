sub EVENT_DEATH {
$Check_EntID = $entity_list->GetMobByNpcTypeID(297039);
if ($Check_EntID) {
quest::emote("flesh and bones are reformed by dark magic");
quest::spawn2(297044,0,0, $x, $y, $z, 0.5);
}
}

