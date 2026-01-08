# Seer_Mal_NaeShi.pl
use strict;
use warnings;

# ====== CONFIG ======
# Adjust if your zone id differs
use constant PONB_ZONE_ID => 205;   # ponightmareb (Lair of Terris Thule)

# EQEmu Quest Engine Globals (required for 'use strict')
our ($npc, $client, $name, $text, %qglobals);

sub EVENT_SAY {

    if ($text =~ /hail/i) {
        quest::say("Greetings, $name. Breathe in… breathe out… I will recall your memories and tell you exactly which trials you have mastered and which still elude you.");
        AutoGrantAccess();  # <-- ensure PoNB access when prerequisites are met
        ShowFlags();
        return;
    }

    if ($text =~ /guided meditation/i) {
        $client->Message(1, "You converse with Seer Mal Nae`Shi as she guides your meditation... your mind clears.");
        $client->Message(9, "To see your current progress at any time, just say [flags] or [unlock memories].");
        return;
    }

    if ($text =~ /^(flags|unlock memories)$/i) {
        ShowFlags();
        return;
    }

    # Optional helper to reconcile the Construct flag for pre-projection kills
    if ($text =~ /fix missed pon/i) {
        FixMissedPoN();
        AutoGrantAccess();
        return;
    }

    if ($text =~ /special zones/i) {
        $client->Message(9, "Temple of Marr requires: Bertox, Terris Thule, all three Halls of Honor trials, and Saryrn (plus their prerequisite chains). Elemental planes require finishing the lower-plane flag set and defeating Agnarr and Mithaniel Marr. Ask me for [flags] any time to see precisely what you have and what you still need.");
        return;
    }

    # Simple test/utility commands (optional; comment out if you don't want them exposed)
    if ($text =~ /test ponb/i) {
        $client->Message(15, "Attempting to move you to PoNightmareB for verification.");
        quest::movepc(PONB_ZONE_ID, 0, 0, 0);
        return;
    }
}

############################################
# Helper subs
############################################

sub Have { return defined $qglobals{ $_[0] } && $qglobals{ $_[0] } ne ''; }
sub Green { $client->Message(12, $_[0]); }  # have
sub Grey  { $client->Message(9,  $_[0]); }  # missing / info
sub Gold  { $client->Message(4,  $_[0]); }  # milestone / summary

# Automatically grant PoNightmareB zone access if prerequisites are satisfied
sub AutoGrantAccess {
    my $has_jezith    = Have('pop_pon_hedge_jezith');
    my $has_construct = Have('pop_pon_construct');

    # If you want Terris also to be required for entry, set $require_terris = 1
    my $require_terris = 0;
    my $has_terris     = Have('pop_ponb_terris');

    if ($has_jezith && $has_construct && (!$require_terris || $has_terris)) {
        # Grant zone flag silently (player keeps it permanently)
        quest::set_zone_flag(PONB_ZONE_ID);
        Gold("Your memories align. I have ensured your path to the Lair of Terris Thule is open.");
    } else {
        # Helpful hint if they’re close but missing a step
        if ($has_jezith && !$has_construct) {
            Grey("I sense you spoke with Jezith, but your confrontation with the Construct of Nightmares is not recorded.");
        } elsif (!$has_jezith) {
            Grey("Your mind has not recalled Jezith’s warning in Tranquility. Seek her to begin the hedges.");
        }
    }
}

sub ShowFlags {
    $client->Message(15, "— Your Planes of Power progress —");

    # Plane of Nightmare path
    Have('pop_pon_hedge_jezith') ? Green("✓ Jezith preflag (Tranquility) recorded.") : Grey("✗ Jezith preflag (Tranquility) not recorded.");
    Have('pop_pon_construct')    ? Green("✓ Construct of Nightmares defeated (Hedge).") : Grey("✗ Construct of Nightmares not recorded.");
    Have('pop_ponb_terris')      ? Green("✓ Terris Thule defeated.") : Grey("✗ Terris Thule not defeated.");
    Have('pop_ponb_poxbourne')   ? Green("✓ Spoke with Poxbourne after Terris.") : Grey("✗ Did not speak with Poxbourne after Terris.");

    # Plane of Innovation chain
    Have('pop_poi_dragon')           ? Green("✓ Defeated Innovation dragon (Manaetic).") : Grey("✗ Innovation dragon not recorded.");
    Have('pop_poi_behometh_preflag') ? Green("✓ Spoke with the factory gnome.") : Grey("✗ Did not speak with the factory gnome.");
    Have('pop_poi_behometh_flag')    ? Green("✓ Defeated the Manaetic Behemoth and quickly hailed the gnome.") : Grey("✗ Behemoth win + quick hail not recorded.");

    # Plane of Disease → CoD
    Have('pop_pod_alder_fuirstel') ? Green("✓ Spoke with Adler Fuirstel (PoTranquility).") : Grey("✗ Did not speak with Adler Fuirstel (preflag).");
    Have('pop_pod_grimmus_planar_projection') ? Green("✓ Grummus defeated.") : Grey("✗ Grummus not recorded.");
    Have('pop_pod_elder_fuirstel') ? Green("✓ Spoke with Elder Fuirstel (post-Grummus).") : Grey("✗ Did not speak with Elder Fuirstel (post-Grummus).");

    # Plane of Justice → Valor/Storms
    Have('pop_poj_mavuin')       ? Green("✓ Spoke with Mavuin (pledged to plead his case).") : Grey("✗ Mavuin not recorded.");
    Have('pop_poj_tribunal')     ? Green("✓ Showed your trial mark to the Tribunal.") : Grey("✗ Tribunal did not see your trial mark.");
    Have('pop_poj_valor_storms') ? Green("✓ Returned to Mavuin (tribunal will hear his case).") : Grey("✗ Did not return to Mavuin after the Tribunal.");

    # Valor/Storms specifics
    Have('pop_pov_aerin_dar') ? Green("✓ Aerin`Dar defeated (PoValor).") : Grey("✗ Aerin`Dar not recorded.");
    if (defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 3) {
        Green("✓ Askr step 1 complete (PoStorms).");
    } else {
        Grey("✗ Askr step 1 not complete (PoStorms).");
    }
    Have('pop_pos_askr_the_lost_final') ? Green("✓ Giants slain; Askr’s task complete (BoT access chain).") : Grey("✗ Giants not recorded as slain for Askr.");

    # CoD (Bertox) chain
    Have('pop_cod_preflag') ? Green("✓ Carprin cycle complete (CoD preflag).") : Grey("✗ Carprin cycle not recorded (CoD preflag).");
    Have('pop_cod_bertox')  ? Green("✓ Bertoxxulous defeated.") : Grey("✗ Bertoxxulous not recorded.");
    Have('pop_cod_final')   ? Green("✓ Spoke with Adler after Bertox.") : Grey("✗ Did not speak with Adler after Bertox.");

    # Plane of Torment chain
    Have('pop_pot_shadyglade')   ? Green("✓ Spoke with Shadyglade (Torment line).") : Grey("✗ Did not speak with Shadyglade.");
    Have('pop_pot_newleaf')      ? Green("✓ Keeper of Sorrows defeated.") : Grey("✗ Keeper of Sorrows not recorded.");
    Have('pop_pot_saryrn')       ? Green("✓ Saryrn defeated.") : Grey("✗ Saryrn not recorded.");
    Have('pop_pot_saryrn_final') ? Green("✓ Spoke with Shadyglade after Saryrn.") : Grey("✗ Did not speak with Shadyglade after Saryrn.");

    # Halls of Honor / Temple of Marr
    Have('pop_hoh_faye')  ? Green("✓ HoH Trial: Faye.")  : Grey("✗ HoH Trial: Faye missing.");
    Have('pop_hoh_trell') ? Green("✓ HoH Trial: Trell.") : Grey("✗ HoH Trial: Trell missing.");
    Have('pop_hoh_garn')  ? Green("✓ HoH Trial: Garn.")  : Grey("✗ HoH Trial: Garn missing.");
    Have('pop_hohb_marr') ? Green("✓ Lord Mithaniel Marr defeated.") : Grey("✗ Lord Mithaniel Marr not recorded.");

    # Drunder (Tactics)
    Have('pop_tactics_tallon') ? Green("✓ Tallon Zek defeated.") : Grey("✗ Tallon Zek not recorded.");
    Have('pop_tactics_vallon') ? Green("✓ Vallon Zek defeated.") : Grey("✗ Vallon Zek not recorded.");
    Have('pop_tactics_ralloz') ? Green("✓ Rallos Zek the Warlord defeated.") : Grey("✗ Rallos Zek the Warlord not recorded.");

    # Sol Ro Tower / Fire
    Have('pop_sol_ro_arlyxir')  ? Green("✓ Arlyxir defeated (Tower of Sol Ro).") : Grey("✗ Arlyxir missing.");
    Have('pop_sol_ro_dresolik') ? Green("✓ Protector of Dresolik defeated.") : Grey("✗ Dresolik missing.");
    Have('pop_sol_ro_jiva')     ? Green("✓ Jiva defeated.") : Grey("✗ Jiva missing.");
    Have('pop_sol_ro_xuzl')     ? Green("✓ Xuzl defeated.") : Grey("✗ Xuzl missing.");
    Have('pop_sol_ro_rizlona')  ? Green("✓ Rizlona defeated.") : Grey("✗ Rizlona missing.");
    Have('pop_sol_ro_solusk')   ? Green("✓ Solusek Ro defeated.") : Grey("✗ Solusek Ro missing.");

    # Elemental bosses
    Have('pop_fire_fennin_projection')    ? Green("✓ Fennin Ro defeated (Fire).") : Grey("✗ Fennin Ro missing.");
    Have('pop_wind_xegony_projection')    ? Green("✓ Xegony defeated (Air).") : Grey("✗ Xegony missing.");
    Have('pop_water_coirnav_projection')  ? Green("✓ Coirnav defeated (Water).") : Grey("✗ Coirnav missing.");
    Have('pop_eartha_arbitor_projection') ? Green("✓ Arbitor of Earth (PoEarth A) defeated.") : Grey("✗ Arbitor of Earth missing.");
    Have('pop_earthb_rathe')              ? Green("✓ Rathe Council defeated (PoEarth B).") : Grey("✗ Rathe Council missing.");

    # Grand librarian / Time
    Have('pop_elemental_grand_librarian') ? Green("✓ Spoke with the Grand Librarian (Elemental access).") : Grey("✗ Grand Librarian not recorded.");
    Have('pop_time_maelin')               ? Green("✓ Plane of Time access complete.") : Grey("✗ Plane of Time access not complete.");

    Gold("Tip: If you killed Terris Thule long ago before a projection existed and your Construct flag is missing, say [fix missed PoN] and I’ll reconcile it.");
}

# Carefully backfill only the classic PoN-era gap:
# If Jezith preflag is present AND Terris kill is recorded, but Construct is missing, grant Construct.
sub FixMissedPoN {
    if (Have('pop_ponb_terris') && Have('pop_pon_hedge_jezith') && !Have('pop_pon_construct')) {
        quest::setglobal('pop_pon_construct', 1, 5, 'F');   # character-scoped, persistent
        Green("Reconciled: Marked Construct of Nightmares as complete based on your Terris kill and Jezith preflag.");
        ShowFlags();
    } else {
        Grey("No PoN reconciliation needed (either Construct is already set, Terris not recorded, or Jezith preflag missing).");
    }
}
