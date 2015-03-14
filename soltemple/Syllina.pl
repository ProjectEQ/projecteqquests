# Necromancer quests

sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Hello, I am Syllina, follower of Solusek Ro and keeper of the [Shadow Lore].");
  }
  if($text=~/shadow lore/i){
    quest::say("I hold the secrets to the Shadow Lore so highly prized by Necromancers. If you are interested, I can tell you about [ShadowBound Boots], [ShadowBound Gloves], the [Robe of Enshroudment] or the secrets to the making of [Shadow Silk].");
  }
  if($text=~/shadowbound boots/i){
    quest::say("ShadowBound Boots are boots woven from purest shadow. If you are interested, I will weave you a pair - but I will need [boot components].");
  }
  if($text=~/boot components/i){
    quest::say("I will need the following items to make you a pair of ShadowBound Boots: Shadow Silk, The Scepter of Sorrow from Castle Mistmoore, an Eye of Shadow from our mortal enemies the Shadowed Men and a Skeletal toe from a Rathe Giant Skeleton.");
  }
  if($text=~/shadowbound gloves/i){
    quest::say("ShadowBound Gloves are gloves woven from the purest shadow. If you are interested, I will weave you a pair - but I will need [glove components].");
  }
  if($text=~/glove components/i){
    quest::say("I will need the following items to make you a pair of ShadowBound Gloves: Inky Shadow Silk, The Scepter of Tears from the circle-stair-waterfall of Guk, a Hand of Shadow from our mortal enemies the Shadowed Men and a Skeletal finger from a Rathe Giant Skeleton.");
  }
  if($text=~/robe of enshroudment/i){
    quest::say("The Robe of Enshroudment is a robe woven from the purest of shadow. If you are interested, I will weave you a robe - but I will need the following [robe components].");
  }
  if($text=~/robe components/i){
    quest::say("I will need the following items to make you a Robe of Enshroudment: Large Shadow Silk, A Werebat Wing from the Estate of Unrest, A Mask of Shadow from our mortal enemies the Shadowed Men and a Globe of Shadow from a Nokta Shaman in Guk.");
  }
  if($text=~/shadow silk/i){
    quest::say("If you are interested, I will tell you the secrets of making Shadow Silk for a mere 50 pieces of gold.");
  }
}

sub EVENT_ITEM {

  # Shadow Silk info
  if($gold >= 50) {
    quest::say("You will need to give the following components to a tailor: a Shadow Wolf Pelt, a Silk Swatch and a Scroll of Gather Shadows. Have the tailor weave them together and she will make you Shadow Silk. To make large shadow silk add an extra shadow wolf pelt. To make inky shadow silk, add an extra scroll.");
    quest::faction("320","15");
    quest::faction("291","-15");
  }

  # Robe of Enshroudment
  if(($itemcount{16484} == 1) && ($itemcount{13239} == 1) && ($itemcount{2309} == 1) && ($itemcount{10535} == 1)) {
    quest::say("Well done, $name!  Here is your robe, as promised."); # Made this text up
    quest::summonitem(1355);
    quest::faction("320","15");
    quest::faction("291","-15");
    quest::exp(1000);
  }

  # Shadowbound Gloves
  if(($itemcount{14363} == 1) && ($itemcount{13234} == 1) && ($itemcount{10534} == 1) && ($itemcount{16485} == 1)) {
    quest::say("Well done, $name!  Here are your gloves, as promised."); # Made this text up
    quest::summonitem(3318);
    quest::faction("320","15");
    quest::faction("291","-15");
    quest::exp(1000);
  }

  # Shadowbound Boots
  if(($itemcount{14364} == 1) && ($itemcount{13180} == 1) && ($itemcount{10533} == 1) && ($itemcount{16483} == 1)) {
    quest::say("Well done, $name!  Here are your boots, as promised."); # Made this text up
    quest::summonitem(3317);
    quest::faction("320","15");
    quest::faction("291","-15");
    quest::exp(1000);
  }

}

# Quest by mystic414

