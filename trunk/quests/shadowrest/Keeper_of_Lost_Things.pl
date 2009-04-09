sub EVENT_SAY {
$charid = 0;
$corpse = 0;
$charid = $client->CharacterID();
$x = $npc->GetX();
$y = $npc->GetY();
$z = $npc->GetZ();
$corpse = quest::getplayerburriedcorpsecount($charid);
if($text=~/Hail/i) {
   $client->Message(4, "The spectral figure stares into your soul with 
cold eyes, its voice entering your mind. We keep all that has been lost. In times past, nothing be returned once it was mine. Time have changed. The bodies, your [bodies], that were lost to you can now be returned.");
}
if($text=~/bodies/i && $corpse == 0) {
    $client->Message(13, "The voice booms angrily in your mind, Be gone 
from this place. You waste my time!");
    $corpse = 0;
    $charid = 0;
}
if($text=~/bodies/i && $corpse > 0) {
    quest::summonburriedplayercorpse($charid, $x, $y, $z, 0);
    $corpse = 0;
    $charid = 0;
}
 }   
