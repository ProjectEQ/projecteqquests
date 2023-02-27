sub EVENT_SPAWN
{
    if ($npc->IsPet() and $npc->GetOwner()->IsClient()) {  
        EVAL_PET($npc);
    }
}

sub EVAL_PET
{
        my $pet = shift;
        if ($pet->GetOwnerID()) {
                my $owner = $entity_list->GetClientByID($pet->GetOwnerID());
                
                my $owner_spelldmg = ($owner->GetSpellDamage() / 100);
                my $owner_healamt = ($owner->GetHealAmount() / 100);

                $pet->ModifyNPCStat("spellscale",$owner->GetSpellDamage() + 100);
                $pet->ModifyNPCStat("healscale",$owner->GetHealAmount() + 100);

                $pet->ModifyNPCStat("max_hp", $pet->GetMaxHP() * ($owner_spelldmg + 1));
                $pet->ModifyNPCStat("ac", $pet->GetNPCStat("ac") * ($owner_spelldmg + 1));
                $pet->ModifyNPCStat("atk", $pet->GetNPCStat("atk") * ($owner_spelldmg + 1));
                $pet->ModifyNPCStat("hp_regen", $pet->GetNPCStat("hp_regen") * ($owner_spelldmg + 1));
                $pet->ModifyNPCStat("min_hit", $pet->GetNPCStat("min_hit") * (($owner_spelldmg / 2) + 1));
                $pet->ModifyNPCStat("max_hit", $pet->GetNPCStat("max_hit") * (($owner_spelldmg / 2) + 1));

                $pet->ModifyNPCStat("runspeed", $pet->GetNPCStat("runspeed") * (($owner_spelldmg / 3) + 1));

                $pet->ModifyNPCStat("fr", $owner->GetFR());
                $pet->ModifyNPCStat("cr", $owner->GetCR());
                $pet->ModifyNPCStat("mr", $owner->GetMR());
                $pet->ModifyNPCStat("pr", $owner->GetDR());
                $pet->ModifyNPCStat("dr", $owner->GetPR());

                $pet->SetMaxHP();
        }
}