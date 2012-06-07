$level_for_tier_two = 55;
$level_for_tier_three = 62;
$level_for_tier_three_five = 255;
$level_for_elemental = 255;

sub EVENT_CLICKDOOR {
  #valor/storms
  if($doorid == 16 || $doorid == 21) {
    if($client->GetLevel() >= $level_for_tier_two || (defined $qglobals{pop_poj_mavuin} &&  defined $qglobals{pop_poj_tribunal} &&  defined $qglobals{pop_poj_valor_storms})) {
      if(quest::has_zone_flag(210) != 1 || quest::has_zone_flag(208) != 1) {
        quest::set_zone_flag(210);
        quest::set_zone_flag(208);
      }
    }
  }
  
  #codecay
  if($doorid == 12) {
    if($client->GetLevel() >= $level_for_tier_two || (defined $qglobals{pop_pod_alder_fuirstel} && defined $qglobals{pop_pod_grimmus_planar_projection} && defined $qglobals{pop_pod_elder_fuirstel}) || (defined $qglobals{pop_alt_access_codecay})) {
      if(quest::has_zone_flag(200) != 1) {
        quest::set_zone_flag(200);
      }
    }
  }
  
  #torment
  if($doorid == 93) {
    if($client->GetLevel() >= $level_for_tier_two || (defined $qglobals{pop_pod_alder_fuirstel} && defined $qglobals{pop_pod_grimmus_planar_projection} && defined $qglobals{pop_pod_elder_fuirstel} && defined $qglobals{pop_pon_construct} && defined $qglobals{pop_pon_hedge_jezith} && defined $qglobals{pop_ponb_terris} && defined $qglobals{pop_ponb_poxbourne} &&  defined $qglobals{pop_cod_preflag} && defined $qglobals{pop_cod_bertox} && defined $qglobals{pop_cod_final}) || (defined $qglobals{pop_alt_access_potorment})) {
      if(quest::has_zone_flag(207) != 1) {
        quest::set_zone_flag(207);
      }
    }
  }
  
  #bothunder
  if($doorid == 48) {
    if($client->GetLevel() >= $level_for_tier_three || (defined $qglobals{pop_poj_mavuin} && defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms} && (defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 3) && defined $qglobals{pop_pos_askr_the_lost_final})) {
      if(quest::has_zone_flag(209) != 1) {
        quest::set_zone_flag(209);
      }
    }
  }

  #hohonora
  if($doorid == 23) {
    if($client->GetLevel() >= $level_for_tier_three || (defined $qglobals{pop_poj_mavuin} && defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms} && defined $qglobals{pop_pov_aerin_dar}) || (defined $qglobals{pop_alt_access_hohonora})) {
      if(quest::has_zone_flag(211) != 1) {
        quest::set_zone_flag(211);
      }
    }
  }

  #potactics
  if($doorid == 24) {
    if($client->GetLevel() >= $level_for_tier_three_five || (defined $qglobals{pop_poi_behometh_preflag} && defined $qglobals{pop_poi_behometh_flag}) || (defined $qglobals{pop_alt_access_potactics})) {
      if(quest::has_zone_flag(214) != 1) {
        quest::set_zone_flag(214);
      }
    }
  }  
  
  #solrotower
  if($doorid == 22) {
    if($client->GetLevel() >= $level_for_tier_three_five || (defined $qglobals{pop_poi_behometh_preflag} && defined $qglobals{pop_poi_behometh_flag} && defined $qglobals{pop_tactics_tallon} && defined $qglobals{pop_tactics_vallon} && defined $qglobals{pop_pot_saryrn_final} && defined $qglobals{pop_pot_saryrn} && defined $qglobals{pop_hohb_marr}) || (defined $qglobals{pop_alt_access_solrotower})) {
      if(quest::has_zone_flag(212) != 1) {
        quest::set_zone_flag(212);
      }
    }
  }
  
  #pofire
  if($doorid == 82) {
    if($client->GetLevel() >= $level_for_elemental || (defined $qglobals{pop_poi_behometh_preflag} && defined $qglobals{pop_poi_behometh_flag} && defined $qglobals{pop_tactics_tallon} && defined $qglobals{pop_tactics_vallon} && defined $qglobals{pop_tactics_ralloz} && defined $qglobals{pop_sol_ro_arlyxir} && defined $qglobals{pop_sol_ro_jiva} && defined $qglobals{pop_sol_ro_rizlona} &&  defined $qglobals{pop_sol_ro_dresolik} && defined $qglobals{pop_sol_ro_xuzl} && defined $qglobals{pop_sol_ro_solusk} && defined $qglobals{pop_hohb_marr})) {
      if(quest::has_zone_flag(217) != 1) {
        quest::set_zone_flag(217);
      }
    }
  }

  #powater/poearth/poair
  if($doorid == 81 || $doorid == 83 || $doorid == 84) {
    if($client->GetLevel() >= $level_for_elemental || (defined $qglobals{pop_hohb_marr} && defined $qglobals{pop_bot_agnarr} && defined $qglobals{pop_pon_hedge_jezith} && defined $qglobals{pop_pon_construct} && defined $qglobals{pop_ponb_terris} && defined $qglobals{pop_ponb_poxbourne} && defined $qglobals{pop_pod_alder_fuirstel} && defined $qglobals{pop_pod_grimmus_planar_projection} && defined $qglobals{pop_pod_elder_fuirstel} && defined $qglobals{pop_poj_mavuin} &&  defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms} && defined $qglobals{pop_pov_aerin_dar} && defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 3 && defined $qglobals{pop_pos_askr_the_lost_final} && defined $qglobals{pop_cod_preflag} && defined $qglobals{pop_cod_bertox} && defined $qglobals{pop_cod_final} &&  defined $qglobals{pop_pot_shadyglade} && defined $qglobals{pop_pot_saryrn} && defined $qglobals{pop_pot_saryrn_final} && defined $qglobals{pop_hoh_faye} && defined $qglobals{pop_hoh_trell} && defined $qglobals{pop_hoh_garn} && defined $qglobals{pop_elemental_grand_librarian})) {
      if(quest::has_zone_flag(216) != 1 || quest::has_zone_flag(215) != 1 || quest::has_zone_flag(218) != 1) {
        quest::set_zone_flag(216);
        quest::set_zone_flag(215);
        quest::set_zone_flag(218);
      }
    }
  }
  
  $qglobals{pop_pon_hedge_jezith}=undef;
  $qglobals{pop_pon_construct}=undef;
  $qglobals{pop_ponb_terris}=undef;
  $qglobals{pop_ponb_poxbourne}=undef;
  $qglobals{pop_poi_dragon}=undef;
  $qglobals{pop_poi_behometh_preflag}=undef;
  $qglobals{pop_poi_behometh_flag}=undef;
  $qglobals{pop_pod_alder_fuirstel}=undef;
  $qglobals{pop_pod_grimmus_planar_projection}=undef;
  $qglobals{pop_pod_elder_fuirstel}=undef;
  $qglobals{pop_poj_mavuin}=undef;
  $qglobals{pop_poj_tribunal}=undef;
  $qglobals{pop_poj_valor_storms}=undef;
  $qglobals{pop_poj_execution}=undef;
  $qglobals{pop_poj_flame}=undef;
  $qglobals{pop_poj_hanging}=undef;
  $qglobals{pop_poj_lashing}=undef;
  $qglobals{pop_poj_stoning}=undef;
  $qglobals{pop_poj_torture}=undef;
  $qglobals{pop_pov_aerin_dar}=undef;
  $qglobals{pop_pos_askr_the_lost}=undef;
  $qglobals{pop_pos_askr_the_lost_final}=undef;
  $qglobals{pop_cod_preflag}=undef;
  $qglobals{pop_cod_bertox}=undef;
  $qglobals{pop_cod_final}=undef;
  $qglobals{pop_pot_shadyglade}=undef;
  $qglobals{pop_pot_newleaf}=undef;
  $qglobals{pop_pot_saryrn}=undef;
  $qglobals{pop_pot_saryrn_final}=undef;
  $qglobals{pop_hoh_faye}=undef;
  $qglobals{pop_hoh_trell}=undef;
  $qglobals{pop_hoh_garn}=undef;
  $qglobals{pop_hohb_marr}=undef;
  $qglobals{pop_bot_agnarr}=undef;
  $qglobals{pop_bot_karana}=undef;
  $qglobals{pop_tactics_tallon}=undef;
  $qglobals{pop_tactics_vallon}=undef;
  $qglobals{pop_tactics_ralloz}=undef;
  $qglobals{pop_elemental_grand_librarian}=undef;
  $qglobals{pop_sol_ro_arlyxir}=undef;
  $qglobals{pop_sol_ro_dresolik}=undef;
  $qglobals{pop_sol_ro_jiva}=undef;
  $qglobals{pop_sol_ro_rizlona}=undef;
  $qglobals{pop_sol_ro_xuzl}=undef;
  $qglobals{pop_sol_ro_solusk}=undef;
  $qglobals{pop_fire_fennin_projection}=undef;
  $qglobals{pop_wind_xegony_projection}=undef;
  $qglobals{pop_water_coirnav_projection}=undef;
  $qglobals{pop_eartha_arbitor_projection}=undef;
  $qglobals{pop_earthb_rathe}=undef;
  $qglobals{pop_time_maelin}=undef;
  $qglobals{pop_alt_access_codecay}=undef;
  $qglobals{pop_alt_access_potorment}=undef;
  $qglobals{pop_alt_access_potactics}=undef;
  $qglobals{pop_alt_access_solrotower}=undef;
}