############################################
# ZONE: East Freeport (freeporte)
# DATABASE: Cavedude + PEQ (from server release 3.52)
# LAST EDIT DATE: 5/1/06
# VERSION: 1.0
# BASE QUEST BY: PEQ Team
# DEVELOPER: MWMDRAGON
# EDITED BY: ATTEMPT37
#
# *** NPC INFORMATION ***
#
# NAME: Kargek_Redblade
# ID: 10117
# TYPE: Warrior
# RACE: Human
# LEVEL: 50
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Wax Sealed Note ID-20673
# Tiny Lute ID-20674
# Redblade's Legacy ID- 18083
# Tanel's Note to Kargek ID-20684
# Spiroc Wingblade ID-20679
# Red Scabbard ID-17859
#
# *** QUESTS INVOLVED IN ***
#
#1 - Jagged Blade of War - Warrior Epic
#
#
#
#
############################################

######## EVENT_SAY AREA ####################
### Called when the NPC is spoken to by a PC

sub EVENT_SAY {
  if($class eq "Warrior") {
    if($text=~/Hail/i)   {
      quest::emote("looks up from his forge and says, 'Hello there, can I help you?' Your eyes are drawn to an extremely large [red sword Scabbard] strapped to his back with no sword in it.");
      quest::say("I said, can I help you or do you need help from [Wenden]?");
    }
    if($text=~/Wenden/i) {
      quest::emote("points to the other side of the forge and says, 'Wenden is my partner. He is standing right over there. If it is a question about a weapon, he will probably have the answers.'");
    }
    if($text=~/red sword Scabbard/i) {
      quest::emote("turns to look at you and says, 'It is a family heirloom. I might tell you the story behind it if you do me a little [favor].'");
    }
    if($text=~/favor/i) {
      quest::say("An associate of mine is wandering somewhere in the Feerrott. His name is Oknoggin Stonesmacker. If you will deliver this note to him, I would appreciate it.");
      quest::summonitem("20673"); # Wax Sealed Note ID-20673
    }
  }
}

######## EVENT_ITEM AREA ###################
### Called when the NPC is handed items

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20674 => 1)) { # Tiny Lute
    quest::say("Thank you for delivering the note to my associate. Take this book - It will tell you A little of the history of the old scabbard. If you would like to own the scabbard, seek out my younger brother Tenal and give him the book.");
    quest::ding();
    quest::exp(1000);
    quest::summonitem("18083"); # Redblade's Legacy
  }
  if (plugin::check_handin(\%itemcount, 20684 => 1, 20679 => 1)) { # Tenal's Note to Kargek & Spiroc Wingblade
    quest::say("What is this? A note from my brother? Thank you for the gift as well.");
    quest::emote("reads the note and hands you the red scabbard. Your mind is filled with the sound of battle and a voice. 'Place the ancient sword blade, ancient blade, finely crafted dragon head hilt, and the jeweled dragon head hilt into the scabbard to receive your rewards. If you think you are worthy, place your rewards into the scabbard and see what havoc you can unleash on the world.'");
    quest::emote("addresses you as you turn to leave. 'One more thing. Gartrog over there has told me of a great discovery. Seems there are all sorts of stones being found in the recently discovered lost dungeons scattered around Antonica.  The Wayfarer's Brotherhood has found a way to make items even more powerful by using the stones with existing items.'");
    quest::ding();
    quest::exp("1000000");
    quest::summonitem("17859"); # Red Scabbard
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:freporte  ID:10117 -- Kargek_Redblade

