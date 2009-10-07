############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velios
# LAST EDIT DATE: April 5,2005
# VERSION: 2.0
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Larn_Brugal
# ID: 9113
# TYPE: Guild Master Warrior
# RACE: Human
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Sealed Letter ID-1717  *** Uses a Sealed Letter from another quest for now.
# Raw Short Sword 1 ID-12241
# Raw Short Sword 2 ID-12242
# Raw Short Sword 3 ID-12243
# Raw Short Sword 4 ID-12244
# Groflar's Stoutbite ID-5418
#
# *** QUESTS INVOLVED IN ***
#
#1 - Warrior Weapon Shipment
#
# *** QUESTS AVAILABLE TO ***
#
#1 - Warrior
#
############################################

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Good day to you $name! I hope you yearn to become a Steel Warrior as we all are here in the Bunker. We are in need of more recruits to continue the [war].");
  }
  if($text=~/war/i) {
    quest::say("The war I speak of is the one we Steel Warriors have sworn to wage agianst [Clan Deathfist] in the Commonlands. We are doing a fine job but we require more weapons. We are expecting a shipment of blades from Groflahs Forge. We require a warrior of the bunker to [get our shipment]. Maybe you.");
  }
  if($text=~/clan deathfist/i) {
    quest::say("If you do not know of Clan Deathfist go ask Cain who they are. He will not only tell you he will sign you up to help fight our war!");
  }
  if($text=~/shipment/i && ($class eq "Warrior")) {
    quest::say("We would be most thankful for your service. Please take this voucher over to Groflah at Groflahs Forge in North Freeport. He will give you the shipment of weapons.");
    quest::summonitem(1717);
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 12241 => 1, 12242 => 1, 12243 => 1, 12244 => 1)) { #Raw Short Sword 1-4
    quest::say("I heard you were on your way back. Here then. Let us sharpen that blade for you. There you are. That should be much better in a fray now.");
    quest::ding();
    quest::exp(50);
    quest::summonitem(5418); #Groflar's Stoutbite
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:freportw  ID:9113 -- Larn_Brugal