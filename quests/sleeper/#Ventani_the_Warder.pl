sub EVENT_DEATH {
$nanzata = $entity_list->GetMobByNpcTypeID(128090);
$tukaarak = $entity_list->GetMobByNpcTypeID(128092);
$hraashna = $entity_list->GetMobByNpcTypeID(128093);
if (!$nanzata && !$tukaarak && !$hraashna) {
quest::signalwith(128094,66,0);
quest::shout("Warders, I have fallen. Prepare yourselves, these fools are determined to unleash doom!");
}
else { 
quest::shout("Warders, I have fallen. Prepare yourselves, these fools are determined to unleash doom!");
}
 }
