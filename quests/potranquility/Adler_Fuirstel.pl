sub EVENT_SAY {

if($text=~/Hail/i && $pop_pod_alder_fuirstel == undef)
	{
	quest::say("Can you smell it? It is the musk of death and pestilence. It is a smell that I have welcomed for so long, but now it turns my stomach. My brother Milyk and I have come here from Qeynos. We were members of the Bloodsabers but sought higher enlightenment. Upon arriving here Milyk began to channel all of his energy into opening the [" . quest::saylink("portal to the Plane of Disease") . "].");
	}

if($text=~/portal to the plane of disease/i && $pop_pod_alder_fuirstel == undef )
	{
	quest::say("We sought only the wisdom of Bertoxxulous. When Milyk finished his chant and the portal opened, it began to spew out this vile pestilence you see before you. Milyk caught the brunt of the plague, and his condition worsens. I have been infected as well, and am weak but I will go into the plane to save my brother if I must. The weavers have seen in their tapestries that one holds a [" . quest::saylink("ward") . "] that will halt the effects of the toxins that the touch of Bertoxxulous brings.");
	}

if($text=~/ward/i && $pop_pod_alder_fuirstel == undef)
	{
	quest::say("The ward is carried by the one that Bertoxxulous has created to protect the entrance into his den. If you dare travel into this pungent plane and find the ward bring it back. If we can halt the advanced toxins in Milyk's system maybe we can save him.");
	quest::setglobal("pop_pod_alder_fuirstel", 1, 5, "F");
        $client->Message(3,"You receive a character flag!");
	}
if($text=~/hail/i && $pop_pod_alder_fuirstel == 1 && $pop_pod_grimmus_planar_projection == 1)
	{
	quest::say("Please you must hurry! Take the ward that surrounds you back to my brother and lift the sickness that has come over him!");

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
