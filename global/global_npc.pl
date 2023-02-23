sub EVENT_DAMAGE_GIVEN {
    if ($npc->IsPet()) {
        $entity_list->GetMobByID($entity_id)->AddToHateList($npc->GetOwner());
    }        
}

sub EVENT_SPAWN
{
    if ($npc->IsPet()) {  
        EVAL_PET($npc);
    }
}

sub EVENT_ENTER
{
    if ($npc->IsPet()) {
        quest::debug("I'm a pet, I zoned: " . $npc->GetCleanName());
    }  
}

sub EVAL_PET
{
        my $pet = shift;
        if ($pet->GetOwnerID()) {
                my $owner = $entity_list->GetClientByID($pet->GetOwnerID());
                
                my $owner_spelldmg = $owner->GetSpellDmg();
                my $owner_healamt = $owner->GetHealAmount();

                $pet->ModifyNPCStat("spellscale",$owner->GetSpellDmg());
                $pet->ModifyNPCStat("healscale",$owner->GetHealAmt());

                $pet->ModifyNPCStat("max_hp", $pet->GetMaxHP() * $owner_spelldmg);

                $pet->SetMaxHP();
        }
}