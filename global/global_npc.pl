sub EVENT_DEATH_COMPLETE { 
   my $killer = $entity_list->GetMobByID($killer_id);

   if ($killer->IsPet()) {
        $killer = $killer->GetOwner();
   }

   if ($killer->IsClient() or $killer->IsBot()) {
        my $group = $killer->CastToClient()->GetGroup();
        my $level = $killer->GetLevel();
        if ($group) {
            for (my $count = 0; $count < $group->GroupCount(); $count++) {
                if ($group->GetMember($count).GetLevel() > $level) {
                    $level = $group->GetMember($count).GetLevel();
                    $killer = $group->GetMember($count)->CastToClient();
                }
            }        
        }

        quest::debug("Con Color was: " . $killer->GetLevelConColor($npc->GetLevel()) );
   }
}
   
#define CON_GREEN		2
#define CON_LIGHTBLUE	18
#define CON_BLUE		4
#define CON_WHITE		10
#define CON_WHITE_TITANIUM		20
#define CON_YELLOW		15
#define CON_RED			13
#define CON_GRAY		6