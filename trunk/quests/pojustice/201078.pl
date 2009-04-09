#
#Plane of justice
#
#
#Trial of Execution
#
#
#Tribunal script - ENTRY into the chamber.
#
#
# - Wizardanim
# - tested 4/4/07
#
###################################


sub EVENT_SAY
{
   if(($text=~/Hail/i) && (!defined $execution) && defined $qglobals{pop_poj_mavuin}) #verify timer is not started
        { 
        quest::say("The Tribunal fixes you with a dark, peircing gaze. 'What do you want, mortal? Are you [prepared]?");
        }
   
      if($text=~/prepared/i && (defined $execution && $execution < 6 ) && defined $qglobals{pop_poj_mavuin})
	{
	quest::say("Very well. When you are ready, you may [begin the trial of execution]. The victim will perish should the hooded executioner reach him. Its life will end only when all of the nemeses which accompany it also perish. We shall judge the mark of your success, and you will bring me the mark from the Hooded Executioner Himself!");
	}


      if($text=~/trial of execution/i && defined $qglobals{pop_poj_mavuin} && defined $execution && $execution == 5)
        {
        quest::movepc(201,192,-1055,75);
	quest::say("Then begin.");
        $execution=6;
        }
      if($text=~/trial of execution/i && defined $qglobals{pop_poj_mavuin} && defined $execution && $execution == 4)
        {
        quest::movepc(201,192,-1055,75);
	quest::say("Then begin.");
        $execution=5;
        }

      if($text=~/trial of execution/i && defined $qglobals{pop_poj_mavuin} && defined $execution && $execution == 3)
        {
        quest::movepc(201,192,-1055,75);
	quest::say("Then begin.");
        $execution=4;
        }

      if($text=~/trial of execution/i && defined $qglobals{pop_poj_mavuin} && defined $execution && $execution == 2)
        {
        quest::movepc(201,192,-1055,75);
	quest::say("Then begin.");
        $execution=3;
        }
      if($text=~/trial of execution/i && defined $qglobals{pop_poj_mavuin} && defined $execution && $execution == 1)
        {
        quest::movepc(201,192,-1055,75);
	quest::say("Then begin.");
        $execution=2;
        }
      if($text=~/trial of execution/i && defined $qglobals{pop_poj_mavuin} && !defined $execution)
	{
	quest::say("Then begin.");
        quest::movepc(201,192,-1055,75);
        $execution=1;
	quest::settimer(47,30);
        quest::signal(201076,15000);
        }

   
      if(($text=~/Hail/i or $text=~/prepared/) && ($execution > 5) && defined $qglobals{pop_poj_mavuin}) #prevent access if timer started
        {
        quest::say("I'm sorry, the Trial of Execution is currently underway.");
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
          

sub EVENT_TIMER

{
   if($timer == 1)
     {
   $execution=undef;
   quest::stoptimer(1);
   quest::signal(201078,5);
     }

   if($timer == 47) {

	$execution=6;
        quest::stoptimer(47);
        quest::settimer(1,1200);

	}
}

sub EVENT_SIGNAL

   {
   quest::shout("The trial of Execution is now available."); #notify once timer expires OR FAIL. (~25 minuites)
   $execution=undef;
   quest::signal(201433);
   quest::stoptimer(1);
   }

sub EVENT_ITEM {

if(plugin::check_handin(\%itemcount, 31842 => 1) && defined $qglobals{pop_poj_mavuin}) {
	$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
	quest::setglobal("pop_poj_tribunal", 1, 5, "F");
	quest::setglobal("pop_poj_execution", 1, 5, "F");
	$client->Message(4,"You receive a character flag!");
	quest::summonitem(31842);
	}
if(plugin::check_handin(\%itemcount, 31796 => 1) && defined $qglobals{pop_poj_mavuin}) {
	$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
	quest::setglobal("pop_poj_tribunal", 1, 5, "F");
	quest::setglobal("pop_poj_flame", 1, 5, "F");
	$client->Message(4,"You receive a character flag!");
	quest::summonitem(31796);
	}
if(plugin::check_handin(\%itemcount, 31960 => 1) && defined $qglobals{pop_poj_mavuin}) {
	$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
	quest::setglobal("pop_poj_tribunal", 1, 5, "F");
	quest::setglobal("pop_poj_lashing", 1, 5, "F");
	$client->Message(4,"You receive a character flag!");
	quest::summonitem(31960);
	}
if(plugin::check_handin(\%itemcount, 31845 => 1) && defined $qglobals{pop_poj_mavuin}) {
	$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
	quest::setglobal("pop_poj_tribunal", 1, 5, "F");
	quest::setglobal("pop_poj_stoning", 1, 5, "F");
	$client->Message(4,"You receive a character flag!");
	quest::summonitem(31845);
	}
if(plugin::check_handin(\%itemcount, 31844 => 1) && defined $qglobals{pop_poj_mavuin}) {
	$client->Message(4,"You have completed a trial - impressive for mortals. You can tell Mavuin that we will hear his plea. We will seek him out as time befits us.");
	quest::setglobal("pop_poj_tribunal", 1, 5, "F");
	quest::setglobal("pop_poj_torture", 1, 5, "F");
	$client->Message(4,"You receive a character flag!");
	quest::summonitem(31844);
	}
else {
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
