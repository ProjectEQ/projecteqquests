sub EVENT_SAY {
$charid = 0;
$corpse = 0;
$charid = $client->CharacterID();
$x = $npc->GetX();
$y = $npc->GetY();
$z = $npc->GetZ();

 if ($text=~/hail/i) {
    quest::say("I am the spectral image of Besana. In life, I guarded the spirits of my people and now in death I make sure the dead have a proper burial. Those who have tried to stop the menacing invaders of this area have suffered many losses. I have placed many bodies here in the ground until their spirits return to inhabit them. The spirits looking for their bodies need only say they [" . quest::saylink("wish to live again") . "] and I will dig up the body for them.");
    quest::buryplayercorpse($charid);
    $corpse = quest::getplayerburiedcorpsecount($charid);
  }
if($text=~/wish to live again/i && $corpse == 0) {
    quest::say("You have no corpse in this zone");
    }
if($text=~/wish to live again/i && $corpse > 0) {    
    quest::say("And so you shall my friend. And so you shall.");
    quest::summonburiedplayercorpse($charid, $x, $y, $z, 0);
    $corpse = 0;
    $charid = 0;
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}