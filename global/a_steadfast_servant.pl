#
# Steadfast Servant Veteran AA

$HPThreshold = 50;      # HP Threshold at which HoT will be cast.
$Frequency = 35;        # Frequency in seconds with which the EVENT_TIMER is executed.
$Range = 100;           # How close a player must be for a chance to be buffed.

@ManaRegenSpells = (697, 174, 1693, 6898);      # Breeze, Clarity, Clarity II, Servant's Breath
@HasteSpells = (10, 170, 171, 172);             # Augmentation, Alacrity, Celerity, Swift like the wind
@HoTSpells = (2502, 2175, 1283, 1522);          # Celestial Remedy,  Health, Cleansing, Elixir
@ACSpells = (18, 19, 20, 3470);                 # Guard, Armor of Faith, Shield of Words, Ward of Gallantry

sub EVENT_SPAWN {
        quest::settimer("RandomAction", $Frequency);
}

sub EVENT_TIMER {

        # First we find our owner and see if is in range and in need of any buffs.
        #
        $OwnerID = $npc->GetFollowID();

        if($OwnerID <= 0)
        {
                return;
        }
        $Owner = $entity_list->GetClientByID($OwnerID);

        if($Owner)
        {
                $x = $Owner->GetX();
                $y = $Owner->GetY();
                $z = $Owner->GetZ();

                $Distance = $npc->CalculateDistance($x, $y, $z);

                if($Distance < $Range) {
                        if(BuffPlayer($Owner))
                        {
                                # We cast a buff on our owner, so we are done for this cycle.
                                return;
                        }
                }
        }

        # Our owner didn't need any buffs, so look for someone else within range.
        #
        $c = $entity_list->GetRandomClient($x, $y, $z, $Range, $Owner);

        if(!$c)
        {
                return;
        }

        BuffPlayer($c);
}

sub BuffPlayer
{
        $c = $_[0];

        if($c)
        {
                $ClientID = $c->GetID();

                $HPRatio = ($c->GetHP() / $c->GetMaxHP()) * 100;

                $Level = $c->GetLevel();

                if($Level < 15)
                {
                        $SpellSet = 0;
                }
                elsif($Level < 30)
                {
                        $SpellSet = 1;
                }
                elsif($Level < 50)
                {
                        $SpellSet = 2;
                }
                else
                {
                        $SpellSet = 3;
                }

                $ManaRegenSpell = $ManaRegenSpells[$SpellSet];
                $HasteSpell = $HasteSpells[$SpellSet];
                $HoTSpell = $HoTSpells[$SpellSet];
                $ACSpell = $ACSpells[$SpellSet];

                if($HPRatio <= $HPThreshold)
                {
                        # Check if the player already has our HoT spell on.
                        #
                        $Slot = $c->FindBuff($HoTSpell);
                        if(!$Slot)
                        {
                                if($c->CanBuffStack($HoTSpell, $npc->GetLevel(), True) >= 0)
                                {
                                        $npc->FaceTarget($c);
                                        $npc->CastSpell($HoTSpell, $ClientID);
                                        return 1;
                                }
                        }
                }

                # Next the mana regen buff. Only cast this if the player uses mana.
                #
                if($c->GetMaxMana() > 0)
                {
                        $Slot = $c->FindBuff($ManaRegenSpell);
                        if(!$Slot)
                        {
                                if($c->CanBuffStack($ManaRegenSpell, $npc->GetLevel(), True) >= 0)
                                {
                                        $npc->FaceTarget($c);
                                        $npc->CastSpell($ManaRegenSpell, $ClientID);
                                        return 1;
                                }
                        }
                }

                # Finally, see if they need our Haste or AC buff.
                #
                @Buffs = ($HasteSpell, $ACSpell);

                foreach $Spell (@Buffs)
                {
                        $Slot = $c->FindBuff($Spell);
                        if(!$Slot)
                        {
                                if($c->CanBuffStack($Spell, $npc->GetLevel(), True) >= 0)
                                {
                                        $npc->FaceTarget($c);
                                        $npc->CastSpell($Spell, $ClientID);
                                        return 1;
                                }
                        }
                }
        }

        return 0;
} 