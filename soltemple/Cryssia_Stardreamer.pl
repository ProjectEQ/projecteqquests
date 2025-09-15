# Quests for Bard Lambent armor
# items: 10564, 10563, 10128, 4156, 4100, 10565, 10118, 4154, 10559, 4099, 10117, 4153, 4113, 10560, 10119, 4155

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Well met $name. I am Cryssia Stardreamer of the Temple of Solusek Ro, protector of a powerful armor that will aid any bard in their journey across Norrath. Are you a bard that desires this armor?");
  }
  elsif ($text=~/no/i) {
    quest::say("Very well then.");
  }
  elsif ($text=~/yes/i) {
    quest::say("Very well. I can craft a special type of bardic armor called lambent. I can craft for you a set of [bracers], a [breastplate], a [helm], and [vambraces]. I require a special kind of lambent stone for each of my armor pieces. Find my friends Orstorm, Genni, Gardern, and Vilissia within the temple and they will help you create them.");
  }
  elsif ($text=~/bracers/i) {
    quest::say("Alright, I will be needing some items. Return to me with them and I will craft your bracers. I will be needing a Dark Boned Bracelet, a Griffenne Charm, and a Lambent Fire Opal.");
  }
  elsif ($text=~/breastplate/i) {
    quest::say("This is the most difficult piece to make. In order for me to craft it I will be needing a Basalt Carapace, a Gypsy Lute, and a Lambent Ruby. Return to me with these and I will craft your breastplate.");
  }
  elsif ($text=~/helm/i) {
    quest::say("In order to craft the helm, I will be needing a Mudwater Rune, an Opoline Helm, and a Lambent Star Ruby. Give these items to me and I will craft your helm");
  }
  elsif ($text=~/vambraces/i) {
    quest::say("Very good, get me some Fiery Vambraces, the top portion of the Rune of the One Eye, and a Lambent Sapphire.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 10564 => 1, 10563 => 1, 10128 => 1)) { # Items: Dark Boned Bracelet, Griffenne Charm, Lambent Fire Opal
    quest::say("Well done. Here are your Lambent Bracers");
    quest::summonitem(4156); # Item: Lambent Bracers
  }
  elsif (plugin::check_handin(\%itemcount, 4100 => 1, 10565 => 1, 10118 => 1)) { # Items: Basalt Carapace, Gypsy Lute, Lambent Ruby
    quest::say("Well done. Here is your Lambent Breastplate.");
    quest::summonitem(4154); # Item: Lambent Breastplate
  }
  elsif (plugin::check_handin(\%itemcount, 10559 => 1, 4099 => 1, 10117 => 1)) { # Items: Mudwater Rune, Opoline Helm, Lambent Star Ruby
    quest::say("Well done. Here is your Lambent Helm");
    quest::summonitem(4153); # Item: Lambent Helm
  }
  elsif (plugin::check_handin(\%itemcount, 4113 => 1, 10560 => 1, 10119 => 1)) { # Items: Fiery Vambraces, Rune of the One Eye, Lambent Sapphire
    quest::say("Well done. Here are your Lambent Vambraces.");
    quest::summonitem(4155); # Item: Lambent Vambraces
  }
}