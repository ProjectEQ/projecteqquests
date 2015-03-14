sub EVENT_SAY {
	if(quest::istaskactive(220)){
       	if ($text=~/trick or treat/i) {
                        quest::say("Ah, here you go. Fresh from the Sugar Assembalage 2000.");
                        quest::summonitem(quest::ChooseRandom(84091,84092,84093,84087,84087,84087,84087,84087,84087));
			   quest::updatetaskactivity(220,1);	
                }
	}
	if ($pop_hohb_marr == 1 && $pop_bot_agnarr == 1 && $pop_pon_hedge_jezith == 1 && $pop_pon_construct == 1 && $pop_ponb_terris == 1 && $pop_ponb_poxbourne == 1 && $pop_pod_alder_fuirstel == 1 && $pop_pod_grimmus_planar_projection == 1 && $pop_pod_elder_fuirstel == 1 && $pop_poj_mavuin == 1 && $pop_poj_tribunal == 1 && $pop_poj_valor_storms == 1 && $pop_pov_aerin_dar == 1 && $pop_pos_askr_the_lost  == 3 && $pop_pos_askr_the_lost_final == 1 && $pop_cod_preflag == 1 && $pop_cod_bertox == 1 && $pop_cod_final == 1 && $pop_pot_shadyglade == 1 && $pop_pot_saryrn == 1 && $pop_pot_saryrn_final == 1 && $pop_hoh_faye == 1 && $pop_hoh_trell == 1 && $pop_hoh_garn == 1 && defined $qglobals{pop_tactics_ralloz}) {	# Elemental Pre-Flagging
		if ($text=~/Hail/i) {
			quest::say("'Welcome back my friends. I assure you that I have been studying the Cipher of Druzzil very diligently. Did you happen to find any [" . quest::saylink("lore") . "] or [" . quest::saylink("information") . "] that I could look at?'");
		}
		if ($text=~/lore/i) {
			quest::say("'A parchment of Rallos'? Let me read it, it says that Rallos was not alone in his feelings about mortals. Solusek Ro also holds stake in the war to be led on Norrath. Not only this but he is channeling power from his father's plane into his own. He is taking that power and intensifying it through an artifact of great power, and then focusing it onto one point. It is a detailed as a crystal that burns with all the powers of the plane of fire. It is said to have the ability to turn the face of Norrath into a charred wasteland. They plan for a manaetic behemoth to carry and deposit it upon Norrath. You must stop these plans, you must stop Solusek!'");
		}

		if ($text=~/information/i) {
			quest::say("'There is no way to escape from the prison that is The Plane of Time. I am sorry but your quest for information ends here. Time is something that none of us can escape. That is however.. back when my explorations of the Planes were more common, I would travel searching for knowledge and lore to bring back to Tanaan. I stumbled into the Plane of Innovation. It was a great marvel to see indeed. I found the creator of all things mechanical. Meldrath the Marvelous was a kind and just gnome. We spent many weeks together discussing all of his devices. This included a machine that would allow you to open a tear into a period of time and enter into that time. The machine was more of a flight of whimsy though as the power necessary to power such a machine was enormous. He jokingly equated needing the very essence of the elements to power it.'");
			quest::emote("Maelin takes a deep breath and continues, 'I can see now that he was not joking at all. Let us suppose that you travelers could venture into the Elemental Planes and retrieve this essence; and form it into one powerful conglomeration. You could open a tear into the period of time before Zebuxoruk was imprisoned. There is no way you can free him from his stasis now, but if you were to halt the Pantheon at the time of imprisonment. Hah! It could work I do believe. Forgive me, but my old gnomish heart is alive with the excitement of possibilities. Gather up your strength friends, travel into the deep elements. You will need all of your wits about you. Find the very essence of the elementals, and fuse them into one. How to combine them I do not know, and can only wish you luck on finding that information. If you can accomplish this please come get me. I would like to record the events as they take place!'");
			quest::setglobal("pop_elemental_grand_librarian",1,5,"F");
			$client->Message(4,"You receive a character flag!");
		}
	}
	if (plugin::check_hasitem($client, 29165)){
		if ($text=~/Hail/i) {
			quest::say("The Quintessence! Oh my this is amazing! I have come into contact with Chronographer Muon in the realm of innovation. Go to him, show him you have the power to activate machine. I shall meet you there, this I must see!");
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