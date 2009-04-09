sub EVENT_SPAWN {
	quest::settimer(1,10);
}

sub EVENT_TIMER {
	if ($timer == 1) {
		$npc->SetAppearance(3);
		quest::stoptimer(1);
	}
}

sub EVENT_SAY {

	if($text=~/hail/i && defined $qglobals{pop_ponb_terris} && !defined $qglobals{pop_ponb_poxbourne}) {
		quest::say("Finally, after all this time, my mind is at peace... thank you, $name, Subduer of Torment.");
		quest::setglobal("pop_ponb_poxbourne", 1, 5, "F");
		$client->Message("You receive a character flag!");
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
$qglobals{pop_cod_preflag }=undef;
$qglobals{pop_cod_bertox}=undef;
$qglobals{pop_cod_final}=undef;
$qglobals{pop_pot_shadyglade}=undef;
$qglobals{pop_pot_newleaf}=undef;
$qglobals{pop_pot_saryrn}=undef;
$qglobals{pop_pot_saryn_final}=undef;
$qglobals{pop_hoh_faye}=undef;
$qglobals{pop_hoh_trell}=undef;
$qglobals{pop_hoh_garn}=undef;
$qglobals{pop_hohb_marr}=undef;
$qglobals{pop_bot_agnarr}=undef;
$qglobals{pop_bot_karana}=undef;
$qglobals{pop_tactics_tallon }=undef;
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