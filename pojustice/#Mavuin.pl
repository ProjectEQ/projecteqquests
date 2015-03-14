sub EVENT_SAY {

if($text=~/Hail/i && !defined $qglobals{pop_poj_mavuin})
	{
	quest::say("I have been locked away, shamed for a reason that is not my own! Take [" . quest::saylink("what information", 0, "this information") . "] to the Tribunal, I beg of you! It may be the only chance to prove that I am truly innocent!");
	}
if($text=~/What information/i && !defined $qglobals{pop_poj_mavuin})
	{
	quest::say("Oh, excuse me... The Tribunal is not a being who deals with parchment and quills, he will test you to allow me to [" . quest::saylink("plea your case", 0, "plea my case") . "].  When you tell him of my request, be prepared, $name.");
	}

if($text=~/plea your case/i && !defined $qglobals{pop_poj_mavuin})
	{
	quest::say("Thank you! Oh I wish you luck.");
        quest::setglobal("pop_poj_mavuin", 1, 5, "F");
        $client->Message(7,"You receive a character flag!");
	}
if($text=~/Hail/i && defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_mavuin})
	{
	quest::say("So you have pleaded my case to the Tribunal, I am most thankful. I hope that they will listen to my case soon and release me. The knowledge that I promised you is this. The followers in the Plane of Tranquility are trying to find information on what has happened to Zebuxoruk. What I know is that he has been captured for a second time. If you want to find out more information I believe you should seek an audience with Karana and Mithaniel Marr. I can only assume that they were present at the time of his capture and know why this has taken place. Also seek from Marr a way to translate the divine language. Only with it can you understand the writing of the gods. There is no more that I can tell you, but thank you once again for your attempt in returning my freedom.");
	quest::setglobal("pop_poj_valor_storms", 1, 5, "F");
        $client->Message(7,"You receive a character flag!");
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

plugin::return_items(\%itemcount); 

}