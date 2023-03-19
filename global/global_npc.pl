sub EVENT_SPAWN
{
    if ($npc->IsPet() and $npc->GetOwner()->IsClient()) {  
        EVAL_PET($npc);
    }
}

sub EVENT_DAMAGE_GIVEN {
    if ($npc->IsPet()) {
        $entity_list->GetMobByID($entity_id)->AddToHateList($npc->GetOwner());
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

                $pet->ModifyNPCStat("max_hp", $pet->GetMaxHP() * ($owner_healamt + 1));
                $pet->ModifyNPCStat("ac", $pet->GetNPCStat("ac") * ($owner_spelldmg + 1));
                $pet->ModifyNPCStat("atk", $pet->GetNPCStat("atk") * ($owner_spelldmg + 1));
                $pet->ModifyNPCStat("hp_regen", $pet->GetNPCStat("hp_regen") * ($owner_healamt + 1));
                $pet->ModifyNPCStat("min_hit", $pet->GetNPCStat("min_hit") * (($owner_spelldmg / 2) + 1));
                $pet->ModifyNPCStat("max_hit", $pet->GetNPCStat("max_hit") * (($owner_spelldmg / 2) + 1));

                $pet->ModifyNPCStat("fr", $owner->GetFR());
                $pet->ModifyNPCStat("cr", $owner->GetCR());
                $pet->ModifyNPCStat("mr", $owner->GetMR());
                $pet->ModifyNPCStat("pr", $owner->GetDR());
                $pet->ModifyNPCStat("dr", $owner->GetPR());

                $pet->ModifyNPCStat("accuracy", $pet->GetNPCStat("accuracy") * (($owner_spelldmg / 2) + 1));
                $pet->ModifyNPCStat("atk", $pet->GetNPCStat("atk") * (($owner_spelldmg / 2) + 1));                

                $pet->ModifyNPCStat("avoidance", $pet->GetNPCStat("avoidance") * (($owner_healamt / 2) + 1));

                $pet->SetMaxHP();

                if ($owner->GetClass() == 13) {
                    # Handling for Mage Epic Bonus
                    my @items = ($owner->GetItemIDAt(quest::getinventoryslotid("primary")),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),0),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),1),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),2),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),3),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),4),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),5));
                    #TODO - Add the id of the 1.0 stat augment here
                    foreach (@items) {
                        quest::debug($_);
                        if ($_ == 28034) {
                            # TODO: Is 100 the right effect chance value here?
                            $pet->AddMeleeProc(848, 100);
                            $pet->ModifyNPCStat("max_hp", $pet->GetMaxHP() + 3000);
                            $pet->ModifyNPCStat("min_hit", $pet->GetNPCStat("min_hit") * 1.1);
                            $pet->ModifyNPCStat("max_hit", $pet->GetNPCStat("max_hit") * 1.1);
                            $pet->SetMaxHP();

                            quest::debug("Applying Mage Epic Pet Buffs");
                            last;
                        }
                    }
                }
                elsif ($owner->GetClass() == 15) {
                    # Handling for Beastlord Epic Bonus
                    my @items = ($owner->GetItemIDAt(quest::getinventoryslotid("primary")),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),0),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),1),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),2),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),3),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),4),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("primary"),5),
                                 $owner->GetItemIDAt(quest::getinventoryslotid("secondary")),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("secondary"),0),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("secondary"),1),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("secondary"),2),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("secondary"),3),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("secondary"),4),
                                 $owner->GetAugmentAt(quest::getinventoryslotid("secondary"),5));
                    foreach (@items) {
                        quest::debug($_);
                        #TODO - Add the ids of the 1.0 stat augment here
                        if ($_ == 8495 || $_ == 8496) {
                            # TODO: This is a group heal proc -- is that what we want it to be?
                            # TODO: Is 30 the right effect chance value here?
                            $pet->AddMeleeProc(3577, 30);
                            $pet->ModifyNPCStat("max_hp", $pet->GetMaxHP() + 3000);
                            $pet->ModifyNPCStat("min_hit", $pet->GetNPCStat("min_hit") * 1.1);
                            $pet->ModifyNPCStat("max_hit", $pet->GetNPCStat("max_hit") * 1.1);
                            $pet->SetMaxHP();

                            quest::debug("Applying Beastlord Epic Pet Buffs");
                            last;
                        }
                    }
                }
        }
}