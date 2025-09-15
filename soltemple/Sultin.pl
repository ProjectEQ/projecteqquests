# Enchanter quests
# items: 6329, 6334, 2351, 2350

sub EVENT_SAY {
  if ($text=~/hail/i) {
   quest::say("I am Sultin - keeper of the three [Incandescent]s of power and the [Rod] of Insidious Glamour. If you are an Enchanter, perhaps we can deal.");
  }
  elsif ($text=~/incandescent/i) {
   quest::say("There are three Incandescent items of power - [Wand], [Mask] and [Gloves]. Are you [interested] in any of them?");
  }
  elsif ($text=~/interested/i && $text=~/wand/i) {
   quest::say("Ahh, the Incandescent Wand. If you will get the components to make another, I will give you mine. I will need a Pouch of Silver Dust, found on the dusty Werebat in the Estate of Unrest. I will also need a Silver wand, found on a Silvered Guard in the Temple of Cazic Thule. This wand will not be enchanted - you will need to pay Esmirella of the Northern Karana Gypsy Camp 50 gold to enchant it for you. When the Wand is fully enchanted, bring it and the pouch to me and I will give you the Incandescent Wand.");
  }
  elsif ($text=~/interested/i && $text=~/mask/i) {
   quest::say("An item of power - the Incandescent Mask. If you will bring me the components to make another, I will give you an Incandescent Mask. I will need a Glowing Mask, found on the skeletal monk in the caverns of Guk. I will also need all three Runes of Fortune. One Rune can be found on the Dark Elf Enynti in the Chasm below Castle Mistmoore. The other two can each be purchased for 50 golden coins each - one from Mizr N`Mar in the Neriak City Library and the other from Madam Serena in the city of Qeynos. Bring me all three Runes and the Glowing Mask and I will give you your reward.");
  }
  elsif ($text=~/interested/i && $text=~/gloves/i) {
   quest::say("My personal favorite - Incandescent Gloves. If you bring me the components to make another pair, I will give you my gloves. Incandescent Gloves are made by sewing together four other sets of gloves. Glowing Gloves can be found on our mortal enemies - the Shadowed Men. Radiant Gloves can be found on Radiant in the Feerrott. Enchanted and Gleaming gloves can be purchased for 50 golden coins from Tizina of the Lavastrom Gypsies and a bloodstone from Tarn Vislin of HighKeep. Bring me all four sets of gloves and I will give you a pair of Incadescent ones.");
  }
  elsif ($text=~/interested/i && $text=~/rod/i) {
   quest::say("If I am to give you this rod, you must bring me the parts to make another. I will need the Golden Rod from the froglok priest in Guk, as well as a Shining Stone from our mortal enemies, the Shadowed Men. Once you have obtained the Shining Stone, you will need to get it enchanted. Cynthia of the Rathe Mountain Gypsy Clan will enchant the Shining Stone for you - give it to her with 50 golden coins. When the Stone is fully enchanted, bring it and the rod to me and I will give you a Rod of Insidious Glamour.");
  }
  elsif ($text=~/rod/i) {
   quest::say("I am keeper of the Rod of Insidious Glamour - a device of guile and deceit. The rod will increase the Charisma of whomever holds it. Are you [interested] in obtaining the [rod]?");
  }
}

sub EVENT_ITEM {
  if (quest::handin({10087 => 1, 6337 => 1})) { # Items: Glowing Glamour Stone, Golden Rod
    quest::say("Well done, adventurer. You have kept your part of the bargain, so I keep mine. Here is your rod.");
    quest::summonitem(6329); # Item: Rod of Insidious Glamour
    quest::faction(415,5); # Faction: Temple of Solusek Ro
    quest::faction(416,-1); # Faction: Shadowed Men
    quest::exp(1000);
  }
  elsif (quest::handin({10087 => 1, 6340 => 1})) { # Items: Glowing Glamour Stone, Glowing Silver Wand
    quest::say("I see that you are resourceful... you have earned your incandescent wand.");
    quest::summonitem(6334); # Item: Incandescent Wand
    quest::faction(415,5); # Faction: Temple of Solusek Ro
    quest::faction(416,-1); # Faction: Shadowed Men
    quest::exp(1000);
  }
  elsif (quest::handin({2353 => 1, 2354 => 1, 2355 => 1, 2356 => 1})) { # Items: Glowing Gloves, Enchanted Gloves, Gleaming Gloves, Radiant Gloves
    quest::say("Four pairs of gloves you have given me? I will give you one pair in return. We shall see who had the better deal.");
    quest::summonitem(2351); # Item: Incandescent Gloves
    quest::faction(415,5); # Faction: Temple of Solusek Ro
    quest::faction(416,-1); # Faction: Shadowed Men
    quest::exp(1000);
  }
  elsif (quest::handin({2352 => 1, 10530 => 1, 10531 => 1, 10532 => 1})) { # Items: Glowing Mask, Rune of Fortune, Rune of Fortune, Rune of Fortune
    quest::say("Fortune favors you .. as will this mask.");
    quest::summonitem(2350); # Item: Incandescent Mask
    quest::faction(415,5); # Faction: Temple of Solusek Ro
    quest::faction(416,-1); # Faction: Shadowed Men
    quest::exp(1000);
  }
}