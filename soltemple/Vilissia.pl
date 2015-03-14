# Quest for Wizard Acumen Mask, Runescale Cloak, Tishan's Kilt
# Quest for Bard Lambent Ruby

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("I am Vilissia, chosen of Solusek Ro.  I am a practitioner in the Wizardly arts, and keeper of lore for the [Runescale Cloak], [Tishans Kilt] and the [Acumen Mask].");
  }
  if($text=~/runescale cloak/i) {
    quest::say("The Runescale cloak is a wonderful item of defense for any Wizard.  Are you [interested in the cloak]?");
  }
  if($text=~/interested in the cloak/i) {
    quest::say("I can assemble for you a Runescale Cloak – but you will need to bring me the necessary components.  I will need a Lizardscale Cloak from the Feerrott and the three Runes of Scale.  All three can be found on Crocodiles – Saltwater Crocodiles in the Caverns of Guk, Deepwater Crocodiles in the Oasis of Marr and Firescale Crocodiles in the mountains of Lavastorm.  Bring me these items, and I will make for you a Runescale Cloak.");
  }
  if($text=~/tishans kilt/i) {
    quest::say("Tishan was once counted among the mightiest of wiards – and his items are items of power.  If you are interested in acquiring Tishans Kilt, you must take a Shadowed Ball from our mortal enemies the Shadowed Men and bring it to Trankia in the Everfrost Mountains.");
  }
  if($text=~/acumen mask/i) {
    quest::say("The Acumen Mask, as its name suggests, confers to its wearer certain powers of insight and knowledge. I can make an Acumen Mask for you, but you will need to bring me the proper components. I will need a Glowing Mask from a Skeletal Monk in the Caverns of Guk, A Patch of Shadow from our mortal enemies the Shadowed Men, a Darkbone Skull from a Greater Darkbone Skeleton in the Estate of Unrest and a Bonechipped Mask from a Goblin Headmaster in the Ocean of Tears. Bring me these four items, and I will make for you an Acumen Mask.");
  }
  if($text=~/interested in the mask/i) {
    quest::say("I can make for you an Acumen Mask, but you will need to bring me the proper components.  I will need a Glowing Mask from a Skeletal Monk in the Caverns of Guk, A Patch of Shadow from our mortal enemies the Shadowed Men, a Darkbone Skull from a Darkbone Skeleton in the Estate of Unrest and a Bonechipped Mask from a Goblin Headmaster in the Ocean of Tears.  Bring me these four items, and I will make for you an Acumen Mask.");
  }
}

sub EVENT_ITEM {

  #mask
  if(($itemcount{2352} == 1) && ($itemcount{2368} == 1) && ($itemcount{10558} == 1) && ($itemcount{2367} == 1)) {
    quest::say("Well done $name. You truly are a powerful wizard. I have crafted your mask. Take it.");
    quest::summonitem(2366);
    quest::faction("320","15");
    quest::faction("291","-15");
    quest::exp(1000);
  }

  #cloak
  if(($itemcount{2332} == 1) && ($itemcount{10553} == 1) && ($itemcount{10554} == 1) && ($itemcount{10555} == 1)) {
    quest::say("Well done $name. You truly are a powerful wizard. I have crafted your cloak. Take it.");
    quest::summonitem(2364);
    quest::faction("320","15");
    quest::faction("291","-15");
    quest::exp(1000);
  }

  #lambent stone
  if(($itemcount{10035} == 2) && ($itemcount{10000} == 1)) {
    quest::say("Okay, here is your Lambent Ruby.");
    quest::summonitem(10118);
    quest::faction("320","15");
    quest::faction("291","-15");
    quest::exp(1000);
  }

  #vulcanized platinum
  if($itemcount{16507} == 1) {
    quest::say("I see that Gavel has sent you to me.  Very well, I have vulcanized your platinum bar - take it.");
    quest::summonitem(19048);
  }

}

# Quest by mystic414

