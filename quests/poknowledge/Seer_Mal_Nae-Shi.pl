

sub EVENT_SAY {



if($text=~/Hail/i) {



		quest::say("Greetings, $name. I can provide you information upon your travels through the planes by [guided meditation].");

		}



if($text=~/guided meditation/i) {



		$client->Message(1,"You converse with Seer Mal Nae`Shi as she guides your meditation... You feel a power within your being, pulling your thougts left and right.  After some time, your mind clears, and Seer Mal Nae`Shi speaks.");

		$client->Message(9,"Now that your thoughts have calmed, tell me where you have traveled... There are many planes, try to think about your past, and your adventures in: [Plane of Justice] [Plane of Nightmare] [Plane of Innovation] [Plane of Disease] [Plane of Valor] [Plane of Storms] [Plane of Torment] [Ruins of Lxanvom] [Doomfire, the Burning Lands] [Drunder, Fortress of Zek] [Eryslai, the Kingdom of Wind] [Halls of Honor] [Lair of Terris Thule] [Bastion of Thunder] [Reef of Coirnav] [Tower of Solusek Ro] [Vegarlson, the Earthen Badlands] [Ragrax, Stronghold of the Twelve] [Temple of Marr].  If you have completed your elemental flag, say [elemental flag]");

		$client->Message(9,"If one option does not give you the information you need, you may be missing experience from some zones.  To find the credit you currently have, please just [unlock memories].");

		$client->Message(9,"There are special restrictions for the Temple of Marr, elemental planes, and Plane of Torment.  If you need assistance, say [special zones].");

		}





if($text=~/special zones/i) {



		$client->Message(9,"The Temple of Marr is a special access zone.  To access the Temple of Marr you must kill Bertox, Terris Thule, complete the three trials within Halls of Honor, and defeat Saryrn. The other special access zones are the elemental planes. These planes are Plane of Air, Plane of Water and Plane of Earth. To inquire about access to elemental planes, say [elemental planes]. To access the elemental planes: Plane of Fire is obtained by killing through the plane of innovation, to Drunder, Fortress of Zek, then to the Tower of Soluesk Ro, where you must kill Solusek Ro himself.  To access the other elemental planes, you must have completed ALL zone flags in lower zones, and kill Agnarr the storm lord, and Mithaniel Marr. To inquire about access to the Temple of Marr, say [Access to Temple of Marr]. The last special access zone is the Plane of Torment. You must have killed Terris Thule and Bertox before you can enter to kill Saryrn. To inquire about the Plane of Torment, say [Access to Torment]."); 



		}



#THIS JUST TELLS PEOPLE ABOUT ALL FLAGS 



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################





if($text=~/unlock memories/i) {



		$client->Message(9,"At the moment, your credit is as follows");

		



		if(defined $qglobals{pop_pon_hedge_jezith}) {



			$client->Message(12,"You have spoken to Jezith within the Plane of Tranquility for the Hedge preflag by saying tormented by nightmares.");



			}

		else {

		$client->Message(9,"You have NOT spoken to Jezith within the Plane of Tranquility for the Hedge preflag by saying tormented by nightmares.");

		}



		if(defined $qglobals{pop_pon_construct}) {



			$client->Message(12,"You have killed the Construct of Nightmares.");

	

			}

		else {

		$client->Message(9,"You have NOT killed the Construct of Nightmares.");

		}



		if(defined $qglobals{pop_ponb_terris}) {



			$client->Message(12,"You have killed Terris Thule.");

			

			}

		else {

		$client->Message(9,"You have NOT killed Terris Thule.");

		}



		if(defined $qglobals{pop_ponb_poxbourne}) {



			$client->Message(12,"You have talked to Poxbourne in the Plane of Tranquility after defeating Terris Thule.");

		

			}

		else {

		$client->Message(9,"You have NOT talked to Poxbourne in the Plane of Tranquility after defeating Terris Thule.");

		}



		if(defined $qglobals{pop_poi_dragon}) {



			$client->Message(12,"You have killed the dragon within the Plane of Innovation");



			}

		else {

		$client->Message(9,"You have NOT killed the dragon within the Plane of Innovation.");

		}



		if(defined $qglobals{pop_poi_behometh_preflag}) {



			$client->Message(12,"You have talked to the Gnome within the Plane of Innovation factory.");



			}

		else {

		$client->Message(9,"You have NOT talked to the Gnome within the Plane of Innovation factory.");

		}



		if(defined $qglobals{pop_poi_behometh_flag}) {



			$client->Message(12,"You have defeated the Behemoth within the Plane of Innovation and then QUICKLY hailed the Gnome in the factory.");



			}

		else {

		$client->Message(9,"You have NOT defeated the Behemoth within the Plane of Innovation and then QUICKLY hailed the Gnome in the factory.");

		}



		if(defined $qglobals{pop_pod_alder_fuirstel}) {



			$client->Message(12,"You have talked to Adler Fuirstel outside of the Plane of Disease.");



			}

		else {

		$client->Message(9,"You have NOT talked to Adler Fuirstel outside of the Plane of Disease.");

		}



		if(defined $qglobals{pop_pod_grimmus_planar_projection}) {



			$client->Message(12,"You have defeated Grummus.");



			}

		else {

		$client->Message(9,"You have NOT defeated Grummus.");

		}



		if(defined $qglobals{pop_pod_elder_fuirstel}) {



			$client->Message(12,"You have talked to Elder Fuirstel in the plane of Tranquility.");



			}

		else {

		$client->Message(9,"You have NOT talked to Elder Fuirstel in the Plane of Tranquility.");

		}



		if(defined $qglobals{pop_poj_mavuin}) {



			$client->Message(12,"You have talked to Mavuin, and have agreed to plea his case to The Tribunal.");



			}

		else {

		$client->Message(9,"You have NOT talked to Mavuin, and agreed to plea his case to The Tribunal.");

		}



		if(defined $qglobals{pop_poj_tribunal}) {



			$client->Message(12,"You have shown the Tribunal the mark from the trial you have completed.");



			}

		else {

		$client->Message(9,"You have NOT shown the Tribunal the mark from the trial you have completed.");

		}



		if(defined $qglobals{pop_poj_valor_storms}) {



			$client->Message(12,"You have returned to Mavuin, letting him know the tribunal will hear his case.");



			}

		else {

		$client->Message(9,"You have NOT returned to mavuin to tell him the tribunal will hear his case.");

		}



		if(defined $qglobals{pop_poj_execution}) {



			$client->Message(12,"You have completed the Trial of Execution.");



			}

		else {

		$client->Message(9,"You have NOT completed the Trial of Execution.");

		}



		if(defined $qglobals{pop_poj_flame}) {



			$client->Message(12,"You have completed the Trial of Flame.");



			}

		else {

		$client->Message(9,"You have NOT completed the Trial of Flame.");

		}



		if(defined $qglobals{pop_poj_hanging}) {



			$client->Message(12,"You have completed the Trial of Hanging.");



			}

		else {

		$client->Message(9,"You have NOT completed the Trial of Hanging.");

		}



		if(defined $qglobals{pop_poj_lashing}) {



			$client->Message(12,"You have completed the Trial of Lashing.");



			}

		else {

		$client->Message(9,"You have NOT completed the Trial of Lashing.");

		}



		if(defined $qglobals{pop_poj_stoning}) {



			$client->Message(12,"You have completed the Trial of Stoning.");



			}

		else {

		$client->Message(9,"You have NOT completed the Trial of Stoning.");

		}



		if(defined $qglobals{pop_poj_torture}) {



			$client->Message(12,"You have completed the Trial of Torture.");



			}

		else {

		$client->Message(9,"You have NOT completed the Trial of Torture.");

		}



		if(defined $qglobals{pop_pov_aerin_dar}) {



			$client->Message(12,"You have defeated the prismatic dragon, Aerin`Dar, within the Plane of Valor.");



			}

		else {

		$client->Message(9,"You have NOT defeated the prismatic dragon, Aerin`Dar, within the Plane of Valor.");

		}



		if($qglobals{pop_pos_askr_the_lost} == 3) {



			$client->Message(12,"You have completed part one of Askr's task within the Plane of Storms.");



			}

		else {

		$client->Message(9,"You have NOT completed part one of Askr's task within the Plane of Storms.");

		}





		if(defined $qglobals{pop_pos_askr_the_lost_final}) {



			$client->Message(12,"You have killed the giants within the Plane of Storms and completed Askr's task.");



			}

		else {

		$client->Message(9,"You have NOT killed the giants within the Plane of Storms to complete Askr's task.");

		}



		if(defined $qglobals{pop_cod_preflag}) {



			$client->Message(12,"You have completed the Carprin cycle within Ruins of Lxanvom.");



			}

		else {

		$client->Message(9,"You have NOT completed the Carprin Cycle within Ruins of Laxanvom.");

		}



		if(defined $qglobals{pop_cod_bertox}) {



			$client->Message(12,"You have killed Bertox and hailed the planar projection.");



			}

		else {

		$client->Message(9,"You have NOT killed Bertox and hailed the planar projection.");

		}



		if(defined $qglobals{pop_cod_final}) {



			$client->Message(12,"You have killed Bertox and talked to Adler Fuirstel");



			}

		else {

		$client->Message(9,"You have NOT talked to Adler Fuirstel after killing Bertox.");

		}



		if(defined $qglobals{pop_pot_shadyglade}) {



			$client->Message(12,"You have talked to Shadyglade within the Plane of Tranquility");



			}

		else {

		$client->Message(9,"You have NOT talked to Shadyglade within the Plane of Tranquility.");

		}



		if(defined $qglobals{pop_pot_newleaf}) {



			$client->Message(12,"You have killed the Keeper of Sorrows.");



			}

		else {

		$client->Message(9,"You have NOT killed the Keeper of Sorrows.");

		}



		if(defined $qglobals{pop_pot_saryrn}) {



			$client->Message(12,"You have killed Saryrn and hailed the planar projection.");



			}

		else {

		$client->Message(9,"You have NOT killed Saryrn and hailed the planar projection.");

		}



		if(defined $qglobals{pop_pot_saryrn_final}) {



			$client->Message(12,"You have killed Saryrn, hailed the planar projection, and then talked to Shadyglade once more.");



			}

		else {

		$client->Message(9,"You have NOT talked to Shadyglade after killing Saryrn.");

		}



		if(defined $qglobals{pop_hoh_faye}) {



			$client->Message(12,"You have completed the Halls of Honor trial given by Faye.");



			}

		else {

		$client->Message(9,"You have NOT completed the Halls of Honor trial given by Faye.");

		}



		if(defined $qglobals{pop_hoh_trell}) {



			$client->Message(12,"You have completed the Halls of Honor trial given by Rhaliq Trell.");



			}

		else {

		$client->Message(9,"You have NOT completed the Halls of Honor trial given by Rhaliq Trell.");

		}



		if(defined $qglobals{pop_hoh_garn}) {



			$client->Message(12,"You have completed the Halls of Honor trial given by Alekson Garn.");



			}

		else {

		$client->Message(9,"You have NOT completed the Halls of Honor trial given by Alekson Garn.");

		}



		if(defined $qglobals{pop_hohb_marr}) {



			$client->Message(12,"You have defeated Lord Marr within his temple.");



			}

		else {

		$client->Message(9,"You have NOT defeated Lord Marr within his Temple.");

		}



		if(defined $qglobals{pop_bot_agnarr}) {



			$client->Message(12,"You have defeated Agnarr, the Storm Lord.");



			}

		else {

		$client->Message(9,"You have NOT defeated Agnarr, the Storm Lord.");

		}





		if(defined $qglobals{pop_tactics_tallon}) {



			$client->Message(12,"You have killed Tallon Zek.");



			}

		else {

		$client->Message(9,"You have NOT killed Tallon Zek");

		}



		if(defined $qglobals{pop_tactics_vallon}) {



			$client->Message(12,"You have killed Vallon Zek.");



			}

		else {

		$client->Message(9,"You have NOT killed Vallon Zek.");

		}



		if(defined $qglobals{pop_tactics_ralloz}) {



			$client->Message(12,"You have killed Rallos Zek the Warlord.");



			}

		else {

		$client->Message(9,"You have NOT killed Rallos Zek the Warlord.");

		}



		if(defined $qglobals{pop_elemental_grand_librarian}) {



			$client->Message(12,"You have spoken with the grand librarian to receive access to the Elemental Planes.");



			}

		else {

		$client->Message(9,"You have NOT spoken with the grand librarian to receive access to the Elemental Planes.");

		}



		if(defined $qglobals{pop_sol_ro_arlyxir}) {



			$client->Message(12,"You have defeated Arlyxir within the Tower of Solusek Ro.");



			}

		else {

		$client->Message(9,"You have NOT defeated Arlyxir within the Tower of Solusek Ro.");

		}



		if(defined $qglobals{pop_sol_ro_dresolik}) {



			$client->Message(12,"You have defeated The Protector of Dresolik within the Tower of Solusek Ro.");



			}

		else {

		$client->Message(9,"You have NOT defeated The Protector of Dresolik within the Tower of Solusek Ro.");

		}





		if(defined $qglobals{pop_sol_ro_jiva}) {



			$client->Message(12,"You have defeated Jiva within the Tower of Soluesk Ro.");



			}

		else {

		$client->Message(9,"You have NOT defeated Jiva within the Tower of Solusek Ro.");

		}



		if(defined $qglobals{pop_sol_ro_rizlona}) {



			$client->Message(12,"You have defeated Rizlona within the Tower of Solusek Ro.");



		}

		else {

		$client->Message(9,"You have NOT defeated Rizlona within the Tower of Solusek Ro.");

		}



		if(defined $qglobals{pop_sol_ro_xuzl}) {



			$client->Message(12,"You have defeated Xuzl within the Tower of Solusek Ro.");



		}

		else {

		$client->Message(9,"You have NOT defeated Xuzl within the Tower of Solusek Ro.");

		}



		if(defined $qglobals{pop_sol_ro_solusk}) {



			$client->Message(12,"You have defeated Solusek Ro within his own tower.");



		}

		else {

		$client->Message(9,"You have NOT defeated Solusek Ro within the Tower of Solusek Ro.");

		}



		if(defined $qglobals{pop_fire_fennin_projection}) {



			$client->Message(12,"You have defeated Fennin Ro, the Tyrant of Fire.");



		}

		else {

		$client->Message(9,"You have NOT defeated Fennin Ro, the Tyrant of Fire.");

		}



		if(defined $qglobals{pop_wind_xegony_projection}) {

	

			$client->Message(12,"You have defeated Xegony, the Queen of Air.");



			}

		else {

		$client->Message(9,"You have NOT defeated Xegony, the Queen of Air.");

		}



		if(defined $qglobals{pop_water_coirnav_projection}) {



			$client->Message(12,"You have defeated Coirnav, the Avatar of Water.");



			}

		else {

		$client->Message(9,"You have NOT defeated Coirnav, the Avatar of Water.");

		}





		if(defined $qglobals{pop_eartha_arbitor_projection}) {



			$client->Message(12,"You have defeated the arbitor within Plane of Earth A.");

	

			}

		else {

		$client->Message(9,"You have NOT defeated the Arbitor of Earth within Plane of Earth A");

		}



		if(defined $qglobals{pop_earthb_rathe}) {



			$client->Message(12,"You have defeated the Rathe Council within Plane of Earth B");



			}

		else {

		$client->Message(9,"You have NOT defeated the Rathe Council within Plane of Earth B");

		}



		if(defined $qglobals{pop_time_maelin}) {



			$client->Message(12,"You have completed the Plane of Time flag.");



			}

	

		else {

		$client->Message(9,"You have NOT completed your Plane of Time flag.");

		}

}





##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################





# PLANE OF NIGHTMARE ACCESS TO PONB INSTRUCTIONS





##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################







if($text=~/Plane of Nightmare/i && (!defined $qglobals{pop_pon_hedge_jezith} || !$qglobals{pop_pon_construct})) {



		if(defined $qglobals{pop_pon_hedge_jezith}) {



		$client->Message(12,"You have spoken to Jezith within the Plane of Tranquility for the Hedge Preflag by saying tormented by nightmares.");



		}

		else {

		$client->Message(9,"You have not spoken to Jezith within the Plane of Tranquility for the Hedge Preflag by saying tormented by nightmares.");

		}



		if(defined $qglobals{pop_pon_construct}) {



		$client->Message(12,"You have killed the Construct of Nightmares.");

	

		}

		else {

		$client->Message(9,"You have NOT killed the Construct of Nightmares.");

		

		}

	}



if($text=~/Plane of Nightmare/i && defined $qglobals{pop_pon_construct} && defined $qglobals{pop_pon_hedge_jezith}) {



		$client->Message(4,"You do not fear the Dark?--then converse with the Planar Projection by saying [Darkness Beckons].");

		

		}



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################





# Plane of INNOVATION ACCESS TO DRUNDER INSTRUCTIONS





##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################







if($text=~/Plane of Innovation/i && (!defined $qglobals{pop_poi_dragon} || !defined $qglobals{pop_poi_behometh_preflag} || !defined $qglobals{pop_poi_behometh_flag})) {



	if(defined $qglobals{pop_poi_dragon}) {



		$client->Message(12,"You have killed the dragon within the Plane of Innovation");



		}

		else {

		$client->Message(9,"You have NOT killed the dragon within the Plane of Innovation.");

		}



		if(defined $qglobals{pop_poi_behometh_preflag}) {



		$client->Message(12,"You have talked to the Gnome within the Plane of Innovation Factory.");



		}

		else {

		$client->Message(9,"You have NOT talked to the Gnome within the plane of innovation factory.");

		}



		if(defined $qglobals{pop_poi_behometh_flag}) {



		$client->Message(12,"You have defeated the Behemoth within Plane of Innovation and then QUICKLY hailed the gnome within the factory.");



		}

		else {

		$client->Message(9,"You have NOT defeated the Behemoth within Plane of Innovation and then QUICKLY hailed the gnome within the factory.");

		}

	}



if($text=~/Plane of Innovation/i && defined $qglobals{pop_poi_behometh_preflag} && defined $qglobals{pop_poi_behometh_flag} ) {



		$client->Message(4,"You have halted production of these evil machines by Killing the Behemoth! Converse with the Planar projection by saying [The War Drums Echo]");

		

		}



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#Plane of Disease instructions TO COD



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



if($text=~/Plane of Disease/i && (!defined $qglobals{pop_pod_alder_fuirstel} || !defined $qglobals{pop_pod_grimmus_planar_projection} || !defined $qglobals{pop_pod_elder_fuirstel})) {



		if(defined $qglobals{pop_pod_alder_fuirstel}) {



		$client->Message(12,"You have talked to Adler Fuirstel outside of the Plane of Disease.");



		}

		else {

		$client->Message(9,"You have NOT talked to Adler Fuirstel outside of the Plane of Disease.");

		}



		if(defined $qglobals{pop_pod_grimmus_planar_projection}) {



		$client->Message(12,"You have defeated Grummus");



		}

		else {

		$client->Message(9,"You have NOT defeated Grummus.");

		}



		if(defined $qglobals{pop_pod_elder_fuirstel}) {



		$client->Message(12,"You have talked to Elder Fuirstel in the Plane of Tranquility.");



		}

		else {

		$client->Message(9,"You have NOT talked to Elder Fuirstel in the Plane of Tranquility.");

		}



	}



if($text=~/Plane of Disease/i && defined $qglobals{pop_pod_alder_fuirstel} && defined $qglobals{pop_pod_grimmus_planar_projection} && defined $qglobals{pop_pod_elder_fuirstel}) {



		$client->Message(4,"Congratulations! Converse with the Planar Projection by saying [I will destroy the plaguebringer]");



		}





##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#Plane of JUSTICE INSTRUCTIONS



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################







if($text=~/Plane of Justice/i && (!defined $qglobals{pop_poj_mavuin} || !defined $qglobals{pop_poj_tribunal} || !defined $qglobals{pop_poj_valor_storms})) {



		if(defined $qglobals{pop_poj_mavuin}) {



		$client->Message(12,"You have talked to Mavuin, and have agreed to plea his case to The Tribunal.");



		}

		else {

		$client->Message(9,"You have NOT talked to Mavuin, and agreed to plea his case to The Tribunal.");

		}



		if(defined $qglobals{pop_poj_tribunal}) {



		$client->Message(12,"You have shown the Tribunal the mark from the trial you have completed.");



		}

		else {

		$client->Message(9,"You have NOT shown the Tribunal the mark from the trial you have completed.");

		}



		if(defined $qglobals{pop_poj_valor_storms}) {



		$client->Message(12,"You have returned to Mavuin, letting him know the tribunal will hear his case.");



		}

		else {

		$client->Message(9,"You have NOT returned to Mavuin to tell him the tribunal will hear his case.");

		}

	}



if($text=~/Plane of Justice/i && defined $qglobals{pop_poj_mavuin} && defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms}) {



		$client->Message(4,"Congratulations! Converse with the Planar Projection by saying [I am familiar with Order] to receive access to Planes of Valor and Storms.");



		}



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#PLANE OF VALOR COMPLETION



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################





if($text=~/Plane of Valor/i && (!defined $qglobals{pop_pov_aerin_dar})) {



		

		if(defined $qglobals{pop_pov_aerin_dar}) {



		$client->Message(12,"You have defeated the prismatic dragon, Aerin`Dar, within the Plane of Valor.");



		}

		else {

		$client->Message(9,"You have NOT defeated the prismatic dragon, Aerin`Dar, within the Plane of Valor.  Make sure you have completed a [Plane of Justice] Trial.");

		}

	}



if($text=~/Plane of Valor/i && defined $qglobals{pop_poj_mavuin} && defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms} && defined $qglobals{pop_pov_aerin_dar}) {



		$client->Message(4,"Congratulations! Converse with the Planar Projection by saying [My Valor is Unmatched] to gain access to the Halls of Honor");



		}







##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#PLANE OF STORMS INSTRUCTIONS





##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



if($text=~/Plane of Storms/i && (!defined $qglobals{pop_pos_askr_the_lost} || !defined $qglobals{pop_pos_askr_the_lost})) {



		

		if($qglobals{pop_pos_askr_the_lost} == 3) {



		$client->Message(12,"You have completed part one of Askr's task within the Plane of Storms.");



		}

		else {

		$client->Message(9,"You have NOT completed part one of Askr's task within the Plane of Storms.  Make sure you have completed a [Plane of Justice] Trial.");

		}





		if(defined $qglobals{pop_pos_askr_the_lost_final}) {



		$client->Message(12,"You have killed the giants within the Plane of Storms and completed Askr's task.");



		}

		else {

		$client->Message(9,"You have NOT killed the giants within the Plane of Storms to complete Askr's task. Make sure you have completed a [Plane of Justice] Trial.");

		}

	}





if($text=~/Plane of Storms/i && defined $qglobals{pop_poj_mavuin} && defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms} && $qglobals{pop_pos_askr_the_lost} == 3 && $qglobals{pop_pos_askr_the_lost} == 3) {



		$client->Message(4,"Congratulations! Converse with the Planar Projection by saying [I will defeat the Storm Lord] to gain access to the Bastion of Thunder");



		}





##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#PLANE OF NIGHTMARE B INSTRUCTIONS



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



if($text=~/Lair of Terris Thule/i && (!defined $qglobals{pop_ponb_terris} || !defined $qglobals{pop_ponb_poxbourne})) {



		if(defined $qglobals{pop_ponb_terris}) {



		$client->Message(12,"You have killed Terris Thule.");

			

		}

		else {

		$client->Message(9,"You have NOT killed Terris Thule.  Make sure you have completed the events within the [Plane of Nightmare].");

		}



		if(defined $qglobals{pop_ponb_poxbourne}) {



		$client->Message(12,"You have talked to Poxbourne in the Plane of Tranquility after defeating Terris Thule.");

		

		}

		else {

		$client->Message(9,"You have NOT talked to Poxbourne in the Plane of Tranquility after defeating Terris Thule.  Make sure you have completed the events within the [Plane of Nightmare].");

		}

	}





if($text=~/Lair of Terris Thule/i && defined $qglobals{pop_ponb_terris} && defined $qglobals{pop_ponb_poxbourne} && defined $qglobals{pop_pon_hedge_jezith} && defined $qglobals{pop_pon_construct}) {



		$client->Message(4,"You have completed a partial flag for the Plane of Torment! Say [access to torment] to see what else is required.");

		}	

		

	





##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#RUINS OF LX INSTRUCTIONS - Ruins of Lxanvom





##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



if($text=~/Ruins of Lxanvom/i && (!defined $qglobals{pop_cod_preflag} || !defined $qglobals{pop_cod_bertox} || !defined $qglobals{pop_cod_final})) {



		if(defined $qglobals{pop_cod_preflag}) {



		$client->Message(12,"You have completed the Carprin cycle within the Ruins of Lxanvom.");



		}

		else {

		$client->Message(9,"You have NOT completed the Carprin Cycle within Ruins of Laxanvom.  Make sure you have completed the events within [Plane of Disease]");

		}



		if(defined $qglobals{pop_cod_bertox}) {



		$client->Message(12,"You have killed Bertox and hailed the planar projection.");



		}

		else {

		$client->Message(9,"You have NOT killed Bertox and hailed the planar projection.  Make sure you have completed the events within [Plane of Disease]");

		}



		if(defined $qglobals{pop_cod_final}) {



		$client->Message(12,"You have killed Bertox and talked to Adler Fuirstel");



		}

		else {

		$client->Message(9,"You have NOT talked to Adler Fuirstel after killing Bertox.  Make sure you have completed the events within [Plane of Disease]");

		}

	}



if($text=~/Ruins of Lxanvom/i && defined $qglobals{pop_cod_preflag} && defined $qglobals{pop_cod_bertox} && defined $qglobals{pop_cod_final} && defined $qglobals{pop_pod_alder_fuirstel} && defined $qglobals{pop_pod_grimmus_planar_projection} && defined $qglobals{pop_pod_elder_fuirstel}) {



		$client->Message(4,"You have completed a partial flag for the Plane of Torment!  Say [access to Torment] to see what else is required.");



		}

	



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#Plane of Torment INSTRUCTIONS



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



if($text=~/Plane of Torment/i && (!defined $qglobals{pop_pot_shadyglade} || !defined $qglobals{pop_pot_newleaf} || !defined $qglobals{pop_pot_saryrn} || !defined $qglobals{pop_pot_saryrn_final})) {



		if(defined $qglobals{pop_pot_shadyglade}) {



		$client->Message(12,"You have talked to Shadyglade within the Plane of Tranquility");



		}

		else {

		$client->Message(9,"You have NOT talked to Shadyglade within the Plane of Tranquility.");

		}



		if(defined $qglobals{pop_pot_newleaf}) {



		$client->Message(12,"You have killed the Keeper of Sorrows.");



		}

		else {

		$client->Message(9,"You have NOT killed the Keeper of Sorrows.");

		}



		if(defined $qglobals{pop_pot_saryrn}) {



		$client->Message(12,"You have killed Saryrn and hailed the planar projection.");



		}

		else {

		$client->Message(9,"You have NOT killed Saryrn and hailed the planar projection.");

		}



		if(defined $qglobals{pop_pot_saryrn_final}) {



		$client->Message(12,"You have killed Saryrn, hailed the planar projection, and then talked to Shadyglade once more. Please make sure you have completed events within [Plane of Nightmare] [Plane of Disease] [Halls of Honor] [Lair of Terris Thule] [Ruins of Lxanvom] [Plane of Storms] to advance to the Temple of Marr.");



		}

		else {

		$client->Message(9,"You have NOT talked to Shadyglade after killing Saryrn. Please make sure you have completed events within [Plane of Nightmare] [Plane of Disease] [Halls of Honor] [Lair of Terris Thule] [Ruins of Lxanvom] [Plane of Storms] to advance to the Temple of Marr.");

		}

	}



if($text=~/Plane of Torment/i && defined $qglobals{pop_pot_shadyglade} && defined $qglobals{pop_pot_newleaf} && defined $qglobals{pop_pot_saryrn} && defined $qglobals{pop_pot_saryrn_final}) {



		$client->Message(4,"Congratulations! You have defeated Saryrn!");



		}







##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#HALLS OF HONOR INSTRUCTIONS



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################







if($text=~/Halls of Honor/i && (!defined $qglobals{pop_hoh_faye} || !defined $qglobals{pop_hoh_trell} || !defined $qglobals{pop_hoh_garn})) {



		

		if(defined $qglobals{pop_hoh_faye}) {



		$client->Message(12,"You have completed the Halls of Honor trial given by Faye.");



		}

		else {

		$client->Message(9,"You have NOT completed the Halls of Honor trial given by Faye.");

		}



		if(defined $qglobals{pop_hoh_trell}) {



		$client->Message(12,"You have completed the Halls of Honor trial given by Rhaliq Trell.");



		}

		else {

		$client->Message(9,"You have NOT completed the Halls of Honor trial given by Rhaliq Trell.");

		}



		if(defined $qglobals{pop_hoh_garn}) {



		$client->Message(12,"You have completed the Halls of Honor trial given by Alekson Garn.");



		}

		else {

		$client->Message(9,"You have NOT completed the Halls of Honor trial given by Alekson Garn.");

		}

	}



if($text=~/Halls of Honor/i && defined $qglobals{pop_hoh_faye} && defined $qglobals{pop_hoh_trell} && defined $qglobals{pop_hoh_garn}) {



		$client->Message(4,"You have completed all trials! Converse with the Projection by saying [I am ready to face Lord Mithaniel Marr]");



		}





##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#PLANE OF TACTICS



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



if($text=~/Fortress of Zek/i && (!defined $qglobals{pop_tactics_tallon} || !defined $qglobals{pop_tactics_vallon} || !defined $qglobals{pop_tactics_ralloz})) {



		

		if(defined $qglobals{pop_tactics_tallon}) {



		$client->Message(12,"You have killed Tallon Zek.");



		}

		else {

		$client->Message(9,"You have NOT killed Tallon Zek");

		}



		if(defined $qglobals{pop_tactics_vallon}) {



		$client->Message(12,"You have killed Vallon Zek.");



		}

		else {

		$client->Message(9,"You have NOT killed Vallon Zek.");

		}



		if(defined $qglobals{pop_tactics_ralloz}) {



		$client->Message(12,"You have killed Rallos Zek the Warlord.");



		}

		else {

		$client->Message(9,"You have NOT killed Rallos Zek the Warlord.  Make sure you have completed the [Plane of Innovation] flags");

		}

	}



if($text=~/Fortress of Zek/i && defined $qglobals{pop_tactics_tallon} && defined $qglobals{pop_tactics_vallon} && defined $qglobals{pop_pot_saryrn_final} && defined $qglobals{pop_pot_saryrn} && defined $qglobals{pop_hohb_marr}) {



		$client->Message(4,"Congratulations! You have proven yourself in war, now let us see if you can prove yourself in fire! To gain access to the Tower of Solusek Ro, converse with the projection and say [No gladiator shall match me]");



		}

	





##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#SOL RO INSTRUCTIONS



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



if($text=~/Tower of Solusek Ro/i && (!defined $qglobals{pop_sol_ro_arlyxir} || !defined $qglobals{pop_sol_ro_dresolik} || !defined $qglobals{pop_sol_ro_jiva} || !defined $qglobals{pop_sol_ro_xuzl} || !defined $qglobals{pop_sol_ro_rizlona} || !defined $qglobals{pop_sol_ro_solusk})) {



		if(defined $qglobals{pop_sol_ro_arlyxir}) {



		$client->Message(12,"You have defeated Arlyxir within the Tower of Solusek Ro.");



		}

		else {

		$client->Message(9,"You have NOT defeated Arlyxir within the Tower of Solusek Ro.");

		}



		if(defined $qglobals{pop_sol_ro_dresolik}) {



		$client->Message(12,"You have defeated The Protector of Dresolik within the Tower of Solusek Ro.");



		}

		else {

		$client->Message(9,"You have NOT defeated The Protector of Dresolik within the Tower of Solusek Ro.");

		}





		if(defined $qglobals{pop_sol_ro_jiva}) {



		$client->Message(12,"You have defeated Jiva within the Tower of Solusek Ro.");



		}

		else {

		$client->Message(9,"You have NOT defeated Jiva within the Tower of Solusek Ro.");

		}



		if(defined $qglobals{pop_sol_ro_rizlona}) {



		$client->Message(12,"You have defeated Rizlona within the Tower of Solusek Ro.");



		}

		else {

		$client->Message(9,"You have NOT defeated Rizlona within the Tower of Solusek Ro.");

		}



		if(defined $qglobals{pop_sol_ro_xuzl}) {



		$client->Message(12,"You have defeated Xuzl within the Tower of Solusek Ro.");



		}

		else {

		$client->Message(9,"You have NOT defeated Xuzl within the Tower of Solusek Ro.");

		}



		if(defined $qglobals{pop_sol_ro_solusk}) {



		$client->Message(12,"You have defeated Solusek Ro within his own tower.  Please make sure you've completed events in the [Plane of Innovation] and [Drunder, Fortress of Zek].");



		}

		else {

		$client->Message(9,"You have NOT defeated Solusek Ro within the Tower of Solusek Ro.  Please make sure youve completed events in the [Plane of Innovation] and [Drunder, Fortress of Zek].");

		}

	}



if($text=~/Tower of Solusek Ro/i && defined $qglobals{pop_sol_ro_arlyxir} && defined $qglobals{pop_sol_ro_dresolik} && defined $qglobals{pop_sol_ro_jiva} && defined $qglobals{pop_sol_ro_xuzl} && defined $qglobals{pop_sol_ro_rizlona} && defined $qglobals{pop_sol_ro_solusk}) {



		$client->Message(4,"Congratulations! You are now able to enter the Plane of Fire!  Converse with the Projection and tell him [I am a child of fire].");

}

		



		

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#PLANE OF FIRE INSTRUCTIONS



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



if($text=~/Doomfire/i && !defined $qglobals{pop_fire_fennin_projection}) {



		$client->Message(4,"You must kill Fennin Ro.");



		}



if($text=~/Doomfire/i && defined $qglobals{pop_fire_fennin_projection}) {



		$client->Message(4,"You have defeated Fennin Ro, the Tyrant of Fire! This flag is one quarter of the Plane of Time flag. The grand librarian gives out the Plane of Time flag. However, you are able to continually check your flags through guided meditation to see what remains.");



		}



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#PLANE OF WATER INSTRUCTIONS



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################





if($text=~/Reef of/i && !defined $qglobals{pop_water_coirnav_projection}) {



		$client->Message(4,"You must kill Coirnav, the Avatar of Water.");



		}





if($text=~/Reef of/i && defined $qglobals{pop_water_coirnav_projection}) {



		$client->Message(4,"You have defeated Coirnav, the Avatar of Water! This flag is one quarter of the Plane of Time flag. The grand librarian gives out the Plane of Time flag. However, you are able to continually check your flags through guided meditation to see what remains.");



		}



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#PLANE OF AIR INSTRUCTIONS



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



if($text=~/Kingdom of Wind/i && !defined $qglobals{pop_wind_xegony_projection}) {



		$client->Message(4,"You must kill Xegony, the Queen of Air.");



		}



if($text=~/Kingdom of wind/i && defined $qglobals{pop_wind_xegony_projection}) {



		$client->Message(4,"You have defeated Xegony, the Queen of Air! This flag is one quarter of the Plane of Time flag. The grand librarian gives out the Plane of Time flag. However, you are able to continually check your flags through guided meditation to see what remains.");



		}



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#PLANE OF EARTH A INSTRUCTIONS



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



if($text=~/Earthen Badlands/i && !defined $qglobals{pop_eartha_arbitor_projection}) {



		$client->Message(4,"To receive your flag for Poearth B, you must defeat the four trials in Plane of Earth and kill the Arbitor.");



		}





if($text=~/Earthen Badlands/i && defined $qglobals{pop_eartha_arbitor_projection}) {



		$client->Message(4,"You have defeated the Arbitor of Earth! To receive your Plane of Earth B flag, converse with the projection and say [I will prove myself by defeating the Rathe Council].");



		}



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#PLANE OF EARTH B INSTRUCTIONS -Stronghold of the Twelve



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



if($text=~/stronghold of twelve/i && !defined $qglobals{pop_earthb_rathe}) {



		$client->Message(4,"You must defeat the Rathe Council.");



		}





if($text=~/stronghold of twelve/i && defined $qglobals{pop_earthb_rathe}) {



		$client->Message(4,"You have defeated the Rathe Council! This flag is one quarter of the Plane of Time flag. The grand librarian gives out the Plane of Time flag. However, you are able to continually check your flags through guided meditation to see what remains.");



		}





##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



# BASTION OF THUNDER INSTRUCTIONS



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################





if($text=~/of thunder/i && !defined $qglobals{pop_bot_agnarr}) {



		$client->Message(4,"You have not defeated Agnarr, the Storm Lord.");



		}



if($text=~/of thunder/i && defined $qglobals{pop_bot_agnarr}) {



		$client->Message(4,"You have defeated Agnarr, the Storm Lord! This is part of the elemental flag! Once you are finished with the elemental flag, let me know by saying [elemental flag].");



		}





##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



# TEMPLE OF MARR INSTRUCTIONS



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################





if($text=~/temple of/i && !defined $qglobals{pop_hohb_marr}) {



		$client->Message(4,"You have not killed Lord Mithaniel Marr.");



		}





if($text=~/temple of/i && defined $qglobals{pop_hohb_marr}) {



		$client->Message(4,"You have defeated Lord Mithaniel Marr!  This is part of the elemental flag! Once you are finnished with the elemental flag, let me know by saying [elemental flag].");



		}



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#ELEMENTAL PLANES



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################





if($text=~/elemental planes/i && (!defined $qglobals{pop_hohb_marr} && !defined $qglobals{pop_bot_agnarr})) {



		$client->Message(4,"You first must kill Agnarr and Lord Marr before you may attempt a request for an elemental flag!  The elemental flags in [Plane of Nightmare] [Plane of Disease] [Plane of Justice] [Plane of Valor] [Plane of Storms] [Bastion of Thunder] [Plane of Torment] [Lair of Terris Thule] [Halls of Honor] [Ruins of Lxanvom].");



		}



if($text=~/elemental planes/i && defined $qglobals{pop_hohb_marr} && defined $qglobals{pop_bot_agnarr} && defined $qglobals{pop_pon_hedge_jezith} && defined $qglobals{pop_pon_construct} && defined $qglobals{pop_ponb_terris} && defined $qglobals{pop_ponb_poxbourne} && defined $qglobals{pop_pod_alder_fuirstel} && defined $qglobals{pop_pod_grimmus_planar_projection} && defined $qglobals{pop_pod_elder_fuirstel} && defined $qglobals{pop_poj_mavuin} && defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms} && defined $qglobals{pop_pov_aerin_dar} && $qglobals{pop_pos_askr_the_lost} == 3 && defined $qglobals{pop_pos_askr_the_lost_final} && defined $qglobals{pop_cod_preflag} && defined $qglobals{pop_cod_bertox} && defined $qglobals{pop_cod_final} && defined $qglobals{pop_pot_shadyglade} && defined $qglobals{pop_pot_shadyglade} && defined $qglobals{pop_pot_saryrn} && defined $qglobals{pop_pot_saryrn_final} && defined $qglobals{pop_hoh_faye} && defined $qglobals{pop_hoh_trell} && defined $qglobals{pop_hoh_garn}) {



		$client->Message(4,"You have completed the Elemental Flag! You now will have access to Plane of Water, Plane of Air, and Plane of Earth! Plane of Fire access is given through the killing of Solusek Ro. If you do not currently have the Plane of Fire flag, please say [unlock memories]... Otherwise, converse with the elemental and say [I am worthy of the Elemental Planes]");

			

		}







##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#Access to Marr



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



if($text=~/Access to Temple of Marr/i) {



	$client->Message(4,"To access the Temple of Marr, after you have killed Terris Thule, Saryrn, Bertox the Halls of Honor Trials, and all of the flags before this (further help, say [unlock memories]), or say [I am ready to access the Temple of Marr].");



	}



if($text=~/I am ready to access the Temple of Marr/i && defined $qglobals{pop_pon_hedge_jezith} && defined $qglobals{pop_pon_construct} && defined $qglobals{pop_ponb_terris} && defined $qglobals{pop_ponb_poxbourne} && defined $qglobals{pop_poi_dragon} && defined $qglobals{pop_poi_behometh_preflag} && defined $qglobals{pop_poi_behometh_flag} && defined $qglobals{pop_pod_alder_fuirstel} && defined $qglobals{pop_pod_grimmus_planar_projection} && defined $qglobals{pop_pod_elder_fuirstel} && defined $qglobals{pop_poj_mavuin} && defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms} && defined $qglobals{pop_pov_aerin_dar} && $qglobals{pop_pos_askr_the_lost} == 3 && defined $qglobals{pop_pos_askr_the_lost_final} && defined $qglobals{pop_cod_preflag} && defined $qglobals{pop_cod_bertox} && defined $qglobals{pop_cod_final} && defined $qglobals{pop_pot_shadyglade} && defined $qglobals{pop_pot_shadyglade} && defined $qglobals{pop_pot_saryrn} && defined $qglobals{pop_pot_saryrn_final} && defined $qglobals{pop_hoh_faye} && defined $qglobals{pop_hoh_trell} && defined $qglobals{pop_hoh_garn}) {



	$client->Message(4,"You have completed your access to the Temple of Marr! Congratulations! Converse with the projection by saying [I am ready to face Lord Mithaniel Marr].");



			

	}





##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



#Access to TORMENT



##############################################################################################################################

##############################################################################################################################

##############################################################################################################################

##############################################################################################################################



if($text=~/Access to Torment/i && (!defined $qglobals{pop_pod_alder_fuirstel} || !defined $qglobals{pop_pod_grimmus_planar_projection} || !defined $qglobals{pop_pod_elder_fuirstel} || !defined $qglobals{pop_pon_construct} || !defined $qglobals{pop_pon_hedge_jezith} || !defined $qglobals{pop_ponb_terris} || !defined $qglobals{pop_ponb_poxbourne} || !defined $qglobals{pop_cod_preflag} || !defined $qglobals{pop_cod_bertox} || !defined $qglobals{pop_cod_final})) {



	$client->Message(4,"To access the Plane of Torment, one must first defeat Terris Thule, Bertox, and all of the flags below them.  I am unable to find all of the required flags to allow you access to this plane currently.  Please check what you currently posess by using [unlock memories]");



	}



if($text=~/Access to Torment/i && defined $qglobals{pop_pod_alder_fuirstel} && defined $qglobals{pop_pod_grimmus_planar_projection} && defined $qglobals{pop_pod_elder_fuirstel} && defined $qglobals{pop_pon_construct} && defined $qglobals{pop_pon_hedge_jezith} && defined $qglobals{pop_ponb_terris} && defined $qglobals{pop_ponb_poxbourne} && defined $qglobals{pop_cod_preflag} && defined $qglobals{pop_cod_bertox} && defined $qglobals{pop_cod_final}) {



	$client->Message(4,"You have fufilled the requirements for the Plane of Torment! Converse with the Projection by saying [I will defeat Saryrn]");

			

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