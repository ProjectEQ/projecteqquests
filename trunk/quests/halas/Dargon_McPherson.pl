#############
#Quest Name: "deliver an elixir to young warriors"
#Quest Name: aka "Magic Elixir for the Warriors"
#LAST EDIT: 5/12/06
#DATABASE: Caveman + PEQ (from ServerPack 3.52)
#Author: Hamarabi, but I didn't write it, I just fixed it and completed the unfinished parts with the help of paaco, mrea, Muuss, and ylosh.
#NPC's Involved: 5
#Items Involved: 5
#Zones Involved: 2
#Zones Involved: Halas, Everfrost
#############
###NPC 1
#Name: Dargon McPerson
#NPCID: 29055
#Race 2 (Barbarian), Texture of 3, Size 7, gender of 0
#Location: Pit of Doom in Halas
#Level: 61
#Type: Warrior Guildmaster / Quest NPC
#Item Obtained: Full Bottle of Elixir
#############
###NPC 2
#Name: Talin O`Donal
#NPCID: 30074, 30118, 30129
#Race 2 (Barbarian), size 7, texture of 1, gender of 0
#Location: Everfrost at the Campfire in the tunnel to Halas
#Level: 2-4
#Type: Quest NPC
#Item Obtained: Three Quarters of Elixir
#############
###NPC 3
#Name: Bryndin McMill
#NPCID: 30065, 30115
#Race 2 (Barbarian), size 7, texture of 1, gender of 0
#Location: By Snowflake in Everfrost
#Level: 2-4
#Type: Quest NPC
#Item Obtained: One Half of Elixir
#############
###NPC 4
#Name: Arnis McLish
#NPCID: 30049
#Race 2 (Barbarian), size 7, texture of 0, gender of 0
#Location: By Blackburrow in Everfrost
#Level: 2-4
#Type: Quest NPC
#Item Obtained: One Quarter of Elixir
#############
###NPC 5
#Name: Megan OReilly
#NPCID: 30029, 30096, 30119
#Race 2 (Barbarian), size 7, texture of 0, gender of 1
#Location: Everfrost, out by a tower on the south side of the river near Permafrost
#Level: 2-4
#Type: Quest NPC
#Item Obtained: Empty Bottle of Elixir
#############
###Item 1
#Name: Full Bottle of Elixir
#Item Function: Quest Turn-in
###
###Item 2
#Name: Three Quarters of Elixir
#Item Function: Quest Turn-in
###
###Item 3
#Name: One Half of Elixir
#Item Function: Quest Turn-in
###
###Item 4
#Name: One Quarter of Elixir
#Item Function: Quest Turn-in
###
###Item 5
#Name: Empty Bottle of Elixir
#Item Function: Quest Turn-in
###

#Note: All of these NPC's are already in the game using Cavedude's Serverpack (EQEmuServerPack-3.52.exe)
#Note: I chose PEQ database during install

#Description: The point of this quest is to raise peoples faction with....
#Description: Merchant's of Halas, Shaman of Justice, Steel Warriors, and The Wolves of the North.

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Hail, mighty $name! I assume ye must be a [warrior o' the Wolves]. Why else would ye approach a trainer such as meself, then?");
  }
  if($text=~/warrior o/i) {
    quest::say("Aye, 'tis as I thought. I'm glad t' see we've warriors such as yerself amongst the Wolves o' the North. Lately, Kylan's been allowing too many scrawny warriors in, methinks. Nor have they fared well in Everfrost. Many frreeze to death, ye know... Will ye assist me and [deliver an elixir to young warriors] in Everfrost?");
  }
  if($text=~/deliver an elixir to young warriors/i) {
    quest::say("Ach, 'tis good o' ye! Take this bottle of elixir to Everfrost Peaks. Find Talin O'Donal. He'll take the first sip and then instruct ye on who else ye need to find. Do that, and I'll give ye a fine reward when ye return the empty elixir bottle. Good luck, then. Don't die.");
    quest::summonitem("13241");
  }
} 

sub EVENT_ITEM {
  if($itemcount{13245} == 1) {
    quest::say("Ye've proven yerself to be a cut above the rest and aided yer fellow warriors, no matter how worthless they were. Ye may take this. It was found in the snow by one of our foraging parties. I hope it can be of use to a warrior like yerself.");
    quest::exp(125);
    quest::ding();
    quest::summonitem(2012); # Leather Boots
    quest::faction(213,10); # 213 : Faction Merchant's of Halas
    quest::faction(294,10); # 294 : Faction Shaman of Justice
    quest::faction(311,10); # 311 : Faction Steel Warriors
    quest::faction(361,10); # 361 : Faction Wolves of the North
  }
  
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:halas  ID:29055 -- Dargon_McPherson 

