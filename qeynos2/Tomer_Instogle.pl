##########################################
# ZONE: North Qeynos (qeynos2)
# DATABASE: PEQ-YKESHA-beta1
# LAST EDIT DATE: September 30, 2007
# VERSION: 1.1
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Tomer Instogle
# ID: 2030
# TYPE: Monk
# RACE: Human
# LEVEL: 1
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Bag of Provisions ID-20456
#
# *** QUESTS INVOLVED IN ***
#
# Tomer's Rescue
#
# *** QUESTS AVAILABLE TO ***
#
# Anyone flagged by Seta_Bakindo
#
############################################
# items: 20459

sub EVENT_SAY {
   # You must be flagged by Seta_Bakindo for this quest
   if($FindTomer == 1) {
      if($text=~/Hail/i) {
         quest::say("Ahhhgggg.. Those mangy [dogs] put up a tough fight.. If I don't make it back to the [Clan House] soon, it'll all be over for me.");
      }
      if($text=~/dogs/i or $text=~/mutts/i) {
         quest::say("It's those Darkpaws.. They've beat me pretty badly.. but they'll get theirs soon enough!");
      }
      if($text=~/clan house/i) {
         quest::say("I am a new member of the Silent Fist Clan.. I need someone from my guild to help me find my way back.");
      }
      if($text=~/Seta sent me to find you/i) {
         quest::say("Oh.. Thank goodness you found me.. I'm lost and weak, those [mutts] are a vicious lot.. an you carry my [backpack] for me?");
      }
      if($text=~/backpack/i) {
         # This flag is set by Seta_Bakindo
         quest::say("Thank you, friend.. Now, can you [lead me back to Master Seta] of the Silent Fist Clan? ");
         # Bag of Provisions ID-20456
         quest::summonitem("20459");
      }
      if($text=~/lead you back to master seta/i) {
         quest::say("Lead the way, and I shall follow. When we make it back, please inform Seta that you have rescued me.");
         # Initialize flag to Seta_Bakindo for this player
         quest::targlobal("SetaTomer", 1, "M30", 2086, $charid, $zoneid);
         # Have Tomer follow this player
         quest::follow($userid);
      }
   }
   # You must have the updated flag from Seta_Bakindo for this part quest
   elsif($FindTomer == 2) {
      if($text=~/Hail/i) {
         quest::say("Yes, he saved my life.. I owe him much thanks. Please return my pack to me now, good friend.");
      }
   }
}

sub EVENT_ITEM {
   # You must have the updated flag by Seta_Bakindo and have Tomer's Bag of Provisious ID-20459 to complete this quest
   if($FindTomer == 2 && plugin::check_handin(\%itemcount, 20459 => 1)) {
      quest::ding();
      quest::say("Oh, you have the makings of a true hero.. The Silent Fist Clan is proud to have you as ally. May your soul guide and protect you through these chaotic times.");
      quest::exp("100");
      
      quest::faction(309,35); # Silent Fist Clan faction
      quest::faction(262,5); # Guards of Qeynos
      quest::faction(361,1); # Ashen Order faction
      
      # We are finished with this flag set by Seta_Bakindo
      quest::delglobal("FindTomer");
      $FindTomer=undef;
      # Release Tomer from following the player... he will walk back to his spawn point
      quest::sfollow();
   }
}
# END of FILE Zone:qeynos2  ID:2030 -- Tomer_Instogle
