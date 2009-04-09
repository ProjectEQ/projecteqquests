sub EVENT_SAY {

if($text=~/Hail/i && $pop_poi_behometh_preflag == undef)
	{
	quest::say("How did you get in here? Hrmm no matter, you will be helping me now for I am a [great warrior] of Rallos Zek and I know you wish not to provoke my fury!");
	}
if($text=~/great warrior/i && $pop_poi_behometh_preflag == undef)
	{
	quest::say("Yeah, you heard me! You know that I must be important if Rallos himself has plucked me from battlefield to complete this [task]. Even though I serve my lord, I am desperate to return to my place on the eternal battlefield.");
	}
if($text=~/task/i && $pop_poi_behometh_preflag == undef)
	{
	quest::say("Ya, you see Rallos sent me here to contract the machines to work on a mana powered piece of machinery that could test all on the eternal battlefield. This weapon of ultimate destruction is taking quite a long time to be completed. You know.. If you were to go [test the machine] and it were to fail against you I could be on my way back to tell Rallos that it was defeated by mere mortals. Help me to get back to the battlefield and out of this rusted out junkheap.");
	}
if($text=~/test the machine/i && $pop_poi_behometh_preflag == undef)
	{
	quest::say("Haha! I knew I sensed the warring spirit within you. Go through over there. Ignore those steam powered soldiers and their talk of perimeters. Go into the main construction area. You will know you are there when you see power carriers taking energy to power up the machine. If you can stop the energy carriers from releasing their energy the machine will activate to see what has happened. I shall come to check on you and take a full report when you have destroyed it it. Long live Rallos!");
	quest::setglobal("pop_poi_behometh_preflag", 1, 5, "F");
        $client->Message(3,"You receive a character flag!");
	}
if($text=~/Hail/i && $pop_poi_behometh_preflag == 1 && $tactics_flag == 1 && $pop_poi_behometh_flag == undef)
	{
        $client->Message(2,"You receive a character flag!");
	quest::setglobal("pop_poi_behometh_flag", 1, 5, "F");
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

sub EVENT_SIGNAL {
if($signal == 1) {
	$tactics_flag=1;
        quest::shout("Quickly! Come see me!");
	quest::settimer(8,600);
	}
if($signal == 2) {
        quest::shout("Fool! The machine cannot work outside of the room!");
        }
}

sub EVENT_TIMER {

if($timer == 8)
	{
	quest::stoptimer(8);
	$tactics_flag=undef;
	}
}

sub EVENT_DEATH
	{
	$tactics_flag=undef;
	}