sub EVENT_SIGNAL
{
     if($signal == 5)
     {
       quest::stoptimer(1);
       $entry=undef;
     }
}



sub EVENT_TIMER

   {   if($timer == 1)
      {
      quest::stoptimer(1);
      $entry=undef;
      quest::shout("Hedge trial is now open");
      }
	if($timer == 2)
	{
	$entry=19;
        quest::stoptimer(2);
      	quest::settimer(1,7200);
	}
   }

sub EVENT_SAY{
      if($text=~/Hail/i && $entry == undef && $pop_pon_hedge_jezith == 1){
      quest::say("You there! You have talked to Adroha Jezith? Then I assume you are here to help me! ... Tell me when you are [ready] to begin, I will lead you through the maze and we, together, will end this endless torment!");
      }


      if($text=~/Hail/i && ($entry == 1 || $entry == 2 || $entry == 3 || $entry == 4 || $entry == 5 || $entry == 6 || $entry == 7 || $entry == 8 || $entry == 9 || $entry == 10 || $entry == 11|| $entry == 12 || $entry == 13 || $entry == 14 || $entry == 15 || $entry == 16 || $entry == 17 || $entry == 18) && $pop_pon_hedge_jezith == 1){
      quest::say("You there! You have talked to Adroha Jezith? Then I assume you are here to help me! ... Tell me when you are [ready] to begin, I will lead you through the maze and we, together, will end this endless torment!");
      }
      
  
      if($text=~/Hail/i && $entry >= 19 && $pop_pon_hedge_jezith == 1 ){
      quest::say("I do not have time for this.");

      }
   

      if($text=~/ready/i && ($entry == 1 || $entry == 2 || $entry == 3 || $entry == 4 || $entry == 5 || $entry == 6 || $entry == 7 || $entry == 8 || $entry == 9 || $entry == 10 || $entry == 11|| $entry == 12 || $entry == 13 || $entry == 14 || $entry == 15 || $entry == 16 || $entry == 17 || $entry == 18) && $pop_pon_hedge_jezith == 1){
      	quest::say("Ok moving you in !");
      	quest::movepc(204,-4774,5198,4);
      	$entry=$entry+1
      	}   

      if($text=~/ready/i && $entry == undef && $pop_pon_hedge_jezith == 1){
      	quest::say("Ok moving you in !");
      	quest::movepc(204,-4774,5198,4);
      	quest::signalwith(204058,5,3000);
	quest::settimer(2,600);
      	$entry=$entry+1
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
