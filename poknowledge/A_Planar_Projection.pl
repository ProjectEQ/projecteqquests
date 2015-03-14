sub EVENT_SAY {



if($text=~/Hail/i) {



   $client->Message(1,"I am not who you seek.");

   

   }



#GRANT ACCESS TO LAIR OF TERRIS THULE



if($text=~/Darkness Beckons/i &&  defined $qglobals{pop_pon_construct} &&  defined $qglobals{pop_pon_hedge_jezith}) {



   $client->Message(1,"Very well mortal... you shall pass into the Lair of Terris Thule");

   $client->Message(2,"You now have access to the Lair of Terris Thule!");

   quest::set_zone_flag(221);



   }



if($text=~/the war drums echo/i &&  defined $qglobals{pop_poi_behometh_preflag} &&  defined $qglobals{pop_poi_behometh_flag}) {



   $client->Message(1,"Very well mortal... you shall pass into Drunder, Fortress of Zek");

   $client->Message(2,"You now have access to Drunder, Fortress of Zek!");

   quest::set_zone_flag(214);



   }



if($text=~/I will destroy the plaguebringer/i &&  defined $qglobals{pop_pod_alder_fuirstel} &&  defined $qglobals{pop_pod_grimmus_planar_projection} &&  defined $qglobals{pop_pod_elder_fuirstel}) {



   $client->Message(1,"Very well mortal... you shall pass into the Ruins of Lxanvom.");

   $client->Message(2,"You now have access to the Ruins of Lxanvom.");

   quest::set_zone_flag(200);



   }



if($text=~/I am familiar with Order/i &&  defined $qglobals{pop_poj_mavuin} &&  defined $qglobals{pop_poj_tribunal} &&  defined $qglobals{pop_poj_valor_storms}) {



   $client->Message(1,"Very well mortal... you shall pass into the Plane of Valor and the Plane of Storms.");

   $client->Message(2,"You now have access to the Plane of Valor and the Plane of Storms!");

   quest::set_zone_flag(208);

   quest::set_zone_flag(210);



   }



if($text=~/My Valor is Unmatched/i &&  defined $qglobals{pop_poj_mavuin} &&  defined $qglobals{pop_poj_tribunal} &&  defined $qglobals{pop_poj_valor_storms} &&  defined $qglobals{pop_pov_aerin_dar}) {



   $client->Message(1,"Very well mortal, you have earned access to the Halls of Honor");

   $client->Message(2,"You now have access to the Halls of Honor!");

   quest::set_zone_flag(211);



   }



if($text=~/I will defeat the Storm Lord/i &&  defined $qglobals{pop_poj_mavuin} &&  defined $qglobals{pop_poj_tribunal} &&  defined $qglobals{pop_poj_valor_storms} &&  defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 3 &&  defined $qglobals{pop_pos_askr_the_lost_final}) {



   $client->Message(1,"Very well mortal, you have earned access to the Bastion of Thunder");

   $client->Message(2,"You now have access to the Bastion of Thunder!");

   quest::set_zone_flag(209);



   }



if($text=~/I am ready to face Lord Mithaniel Marr/i &&  defined $qglobals{pop_poj_mavuin} &&  defined $qglobals{pop_poj_tribunal} &&  defined $qglobals{pop_poj_valor_storms} &&  defined $qglobals{pop_pov_aerin_dar} &&  defined $qglobals{pop_hoh_faye} &&  defined $qglobals{pop_hoh_trell} &&  defined $qglobals{pop_hoh_garn}) {



   $client->Message(1,"You have impressed me Mortal.  Lord Mithaniel Marr shall not be underestimated.");

   $client->Message(2,"You have earned access to the Temple of Marr!");

   quest::set_zone_flag(220);



   }



if($text=~/I will defeat Saryrn/i  &&  defined $qglobals{pop_pod_alder_fuirstel} &&  defined $qglobals{pop_pod_grimmus_planar_projection} &&  defined $qglobals{pop_pod_elder_fuirstel} &&  defined $qglobals{pop_pon_construct} &&  defined $qglobals{pop_pon_hedge_jezith} &&  defined $qglobals{pop_ponb_terris} &&  defined $qglobals{pop_ponb_poxbourne} &&  defined $qglobals{pop_cod_preflag} &&  defined $qglobals{pop_cod_bertox} &&  defined $qglobals{pop_cod_final}) {



   $client->Message(1,"Your progress impresses me mortal.  The Plane of Torment is yours to roam through.");

   $client->Message(2,"You have earned access to the Plane of Torment!");

   quest::set_zone_flag(207);



   }



if($text=~/No gladiator shall match me/i &&  defined $qglobals{pop_poi_behometh_preflag} &&  defined $qglobals{pop_poi_behometh_flag} &&  defined $qglobals{pop_tactics_tallon} &&  defined $qglobals{pop_tactics_vallon} &&  defined $qglobals{pop_pot_saryrn_final} &&  defined $qglobals{pop_pot_saryrn} &&  defined $qglobals{pop_hohb_marr}) {



   $client->Message(1,"You have impressed me Mortal.  However, Machines and War do not compare to what you face next.  The tower of Solusk Ro is no place for someone who is less than worthy.");

   $client->Message(2,"You have earned access to the Tower of Solusek Ro!");

   quest::set_zone_flag(212);



   }



if($text=~/I am a child of fire/i &&  defined $qglobals{pop_poi_behometh_preflag} &&  defined $qglobals{pop_poi_behometh_flag} &&  defined $qglobals{pop_tactics_tallon} &&  defined $qglobals{pop_tactics_vallon} &&  defined $qglobals{pop_tactics_ralloz} &&  defined $qglobals{pop_sol_ro_arlyxir} &&  defined $qglobals{pop_sol_ro_jiva} &&  defined $qglobals{pop_sol_ro_rizlona} &&  defined $qglobals{pop_sol_ro_dresolik} &&  defined $qglobals{pop_sol_ro_xuzl} &&  defined $qglobals{pop_sol_ro_solusk} &&  defined $qglobals{pop_pot_saryrn_final} &&  defined $qglobals{pop_pot_saryrn} &&  defined $qglobals{pop_hohb_marr}) {



   $client->Message(1,"Fire! You think you know fire? Lets see how you fair when you are consumed by it! You may enter Doomfire, the Burning Lands, if you think you're ready.");

   $client->Message(2,"You have earned access to the Plane of Fire!");

   quest::set_zone_flag(217);



   }



if($text=~/I am worthy of the elemental planes/i &&  defined $qglobals{pop_hohb_marr} &&  defined $qglobals{pop_bot_agnarr} &&  defined $qglobals{pop_pon_hedge_jezith} &&  defined $qglobals{pop_pon_construct} &&  defined $qglobals{pop_ponb_terris} &&  defined $qglobals{pop_ponb_poxbourne} &&  defined $qglobals{pop_pod_alder_fuirstel} &&  defined $qglobals{pop_pod_grimmus_planar_projection} &&  defined $qglobals{pop_pod_elder_fuirstel} &&  defined $qglobals{pop_poj_mavuin} &&  defined $qglobals{pop_poj_tribunal} &&  defined $qglobals{pop_poj_valor_storms} &&  defined $qglobals{pop_pov_aerin_dar} &&  defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 3 &&  defined $qglobals{pop_pos_askr_the_lost_final} &&  defined $qglobals{pop_cod_preflag} &&  defined $qglobals{pop_cod_bertox} &&  defined $qglobals{pop_cod_final} &&  defined $qglobals{pop_pot_shadyglade} &&  defined $qglobals{pop_pot_saryrn} &&  defined $qglobals{pop_pot_saryrn_final} &&  defined $qglobals{pop_hoh_faye} &&  defined $qglobals{pop_hoh_trell} &&  defined $qglobals{pop_hoh_garn} &&  defined $qglobals{pop_elemental_grand_librarian}) {



   $client->Message(1,"Then you shall be tested!");

   $client->Message(2,"You have earned access to the Reef of Corniav, Vegarlson, the Earthen Badlands, and Eryslai, the Kingdom of Wind!");

   quest::set_zone_flag(216);

   quest::set_zone_flag(215);

   quest::set_zone_flag(218);



   }

{

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

}

}



## ELEMENTAL PLANE CHECK INCLUDING FIRE  $qglobals{pop_hohb_marr} &&  $qglobals{pop_bot_agnarr} &&  $qglobals{pop_pon_hedge_jezith} &&  $qglobals{pop_pon_construct} &&  $qglobals{pop_ponb_terris} &&  $qglobals{pop_ponb_poxbourne} &&  $qglobals{pop_poi_dragon} &&  $qglobals{pop_poi_behometh_preflag} &&  $qglobals{pop_poi_behometh_flag} &&  $qglobals{pop_pod_alder_fuirstel} &&  $qglobals{pop_pod_grimmus_planar_projection} &&  $qglobals{pop_pod_elder_fuirstel} &&  $qglobals{pop_poj_mavuin} &&  $qglobals{pop_poj_tribunal} &&  $qglobals{pop_poj_valor_storms} &&  $qglobals{pop_pov_aerin_dar} &&  $qglobals{pop_pos_askr_the_lost == 3 &&  $qglobals{pop_pos_askr_the_lost_final} &&  $qglobals{pop_cod_preflag} &&  $qglobals{pop_cod_bertox} &&  $qglobals{pop_cod_final} &&  $qglobals{pop_pot_shadyglade} &&  $qglobals{pop_pot_shadyglade} &&  $qglobals{pop_pot_saryrn} &&  $qglobals{pop_pot_saryrn_final} &&  $qglobals{pop_hoh_faye} &&  $qglobals{pop_hoh_trell} &&  $qglobals{pop_hoh_garn} &&  $qglobals{pop_tactics_tallon} &&  $qglobals{pop_tactics_vallon} &&  $qglobals{pop_tactics_ralloz} &&  $qglobals{pop_sol_ro_arlyxir} &&  $qglobals{pop_sol_ro_jiva} &&  $qglobals{pop_sol_ro_rizlona} &&  $qglobals{pop_sol_ro_dresolik} &&  $qglobals{pop_sol_ro_xuzl} &&  $qglobals{pop_sol_ro_solusk} 