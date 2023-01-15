# Quest for Staff of Temperate Flux and Weeping Wand
# Quest for Bard Lambent Sapphire
# items: 6342, 6341, 10119

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("I am Gardern, listed among the chosen of Solusek Ro.  I hold the lore to the [Staff of Temperate Flux] and the [Weeping Wand] - items coveted by my Wizardly brethren.");
  }
  if($text =~ /staff of temperate flux/i) {
    quest::say("The Staff of Temperate Flux is a boon to those who dabble in the elemental arts, for it can increase the susceptibility of a creature to both fire and cold.  Are you [interested in the staff]?");
  }
  if($text =~ /interested in the staff/i) {
    quest::say("I will craft you a Staff of Temperate Flux, but you must bring me the components which I require to make it.  I will need a Heart of Fire from an Inferno Goblin Wizard in the Caverns of Solusek, a Heart of Frost from a Goblin Wizard in the Caverns of Permafrost, a Rod of Bone from a Stone Skeleton by the shores of Lake Rathe and a Staff of Ro.  Bring me these items, and I will make you your staff.");
  }
  if($text =~ /weeping wand/i) {
    quest::say("The Weeping Wand is a fine item for a Wizard - it can aid as a focus for concentration, and, if needed, be used to parry as well.  Are you [interested in the wand]?");
  }
  if($text =~ /interested in the wand/i) {
    quest::say("I can make you a Weeping Wand, but you will need to bring me certain components.  I will need a Silver Wand from a Silvered Guard in the Temple Cazic Thule, A Bloodblack Wand from the Mountains of Rathe, Twice-Woven Silk from a Faerie Guard in Faydark and a Scepter of Sorrow from the Tomb in Castle Mistmoore.  Bring me these items and I will make for you a Weeping Wand.");
  }
}

sub EVENT_ITEM {

  # Staff
  if(($itemcount{10548} == 1) && ($itemcount{10549} == 1) && ($itemcount{10550} == 1) && ($itemcount{6048} == 1)) {
    quest::say("Well done, $name. Now I will craft your Staff of Temperate Flux, as promised.");
    quest::summonitem(6342); # Item: Staff of Temperate Flux
    quest::faction("415","15");
    quest::faction("416","-15");
    quest::exp(1000);
  }

  # Wand
  if(($itemcount{10551} == 1) && ($itemcount{6338} == 1) && ($itemcount{10557} == 1) && ($itemcount{14364} == 1)) {
    quest::say("Well done, $name. Now I will craft your Weeping Wand, as promised.");
    quest::summonitem(6341); # Item: Weeping Wand
    quest::faction("415","15");
    quest::faction("416","-15");
    quest::exp(1000);
  }

  # Bard Lambent Stone
  if(($itemcount{10034} == 2) && ($itemcount{10000} == 1)) {
    quest::say("Ahh, Genni must have sent you to me.  Very well, here is your Lambent Sapphire.");
    quest::summonitem(10119); # Item: Lambent Sapphire
    quest::faction("415","15");
    quest::faction("416","-15");
    quest::exp(1000);
  }
}

# Quest edited by mystic414

