############################################
# ZONE: West Freeport (freportw)
# DATABASE: PEQ-Velious
# LAST EDIT DATE: April 24,2005
# VERSION: 1.0
# BASE QUEST BY: PEQ Quest Team
# DEVELOPER: MWMDRAGON
#
# *** NPC INFORMATION ***
#
# NAME: Ping_Fuzzlecutter
# ID: 9133
# TYPE: Shopkeeper
# RACE: Gnome
# LEVEL: 37
#
# *** ITEMS GIVEN OR TAKEN ***
#
# A Gem Encrusted Casket ID-6708
# Full Gem Bag ID-6710
# Empty Gem Bag ID-17512
# Clumps of Hair ID- MISSING
# Mermaid Hair ID- MISSING
# Tattered Toupee ID- 12337
# Mane Attraction ID-12254
#
# *** QUESTS INVOLVED IN ***
#
#1 - Mane Attraction
#2 - The Bones of Darak Lightforge
#3 - Rain Caller
#
# *** QUESTS AVAILABLE TO ***
#
#1 - All
#2 - Paladin
#3 - Ranger
#
# *** NPC NOTES ***
#
# Merchant ID -9036
# Must Sell: Fuzzlecutter Formula 5000 ID-12260 (For Rain Caller Quest)
#
############################################

# added/corrected missing and existing dialogue for divine might quest
# incorrect casket handed to player fixed. should be gem encrusted casket.

sub EVENT_SAY {
  if ($text=~/coffin/i) {
    quest::say("You're looking for a craftsman, are you? Well look no further! For I, Ping Fizzlecutter, am the best in all the lands! Or at lest this side of Freeport. So you're the one that Valeron was talking about, eh? Well, while you were off traipsing around the lands he and I discussed the details of the coffin. I require nothing less than these [components]. Get me them and I will gladly make you a coffin any king would be proud to be buried in!");
  }
  if ($text=~/components/i) {
    quest::say("I require a diamond, a star ruby, a pearl, a [special fire emerald], a sapphire, a fire opal, and two enchanted platinum bars. Take this bag and combine the items once you have them all and bring it back to me.");
   # Empty Gem Bag ID-17512
    quest::summonitem(17512);
  }
  if ($text=~/special fire emerald/i) {
    quest::say("Now the fire emerald I want is not the normal one you receive from most jewelers. There is one jeweler I know who has the special one I want. Last time I heard, she had traveled to the elven outpost. Just ask her about special fire emeralds.");
  }
  if ($text=~/You can repair the toupee/i) {
    quest::say("Ah!! You have a toupee to repair. It must be the [Mane Attraction]. I gave a one out and it seems to always fall to pieces. Seeing as it has a 100 season warranty and I only created it 5 seasons ago, I suppose I can do it. Do you want me to [make the Mane Attraction].");
  }
  if($text=~/Mane Attraction/i) {
    quest::say("The Mane Attraction is a special toupee I created for a Gnome junker. He wasn't getting much attention at the taverns till I created the eye catching toupee. He became one Charismatic Gnome after that. Unfortunately, it seems to fall to pieces to easy and since it has a warranty, I have to fix it for him every time at no charge!! I will never make another. ");
  }
  if($text=~/make the Mane Attraction/i) {
    quest::say("If you have the original tattered toupee then I can do it. Before you give it to me I will also need three other items. I require two clumps of hair from a Hulking Gorilla and a strand of hair from a [certain mermaid].");
  }
  if($text=~/certain mermaid/i) {
    quest::say("I encountered a particular mermaid with beautiful hair!! She had beautiful golden tresses. I used a lock of her hair to create the Mane Attraction. That was a while back when I was in Faydwer.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 6710 => 1)) { # Full Gem Bag
    quest::emote("smiles broadly as he rifles through the bag, then looks up at you and says, 'Bout time! Here is the coffin as promised.'");
    quest::ding();
    quest::summonitem(17080); # Gem Encrusted Casket
  }
  else {
    plugin::return_items(\%itemcount);
  }

 ## # Clumps of Hair ID- 12335 - Lock of Hair ID- 12338 - Tattered Toupee ID- 12337
 
 if (plugin::check_handin(\%itemcount, 12335 => 2,12338 => 1, 12337 =>1 )) {
     quest::say("You are a good helper. Here you go. One genuine, charismatic, lady magnet, zero to hero making Mane Attraction!! Guarnteed to lower prices world wide. Guarnteed to last forever.. Err.. Well,.. It has a 1000 year warranty at least.");
     quest::summonitem(12254);
     quest::exp("200");
     quest::faction("47","3");
     quest::faction("184","3");
     quest::faction("217","3");
     quest::faction("217","3");
 }
}

#END of FILE Zone:freportw  ID:9133 -- Ping_Fuzzlecutter

