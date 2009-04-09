sub EVENT_SPAWN {
	$sphere = undef;
}

sub EVENT_SIGNAL {
	{ quest::depop; }
}

sub EVENT_SAY {
	
	if ($pop_pot_shadyglade == 1) {

		if ($text=~/Hail/i && $sphere == undef) {
			quest::emote("Tylis Newleaf doesn't move, but struggles to whisper, '...help ...end this torment ...will you come? I can show you the pain... it moves in the shadows of my mind... will you assist me?'");
		}
	
	        if ($text=~/will assist you/i) {
        	        quest::say("I..I don't want anyone else to suffer my fate... If you are certain you can help, show me your Screaming Sphere as proof of your strength.");
	        }

		if ($text=~/ready/i && $sphere == 1) {
			quest::movepc(207,-175,815,-955);
		}
	}
{
$pop_pon_hedge_jezith=undef;
$pop_pon_construct=undef;
$pop_ponb_terris=undef;
$pop_ponb_poxbourne=undef;
$pop_poi_dragon=undef;
$pop_poi_behometh_preflag=undef;
$pop_poi_behometh_flag=undef;
$pop_pod_alder_fuirstel=undef;
$pop_pod_grimmus_planar_projection=undef;
$pop_pod_elder_fuirstel=undef;
$pop_poj_mavuin=undef;
$pop_poj_tribunal=undef;
$pop_poj_valor_storms=undef;
$pop_poj_execution=undef;
$pop_poj_flame=undef;
$pop_poj_hanging=undef;
$pop_poj_lashing=undef;
$pop_poj_stoning=undef;
$pop_poj_torture=undef;
$pop_pov_aerin_dar=undef;
$pop_pos_askr_the_lost=undef;
$pop_pos_askr_the_lost_final=undef;
$pop_cod_preflag =undef;
$pop_cod_bertox=undef;
$pop_cod_final=undef;
$pop_pot_shadyglade=undef;
$pop_pot_newleaf=undef;
$pop_pot_saryrn=undef;
$pop_pot_saryn_final=undef;
$pop_hoh_faye=undef;
$pop_hoh_trell=undef;
$pop_hoh_garn=undef;
$pop_hohb_marr=undef;
$pop_bot_agnarr=undef;
$pop_bot_karana=undef;
$pop_tactics_tallon =undef;
$pop_tactics_vallon=undef;
$pop_tactics_ralloz=undef;
$pop_elemental_grand_librarian=undef;
$pop_sol_ro_arlyxir=undef;
$pop_sol_ro_dresolik=undef;
$pop_sol_ro_jiva=undef;
$pop_sol_ro_rizlona=undef;
$pop_sol_ro_xuzl=undef;
$pop_sol_ro_solusk=undef;
$pop_fire_fennin_projection=undef;
$pop_wind_xegony_projection=undef;
$pop_water_coirnav_projection=undef;
$pop_eartha_arbitor_projection=undef;
$pop_earthb_rathe=undef;
$pop_time_maelin=undef;
}
}

sub EVENT_ITEM {

	if ($pop_pot_shadyglade == 1 && plugin::check_handin(\%itemcount, 22954 => 1)) {
		quest::summonitem(22954);
		quest::say("Please tell me when you are ready. I do not know if I have enough energy to channel all of you, but I can try. When you are ready, I will channel you into my pain.");
		quest::settimer(1,300);
		$sphere = 1;
	} else {
		plugin::return_items(\%itemcount);
  	}  
{
$pop_pon_hedge_jezith=undef;
$pop_pon_construct=undef;
$pop_ponb_terris=undef;
$pop_ponb_poxbourne=undef;
$pop_poi_dragon=undef;
$pop_poi_behometh_preflag=undef;
$pop_poi_behometh_flag=undef;
$pop_pod_alder_fuirstel=undef;
$pop_pod_grimmus_planar_projection=undef;
$pop_pod_elder_fuirstel=undef;
$pop_poj_mavuin=undef;
$pop_poj_tribunal=undef;
$pop_poj_valor_storms=undef;
$pop_poj_execution=undef;
$pop_poj_flame=undef;
$pop_poj_hanging=undef;
$pop_poj_lashing=undef;
$pop_poj_stoning=undef;
$pop_poj_torture=undef;
$pop_pov_aerin_dar=undef;
$pop_pos_askr_the_lost=undef;
$pop_pos_askr_the_lost_final=undef;
$pop_cod_preflag =undef;
$pop_cod_bertox=undef;
$pop_cod_final=undef;
$pop_pot_shadyglade=undef;
$pop_pot_newleaf=undef;
$pop_pot_saryrn=undef;
$pop_pot_saryn_final=undef;
$pop_hoh_faye=undef;
$pop_hoh_trell=undef;
$pop_hoh_garn=undef;
$pop_hohb_marr=undef;
$pop_bot_agnarr=undef;
$pop_bot_karana=undef;
$pop_tactics_tallon =undef;
$pop_tactics_vallon=undef;
$pop_tactics_ralloz=undef;
$pop_elemental_grand_librarian=undef;
$pop_sol_ro_arlyxir=undef;
$pop_sol_ro_dresolik=undef;
$pop_sol_ro_jiva=undef;
$pop_sol_ro_rizlona=undef;
$pop_sol_ro_xuzl=undef;
$pop_sol_ro_solusk=undef;
$pop_fire_fennin_projection=undef;
$pop_wind_xegony_projection=undef;
$pop_water_coirnav_projection=undef;
$pop_eartha_arbitor_projection=undef;
$pop_earthb_rathe=undef;
$pop_time_maelin=undef;
}
}


sub EVENT_TIMER {
	if ($timer == 1) {
		quest::stoptimer(1);
		$sphere = undef;
	}
}

# End of File  Zone: PoTorment  ID: 207014 -- Tylis_Newleaf
# Written by Romai, so you have someone to blame if I botch it