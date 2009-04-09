############################################
# ZONE: Qeynos Hills (qeytoqrg)
# DATABASE: PEQ-YKESHA-beta1
# LAST EDIT DATE: September 14, 2007
# VERSION: 1.0
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Konem_Matse
# ID: 4072
# TYPE: Monk
# RACE: Human
# LEVEL: 28
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Message to Konem ID-18921
# Grathin's Invoice ID-18922
#
# *** QUESTS INVOLVED IN ***
#
# Note for Konem
#
# *** QUESTS AVAILABLE TO ***
#
# Konem - Anyone not KOS
#
############################################

sub EVENT_ITEM {
   # Note from Phin_Esrinap, Message to Konem ID-18921
   if(plugin::check_handin(\%itemcount, 18921 => 1)) {
      quest::ding();
      quest::say("Oh I see.. Phin's always after me about something.  I mean, it's not my fault the order hasn't come in yet.  Hey, since I'm so busy right now, why don't you be a friend and take this back to Phin for me, huh?");
      # Grathin's Invoice ID-18922
      quest::summonitem("18922");
      # Silent Fist Clan faction
      quest::faction("300","2");
      # Guards of Qeynos faction
      quest::faction("135","2");
      # Ashen Order faction
      quest::faction("12","2");
      quest::exp("200");
   }
   # Give back incorrect items
   plugin::return_items(\%itemcount);
}
#END of FILE Zone:qeytoqrg  NPC:Konem_Matse 