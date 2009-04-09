############################################
# ZONE: Bazaar
# DATABASE: PEQ PoP-LoY
# LAST EDIT DATE: January 26, 2009
# VERSION: 1.0
# DEVELOPER: Congdar
#
# *** NPC INFORMATION ***
#
# NAME: Aspen
# TYPE: NPC
# RACE: Wood Elf
# LEVEL: 10
#
# *** QUESTS INVOLVED IN ***
#
# 1 - Custom Quest - Buying Slaves(bots)
#
#
# *** QUESTS AVAILABLE TO ***
#
# 1 - Anyone meeting level requirements
#
#
############################################

sub EVENT_SAY {
   if($text=~/Hail/i) {
      quest::signalwith(151070, 1, 1);
      my $facemob = $entity_list->GetMobByNpcTypeID(151070);
      $npc->FaceTarget($facemob);
   }
}
# END of FILE Zone:bazaar -- Aspen.pl