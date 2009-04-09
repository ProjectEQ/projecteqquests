# Enchanter quests

sub EVENT_SAY {
  if($text=~/hail/i) {
   quest::say("I am Sultin - keeper of the three [Incandescent]s of power and the [Rod] of Insidious Glamour. If you are an Enchanter, perhaps we can deal.");
  }
  if($text=~/incandescent/i) {
   quest::say("There are three Incandescent items of power - [Wand], [Mask] and [Gloves]. Are you [interested] in any of them?");
  }
  if($text=~/interested in the wand/i) {
   quest::say("Ahh, the Incandescent Wand. If you will get the components to make another, I will give you mine. I will need a Pouch of Silver Dust, found on the dusty Werebat in the Estate of Unrest. I will also need a Silver wand, found on a Silvered Guard in the Temple of Cazic Thule. This wand will not be enchanted - you will need to pay Esmirella of the Northern Karana Gypsy Camp 50 gold to enchant it for you. When the Wand is fully enchanted, bring it and the pouch to me and I will give you the Incandescent Wand.");
  }
  if($text=~/interested in the mask/i) {
   quest::say("An item of power - the Incandescent Mask. If you will bring me the components to make another, I will give you an Incandescent Mask. I will need a Glowing Mask, found on the skeletal monk in the caverns of Guk. I will also need all three Runes of Fortune. One Rune can be found on the Dark Elf Enynti in the Chasm below Castle Mistmoore. The other two can each be purchased for 50 golden coins each - one from Mizr N`Mar in the Neriak City Library and the other from Madam Serena in the city of Qeynos. Bring me all three Runes and the Glowing Mask and I will give you your reward.");
  }
  if($text=~/interested in the gloves/i) {
   quest::say("My personal favorite - Incandescent Gloves. If you bring me the components to make another pair, I will give you my gloves. Incandescent Gloves are made by sewing together four other sets of gloves. Glowing Gloves can be found on our mortal enemies - the Shadowed Men. Radiant Gloves can be found on Radiant in the Feerrott. Enchanted and Gleaming gloves can be purchased for 50 golden coins from Tizina of the Lavastrom Gypsies and a bloodstone from Tarn Vislin of HighKeep. Bring me all four sets of gloves and I will give you a pair of Incadescent ones.");
  }
  if($text=~/rod/i) {
   quest::say("I am keeper of the Rod of Insidious Glamour - a device of guile and deceit. The rod will increase the Charisma of whomever holds it. Are you [interested] in obtaining the [rod]?");
  }
  if($text=~/interested in the rod/i) {
   quest::say("If I am to give you this rod, you must bring me the parts to make another. I will need the Golden Rod from the froglok priest in Guk, as well as a Shining Stone from our mortal enemies, the Shadowed Men. Once you have obtained the Shining Stone, you will need to get it enchanted. Cynthia of the Rathe Mountain Gypsy Clan will enchant the Shining Stone for you - give it to her with 50 golden coins. When the Stone is fully enchanted, bring it and the rod to me and I will give you a Rod of Insidious Glamour.");
  }
}

sub EVENT_ITEM {
  # Rod of Insidious Glamour
  if(($itemcount{10087} == 1) && ($itemcount{6337} == 1)) {
    quest::say("Well done, $name.  Here is your reward."); # Made this text up
    quest::summonitem(6329);
    quest::faction("320","15");
    quest::faction("291","-15");
    quest::exp(1000);
  }

  # Incandescent Wand
  if(($itemcount{12240} == 1) && ($itemcount{6340} == 1)) {
    quest::say("Well done, $name.  Here is your wand."); # Made this text up
    quest::summonitem(6334);
    quest::faction("320","15");
    quest::faction("291","-15");
    quest::exp(1000);
  }

  # Incandescent Gloves
  if(($itemcount{2353} == 1) && ($itemcount{2354} == 1) && ($itemcount{2355} == 1) && ($itemcount{2356} == 1)) {
    quest::say("All four sets of gloves?  Very well done.  Here is your reward."); # Made this text up
    quest::summonitem(2351);
    quest::faction("320","15");
    quest::faction("291","-15");
    quest::exp(1000);
  }

  # Incandescent Mask
  if(($itemcount{2352} == 1) && ($itemcount{10530} == 1) && ($itemcount{10531} == 1) && ($itemcount{10532} == 1)) {
    quest::say("Well done, $name!  Here is your mask, as promised."); # Made this text up
    quest::summonitem(2350);
    quest::faction("320","15");
    quest::faction("291","-15");
    quest::exp(1000);
  }

}

# Quest by mystic414

