############################################
# ZONE: Feerrott (feerrott)
# DATABASE: Cavedude + PEQ (from server release 3.52)
# LAST EDIT: 5/1/06
# VERSION: 1.0
# DEVELOPER: ATTEMPT37
#
# *** NPC INFORMATION ***
#
# NAME: Oknoggin_Stonesmacker
# ID: 47126
# TYPE: Warrior
# RACE: Ogre
# LEVEL: 50
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Wax Sealed Note ID-20673
# Tiny Lute ID-20674
#
# *** QUESTS INVOLVED IN ***
#
# 1) Warrior epic quest
############################################

sub EVENT_SAY { 

if($text=~/Hail/i){
quest::say("Yoo leave me 'lone!"); }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20673 => 1)) {
    quest::emote("snatches the note from your hand and rips it open with his large hands.");
    quest::say("You take dis to Kargek. He want!");
    quest::ding();
    quest::exp("1000");
    quest::summonitem("20674"); #Tiny Lute
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:feerrott  ID:47126 -- Oknoggin_Stonesmacker 

