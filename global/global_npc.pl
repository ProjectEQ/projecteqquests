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

                if ($owner->GetClass() == 13) {
                    my @items = ($owner->GetItemIDAt(quest::getinventoryslotid("primary")),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),0),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),1),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),2),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),3),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),4),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),5));
                    #TODO - Add the id of the 1.0 stat augment here
                    if (grep("208034",@items)) {
                        $pet->AddMeleeProc(848, 100);
                        $pet->ApplySpellBuff(847);
                        $pet->ModifyNPCStat("max_hp", $pet->GetMaxHP() + 3000);

                        quest::debug("Applying Epic Pet Buffs");
                    }
                } 
        }
}