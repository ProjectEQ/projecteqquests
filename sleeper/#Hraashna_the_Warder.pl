sub EVENT_DEATH_COMPLETE {
$nanzata = $entity_list->GetMobByNpcTypeID(128090);
$ventani = $entity_list->GetMobByNpcTypeID(128091);
$tukaarak = $entity_list->GetMobByNpcTypeID(128092);
if (!$nanzata && !$ventani && !$tukaarak) {
quest::signalwith(128094,66,0);
quest::shout("Warders, I have fallen. Prepare yourselves, these fools are determined to unleash doom!");
}
else { 
quest::shout("Warders, I have fallen. Prepare yourselves, these fools are determined to unleash doom!");
}
 }
