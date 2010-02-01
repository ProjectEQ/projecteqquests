# Quests for Bard Lambent armor

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Well met $name. I am Cryssia Stardreamer of the Temple of Solusek Ro, protector of a powerful armor that will aid any bard in their journey across Norrath.  Are you a bard that desires this armor?");
  }
  if($text=~/no/i) {
    quest::say("Very well then.");
  }
  if($text=~/yes/i) {
    quest::say("Very well. I can craft a special type of bardic armor called lambent.  I can craft for you a set of [bracers], a [breastplate], a [helm], and [vambraces]. I require a special kind of lambent stone for each of my armor pieces.  Find my friends Orstorm, Genni, Gardern, and Vilissia within the temple and they will help you create them.");
  }
  if($text=~/bracers/i) {
    quest::say("Alright, I will be needing some items. Return to me with them and I will craft your bracers. I will be needing a Dark Boned Bracelet, a Griffenne Charm, and a Lambent Fire Opal.");
  }
  if($text=~/breastplate/i) {
    quest::say("This is the most difficult piece to make. In order for me to craft it I will be needing a Basalt Carapace, a Gypsy Lute, and a Lambent Ruby. Return to me with these and I will craft your breastplate.");
  }
  if($text=~/helm/i) {
    quest::say("In order to craft the helm, I will be needing a Mudwater Rune, an Opoline Helm, and a Lambent Star Ruby. Give these items to me and I will craft your helm");
  }
  if($text=~/vambraces/i) {
    quest::say("Very good, get me some Fiery Vambraces, the top portion of the Rune of the One Eye, and a Lambent Sapphire.");
  }
}

sub EVENT_ITEM {
 
  #bracers
  if(plugin::check_handin(\%itemcount, 10564 => 1, 10563 => 1, 10128 => 1)) {
    quest::say("Well done. Here are your Lambent Bracers");
    quest::summonitem(4156);
  }

  #breastplate
  if(plugin::check_handin(\%itemcount, 4100 => 1, 10565 => 1, 10118 => 1)) {
    quest::say("Well done. Here is your Lambent Breastplate.");
    quest::summonitem(4154);
  }

  #helm
  if(plugin::check_handin(\%itemcount, 10559 => 1, 4099 => 1, 10117 => 1)) {
    quest::say("Well done. Here is your Lambent Helm");
    quest::summonitem(4153);
  }

  #vambraces
  if(plugin::check_handin(\%itemcount, 4113 => 1, 10560 => 1, 10119 => 1)) {
    quest::say("Well done. Here are your Lambent Vambraces.");
    quest::summonitem(4155);
  }

  else
  {
	  plugin::return_items(\%itemcount);
  }
}
