# Quest for Wizard Acumen Mask, Runescale Cloak, Tishan's Kilt
# Quest for Bard Lambent Ruby
# items: 2366, 2364, 10118, 19048

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I am Vilissia, chosen of Solusek Ro. I am a practitioner in the Wizardly arts, and keeper of lore for the [Runescale Cloak], [Tishans Kilt] and the [Acumen Mask].");
  }
  elsif ($text=~/runescale cloak/i) {
    quest::say("The Runescale cloak is a wonderful item of defense for any Wizard. Are you [interested in the cloak]?");
  }
  elsif ($text=~/interested in the cloak/i) {
    quest::say("I can assemble for you a Runescale Cloak – but you will need to bring me the necessary components. I will need a Lizardscale Cloak from the Feerrott and the three Runes of Scale. All three can be found on Crocodiles – Saltwater Crocodiles in the Caverns of Guk, Deepwater Crocodiles in the Oasis of Marr and Firescale Crocodiles in the mountains of Lavastorm. Bring me these items, and I will make for you a Runescale Cloak.");
  }
  elsif ($text=~/tishans kilt/i) {
    quest::say("Tishan was once counted among the mightiest of wiards – and his items are items of power. If you are interested in acquiring Tishans Kilt, you must take a Shadowed Ball from our mortal enemies the Shadowed Men and bring it to Trankia in the Everfrost Mountains.");
  }
  elsif ($text=~/acumen mask/i) {
    quest::say("The Acumen Mask, as its name suggests, confers to its wearer certain powers of insight and knowledge. I can make an Acumen Mask for you, but you will need to bring me the proper components. I will need a Glowing Mask from a Skeletal Monk in the Caverns of Guk, A Patch of Shadow from our mortal enemies the Shadowed Men, a Darkbone Skull from a Greater Darkbone Skeleton in the Estate of Unrest and a Bonechipped Mask from a Goblin Headmaster in the Ocean of Tears. Bring me these four items, and I will make for you an Acumen Mask.");
  }
  elsif ($text=~/interested in the mask/i) {
    quest::say("I can make for you an Acumen Mask, but you will need to bring me the proper components. I will need a Glowing Mask from a Skeletal Monk in the Caverns of Guk, A Patch of Shadow from our mortal enemies the Shadowed Men, a Darkbone Skull from a Darkbone Skeleton in the Estate of Unrest and a Bonechipped Mask from a Goblin Headmaster in the Ocean of Tears. Bring me these four items, and I will make for you an Acumen Mask.");
  }
}

sub EVENT_ITEM {
  if (quest::handin({2352 => 1, 2368 => 1, 10558 => 1, 2367 => 1})) { # Items: Glowing Mask, Patch of Shadow, Darkbone Skull, Bonechipped Mask
    quest::say("Well done $name. You truly are a powerful wizard. I have crafted your mask. Take it.");
    quest::summonitem(2366); # Item: Acumen Mask
    quest::faction(415,15); # Faction: Temple of Solusek Ro
    quest::faction(416,-15); # Faction: Shadowed Men
    quest::exp(1000);
  }
  elsif (quest::handin({2332 => 1, 10553 => 1, 10554 => 1, 10555 => 1})) { # Items: Lizardscale Cloak, Rune of Scale, Rune of Scale, Rune of Scale
    quest::say("Well done $name. You truly are a powerful wizard. I have crafted your cloak. Take it.");
    quest::summonitem(2364); # Item: Runescale Cloak
    quest::faction(415,15); # Faction: Temple of Solusek Ro
    quest::faction(416,-15); # Faction: Shadowed Men
    quest::exp(1000);
  }
  elsif (quest::handin({10035 => 2, 10000 => 1})) { # Items: Ruby x 2, Lambent Stone
    quest::say("Okay, here is your Lambent Ruby.");
    quest::summonitem(10118); # Item: Lambent Ruby
    quest::faction(415,15); # Faction: Temple of Solusek Ro
    quest::faction(416,-15); # Faction: Shadowed Men
    quest::exp(1000);
  }
  elsif (quest::handin({16507 => 1})) { # Item: Enchanted Platinum Bar
    quest::say("I see that Gavel has sent you to me. Very well, I have vulcanized your platinum bar - take it.");
    quest::summonitem(19048); # Item: Vulcanized Platinum Bar
  }
}