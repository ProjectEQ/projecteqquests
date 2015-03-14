#Blood Curse Antidote used in Halloween quest Lycanthrope's Cure to cure a_fallen_werewolf (20286)

sub EVENT_SPELL_EFFECT_NPC {
$ClientID = $entity_list->GetClientByID($caster_id);
$NPCTarget = $ClientID->GetTarget();
$NPCTypeID = $NPCTarget->GetNPCTypeID();
        if($NPCTypeID == 20286){
              $ClientID->SignalClient($ClientID, 667);
        }
}
