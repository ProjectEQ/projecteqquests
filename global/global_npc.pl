sub EVENT_DAMAGE_GIVEN {
    if ($npc->IsPet()) {
        $entity_list->GetMobByID($entity_id)->AddToHateList($npc->GetOwner());
    }        
}

sub EVENT_SPAWN
{
    if ($npc->IsPet()) {
        quest::debug("I'm a pet, I spawned: " . $npc->GetCleanName());
    }
}

sub EVENT_SPAWN_ZONE
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

                $pet->ModifyNPCStat("max_hp", $owner_level * 100 * ($owner_spelldmg));
                $pet->ModifyNPCStat("ac", $owner_level * 3 * ($owner_spelldmg));
                $pet->ModifyNPCStat("atk", $owner_level * 1 * ($owner_spelldmg));
                $pet->ModifyNPCStat("max_hit", $owner_level * 2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("min_hit", $owner_level * 0.5 * ($owner_spelldmg));

                $pet->ModifyNPCStat("fr", $owner->GetFR()/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("cr", $owner->GetCR()/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("dr", $owner->GetDR()/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("pr", $owner->GetPR()/2 * ($owner_spelldmg));
                $pet->ModifyNPCStat("mr", $owner->GetMR()/2 * ($owner_spelldmg));

                $pet->ModifyNPCStat("spellscale",$owner->GetSpellDmg());
                $pet->ModifyNPCStat("healscale",$owner->GetHealAmt());
                $pet->ModifyNPCStat("runspeed", 2.5);

                $pet->SetMaxHP();
        }
}