sub EVENT_DEATH {
$Check_EntID = $entity_list->GetMobByNpcTypeID(298139);
if ($Check_EntID) {
quest::emote("flesh and bones are reformed by dark magic");
quest::spawn2(298144,0,0, $x, $y, $z, 0.5);
}
}

