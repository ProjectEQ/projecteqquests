sub EVENT_SAY {
   # Prevent pets or charmed NPCs from using the default.pl
   if (!$npc || $npc->GetOwnerID() || $npc->GetSwarmOwner())
   {
      return;
   }
   if ($text=~/hail/i) {
    quest::say("Shh , I think I hear the kobolds.");
   }
}

sub EVENT_ITEM {

   # Prevent pets or charmed NPCs from using the default.pl
   if (!$npc || $npc->GetOwnerID() || $npc->GetSwarmOwner())
   {
      plugin::GivePetItems();
      return;
   }

   plugin::return_items(\%itemcount);

}