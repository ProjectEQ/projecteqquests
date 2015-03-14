sub EVENT_SAY {
$charid = 0;
$corpse = 0;
$charid = $client->CharacterID();
$corpse = quest::getplayerburriedcorpsecount($charid);
if($text=~/Hail/i) {
    quest::emote("smiles at you broadly. It is my pleasure to bid you greeting from the Council of New Tanaan. I have been granted the task of working as this region's gatekeeper to Shadowrest. Until recently, the Keeper held tightly onto all things that we lost. Thanks to the council, this is no longer true. The Keeper may grant you access to your lost corpses if you ask him. When you are [ready], I will transport you.");
$client->Message(15, "You have $corpse bodies available in Shadowrest.");
}

if($text=~/ready/i) {
    $client->Message(13, "The world stretches and twists around you as you feel yourself being pulled from this world.");
    quest::movepc(187,-27.3,-245.6,8.1,192);
    $corpse = 0;
    $charid = 0;
}
 }      