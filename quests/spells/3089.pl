#Retributive Fire used in Halloween quest Great Zombie Attack to destroy zombie troopers (20284)

sub EVENT_SPELL_EFFECT_NPC {
$ClientID = $entity_list->GetClientByID($caster_id);
$NPCTarget = $ClientID->GetTarget();
$NPCTypeID = $NPCTarget->GetNPCTypeID();
        if($NPCTypeID == 20284){
              $npc->Kill();
              $ClientID->SignalClient($ClientID, 666);
        }
}
