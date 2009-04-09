sub EVENT_SAY {
	if ($pop_cod_bertox == 1 && $pop_ponb_terris == 1) {
		if ($pop_pot_saryrn == 1 && $pop_pot_newleaf == 1 && $pop_pot_shadyglade == 1) {

			if ($text=~/Hail/i) {
				quest::say("Oh thank you for helping Tylis! We will be forever in your debt");
				quest::setglobal("pop_pot_saryrn_final",1,5,"F");
				$client->Message(4,"You receive a character flag!");
			}

		} else {

			if ($text=~/Hail/i) {
				quest::say("Greetings travelers. Please excuse me but I must attend to Tylis for his condition does not improve.'");
			}
		
			if ($text=~/condition/i) {
				quest::say("It all goes back to when I found him. I had just purchased a new fishing pole in the hopes of finding some time to relax on the shores of the island. As I was walking out of the shop, I heard a distant moan. I walked toward the source and found Tylis lying by the reflecting pool. The pool was different, though. It now had a small [black cube] floating over it. I tried to wake Tylis but was not successful. I then brought him here and have been caring for him since.'");
			}
		
			if ($text=~/black cube/i) {
				quest::say("I do not like that cube at all. Just thinking of it brings pain to my mind. Gazing upon it gives the sensation of being slowly rent apart at each limb. I believe that whatever has fallen over Tylis is related to this cursed cube. Other elders claim that it is a portal that will lead into the [Plane of Torment].'");
			}
	
			if ($text=~/Plane of Torment/i) {
				quest::say("It is not a plane that was originally sought to be reached by our elders. It is their belief though that Saryrn, the Mistress of Torment, intends to breed her suffering even into this protected plane of Quellious. I wish I had the strength to go into the Plane of Torment and find out exactly the nature of the current circumstances to have afflicted Tylis, but I cannot leave his side in good conscience.'");
			}

			if ($text=~/I will go/i) {
				quest::say("Wonderful. I did not think that an outsider was one that I could trust to aid me in this. One name that Tylis has mentioned in agony is that of Maareq. I do not know whom this is, but he must be instrumental in Tylis' suffering. You must find Maareq and do what you must to release Tylis from this torture.'");
				quest::setglobal("pop_pot_shadyglade",1,5,"F");
				$client->Message(4,"You receive a character flag!");
			}
		}

	} else {
		quest::say("I can see that you may be passionate to help others but now I must ask you to be about your own business. I sense that if you were to try to help you may befall the same fate as poor Tyllis. Perhaps you should become more experienced in travelling through the planes before you learn more about his condition.");
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
$pop_pot_saryrn_final=undef;
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

# End of File 
# Written by Romai, so you have someone to blame