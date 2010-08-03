# Script for setting a cap on Growth spells
   
%RaceSizes = (
   1 => 6, # Human
   2 => 8, # Barbarian
   3 => 6, # Erudite
   4 => 5, # Wood Elf
   5 => 5, # High Elf
   6 => 5, # Dark Elf
   7 => 5, # Half Elf
   8 => 4, # Dwarf
   9 => 9, # Troll
   10 => 9, # Ogre
   11 => 3, # Halfling
   12 => 3, # Gnome
   128 => 6, # Iksar
   130 => 6, # Vah Shir
   330 => 5, # Froglok
   522 => 6, # Drakkin
);

# Sub to handle the growth limits so it doesn't have to be repeated multiple times
sub DoGrowth {
   my $Mob = $_[0]; # This is the Mob that was passed into the sub
   my $CurSize = $Mob->GetSize();
   if (!$CurSize) {
      $CurSize = 6;
   }
   my $CurRace = $Mob->GetRace();
   my $BaseSize = $RaceSizes{$CurRace};
   if (!$BaseSize) {
      $BaseSize = 6;
   }
   if ($CurSize < $BaseSize + 5) {
      $Mob->ChangeSize($CurSize + 1);
   }
}

sub EVENT_SPELL_EFFECT_CLIENT {
   my $ClientID = $entity_list->GetClientByID($caster_id);
   if ($ClientID) {
      $ClientTarget = $ClientID->GetTarget();
      if ($ClientTarget) {
         DoGrowth($ClientTarget);
      }
      else {
         DoGrowth($ClientID);
      }
   }
}

sub EVENT_SPELL_EFFECT_NPC {
   my $NPCID = $entity_list->GetMobByID($caster_id);
   if ($NPCID) {
      $NPCTarget = $NPCID->GetTarget();
      if ($NPCTarget) {
         DoGrowth($NPCTarget);
      }
      else {
         DoGrowth($NPCID);
      }
   }
}