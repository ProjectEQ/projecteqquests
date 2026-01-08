# Seer_Mal_Nae_Shi.pl
use strict;
use warnings;
our ($npc, $client, $name, $text, %qglobals);

# Resolve zone id by short name at runtime
sub zone_id_by_short {
    my ($short) = @_;
    my $dbh = quest::getdbh();
    my $sth = $dbh->prepare("SELECT id FROM zone WHERE short_name=? LIMIT 1");
    $sth->execute($short);
    my ($id) = $sth->fetchrow_array();
    $sth->finish();
    return $id || 0;
}

my $PONB_SHORT = 'ponightmareb';
my $PONB_ID    = 0;  # resolved on first hail

sub EVENT_SAY {
    if ($text =~ /hail/i) {
        $PONB_ID ||= zone_id_by_short($PONB_SHORT);
        quest::say("Greetings, $name. I will read your memories and ensure your paths are open.");
        autogrant_ponb();
        show_flags();
        return;
    }

    if ($text =~ /^(flags|unlock memories)$/i) { show_flags(); return; }

    if ($text =~ /guided meditation/i) {
        $client->Message(1, "Your mind clears. Say [flags] any time for a full audit.");
        return;
    }

    if ($text =~ /fix missed pon/i) { fix_missed_pon(); autogrant_ponb(); return; }

    if ($text =~ /grant ponb/i) {  # GM helper: force add zone flag
        $PONB_ID ||= zone_id_by_short($PONB_SHORT);
        if ($PONB_ID) {
            quest::set_zone_flag($PONB_ID);
            $client->Message(4, "Granted zone flag for $PONB_SHORT (id=$PONB_ID).");
        } else {
            $client->Message(9, "Could not resolve zone id for $PONB_SHORT.");
        }
        return;
    }
}

# ---------- helpers ----------
sub have { return defined $qglobals{ $_[0] } && $qglobals{ $_[0] } ne ''; }
sub green { $client->Message(12, $_[0]); }
sub grey  { $client->Message(9,  $_[0]); }
sub gold  { $client->Message(4,  $_[0]); }

sub autogrant_ponb {
    $PONB_ID ||= zone_id_by_short($PONB_SHORT);
    if (!$PONB_ID) { grey("Debug: cannot resolve zone id for $PONB_SHORT."); return; }

    my $has_before = $client->HasZoneFlag($PONB_ID) ? 1 : 0;
    my $jezith     = have('pop_pon_hedge_jezith');
    my $construct  = have('pop_pon_construct');

    # Grant entry with Jezith + Construct (no projection required)
    if ($jezith && $construct && !$has_before) {
        quest::set_zone_flag($PONB_ID);
    }

    my $has_after = $client->HasZoneFlag($PONB_ID) ? 1 : 0;
    if ($has_after) {
        gold("Your path to the Lair of Terris Thule is open. (ZoneFlag $PONB_SHORT=$PONB_ID present)");
    } else {
        if (!$jezith)    { grey("Missing Jezith preflag (Plane of Tranquility)."); }
        if (!$construct) { grey("Construct of Nightmares not recorded from the Hedge event."); }
        grey("You do not currently possess ZoneFlag for $PONB_SHORT (id=$PONB_ID).");
    }
}

sub show_flags {
    $client->Message(15, "— Your Planes of Power progress —");

    # Plane of Nightmare path
    have('pop_pon_hedge_jezith') ? green("✓ Jezith preflag (Tranquility) recorded.") : grey("✗ Jezith preflag missing.");
    have('pop_pon_construct')    ? green("✓ Construct of Nightmares defeated (Hedge).") : grey("✗ Construct of Nightmares missing.");
    have('pop_ponb_terris')      ? green("✓ Terris Thule defeated.") : grey("✗ Terris Thule missing.");
    have('pop_ponb_poxbourne')   ? green("✓ Spoke with Poxbourne after Terris.") : grey("✗ Poxbourne (post-Terris) missing.");

    # Plane of Innovation
    have('pop_poi_dragon')           ? green("✓ Innovation dragon defeated.") : grey("✗ Innovation dragon missing.");
    have('pop_poi_behometh_preflag') ? green("✓ Spoke to the factory gnome.") : grey("✗ Factory gnome preflag missing.");
    have('pop_poi_behometh_flag')    ? green("✓ Behemoth win + quick hail recorded.") : grey("✗ Behemoth win not recorded.");

    # Plane of Disease → CoD
    have('pop_pod_alder_fuirstel') ? green("✓ Adler preflag.") : grey("✗ Adler preflag missing.");
    have('pop_pod_grimmus_planar_projection') ? green("✓ Grummus defeated.") : grey("✗ Grummus missing.");
    have('pop_pod_elder_fuirstel') ? green("✓ Elder Fuirstel postflag.") : grey("✗ Elder Fuirstel postflag missing.");

    # Plane of Justice → Valor/Storms
    have('pop_poj_mavuin')       ? green("✓ Mavuin spoken.") : grey("✗ Mavuin missing.");
    have('pop_poj_tribunal')     ? green("✓ Tribunal mark shown.") : grey("✗ Tribunal mark not shown.");
    have('pop_poj_valor_storms') ? green("✓ Returned to Mavuin.") : grey("✗ Did not return to Mavuin.");
    have('pop_pov_aerin_dar')    ? green("✓ Aerin`Dar defeated.") : grey("✗ Aerin`Dar missing.");
    if (defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 3) { green("✓ Askr step 1 (Storms)."); }
    else { grey("✗ Askr step 1 missing (Storms)."); }
    have('pop_pos_askr_the_lost_final') ? green("✓ Giants slain; Askr complete.") : grey("✗ Askr giants not recorded.");

    # CoD (Bertox)
    have('pop_cod_preflag') ? green("✓ Carprin cycle complete.") : grey("✗ Carprin cycle missing.");
    have('pop_cod_bertox')  ? green("✓ Bertoxxulous defeated.") : grey("✗ Bertoxxulous missing.");
    have('pop_cod_final')   ? green("✓ Spoke with Adler after Bertox.") : grey("✗ Post-Bertox Adler missing.");

    # Plane of Torment
    have('pop_pot_shadyglade')   ? green("✓ Shadyglade spoken.") : grey("✗ Shadyglade missing.");
    have('pop_pot_newleaf')      ? green("✓ Keeper of Sorrows defeated.") : grey("✗ Keeper missing.");
    have('pop_pot_saryrn')       ? green("✓ Saryrn defeated.") : grey("✗ Saryrn missing.");
    have('pop_pot_saryrn_final') ? green("✓ Shadyglade after Saryrn.") : grey("✗ Post-Saryrn Shadyglade missing.");

    # Halls of Honor / Marr
    have('pop_hoh_faye')  ? green("✓ HoH Trial: Faye.")  : grey("✗ HoH Faye missing.");
    have('pop_hoh_trell') ? green("✓ HoH Trial: Trell.") : grey("✗ HoH Trell missing.");
    have('pop_hoh_garn')  ? green("✓ HoH Trial: Garn.")  : grey("✗ HoH Garn missing.");
    have('pop_hohb_marr') ? green("✓ Lord Mithaniel Marr defeated.") : grey("✗ LMM missing.");

    # Tactics
    have('pop_tactics_tallon') ? green("✓ Tallon.") : grey("✗ Tallon missing.");
    have('pop_tactics_vallon') ? green("✓ Vallon.") : grey("✗ Vallon missing.");
    have('pop_tactics_ralloz') ? green("✓ Rallos Zek the Warlord.") : grey("✗ RZtW missing.");

    # Sol Ro / Fire
    have('pop_sol_ro_arlyxir')  ? green("✓ Arlyxir.") : grey("✗ Arlyxir missing.");
    have('pop_sol_ro_dresolik') ? green("✓ Protector of Dresolik.") : grey("✗ Dresolik missing.");
    have('pop_sol_ro_jiva')     ? green("✓ Jiva.") : grey("✗ Jiva missing.");
    have('pop_sol_ro_xuzl')     ? green("✓ Xuzl.") : grey("✗ Xuzl missing.");
    have('pop_sol_ro_rizlona')  ? green("✓ Rizlona.") : grey("✗ Rizlona missing.");
    have('pop_sol_ro_solusk')   ? green("✓ Solusek Ro.") : grey("✗ Solusek Ro missing.");

    # Elementals / Time
    have('pop_fire_fennin_projection')    ? green("✓ Fennin Ro (Fire).") : grey("✗ Fennin missing.");
    have('pop_wind_xegony_projection')    ? green("✓ Xegony (Air).") : grey("✗ Xegony missing.");
    have('pop_water_coirnav_projection')  ? green("✓ Coirnav (Water).") : grey("✗ Coirnav missing.");
    have('pop_eartha_arbitor_projection') ? green("✓ Arbitor of Earth (A).") : grey("✗ Arbitor missing.");
    have('pop_earthb_rathe')              ? green("✓ Rathe Council (B).") : grey("✗ Rathe missing.");
    have('pop_elemental_grand_librarian') ? green("✓ Grand Librarian (Elemental access).") : grey("✗ Grand Librarian missing.");
    have('pop_time_maelin')               ? green("✓ Plane of Time access complete.") : grey("✗ Time access incomplete.");

    if (!$PONB_ID) { grey("Debug: Could not resolve zone id for $PONB_SHORT."); }
    else {
        my $has = $client->HasZoneFlag($PONB_ID) ? "yes" : "no";
        gold("Debug: $PONB_SHORT id=$PONB_ID; HasZoneFlag=$has.");
    }
    gold("If you killed Terris before projections existed and your Construct is missing, say [fix missed PoN].");
}

sub fix_missed_pon {
    if (have('pop_ponb_terris') && have('pop_pon_hedge_jezith') && !have('pop_pon_construct')) {
        quest::setglobal('pop_pon_construct', 1, 5, 'F');
        green("Reconciled: Construct of Nightmares marked complete.");
        show_flags();
    } else {
        grey("No PoN reconciliation needed (Construct already set, or Terris/Jezith not recorded).");
    }
}
