sub EVENT_SAY {

	if(defined $qglobals{pop_poj_valor_storms}) { 
		
		if($text=~/Hail/i){
			quest::emote("looks up at you, and when he does, you take note of the scraggly beard on his weather-worn face; the scent of ale permeates your senses and pushes you to look away slightly. In an apparent drunken stupor, Askr begins to speak with surprising clarity. 'Here to wash the windows and clean the flooring, are you? No? Well, you can't be much help then. And the likes of you obviously wouldn't be able to get rid of the massive problem we're having. Bah, says I. You can help me no more than any of these other vagrants. Leave me alone to my ale and my misery.'");
		}

		if($text=~/what problem/i){
			quest::say("Askr points drunkenly towards the exit of the cave. 'Have you not seen the foul denizens of destruction outside? Hrmph! Going everywhere they please, pillaging, plundering. . . I'm lucky to have survived this long. Bah, it doesn't matter, there's nothing that anyone can do to stop them, and that is why I'm still stuck here with my *hic* potions.'");
		}

		if(defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 2 && $text=~/continue/i){
			quest::say("I must know if you are truly capable of defeating the storm giants that abound here. To do this, you must slay one of each of the three factions and return to me something specific to each tribe: from the Srerendi storm giants, return their shorn beard; from the Krendic storm giants, a piece of their rocky carcass; from the Kelek`Vor storm giants, the crest from their warrior garments. These three items will ensure that you indeed do have the ability to defeat the foul denizens that have seized control of these lands. When you have acquired the three of these items, seal them in this bag and return them to me, so that I know that you are indeed capable of fulfilling a hero's destiny.");
			quest::summonitem(17192);	#Askr's bag of verity
		}		

		if(defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 1){	#checks for giant head handin
		
			if($text=~/It was me/i){
				quest::say("Truly, I am amazed that someone of your caliber was able to do what I could not. I have been stuck in these desolate caves for so long, I had almost lost hope that I would ever find a way to get rid of those accursed giants. But you. . . you have been able to best at least one of them. It is reasonable to suggest that if you are able to dispatch one, you may be able to dispatch others. I need to know for sure if you are as capable an individual as it appears you are. This is very important, so are you paying attention?");
			}
			
			if($text=~/I am paying attention/i){
				quest::say("This place was once beautiful and serene, with the great Karana's showers falling day and night soothing the lands and the creatures that inhabit it. Alas, there was an invasion of a superior force -- the storm giants which you have encountered. They laid waste to the lands, burned down trees, and have caused so much havoc I don't even know what is to become of it. Originally, they came as one group and crossed the breadth of the land pillaging and plundering all that they could find. Over time, though, they grew apart and distinct factions grew around Mount Grenidor.' [" . quest::saylink("continue") . "]");
			}

			if($text=~/continue/i){
				quest::say("To the south of Grenidor lay Srerendi, Shores of the Lost and the Srerendi storm giants. Born of the ocean and the cool air, they lay claim to the shores and the plains inland as their own. To the west of Grenidor lay Krendic, Sands of Chaos and the Krendic storm giants. They have skin that is thick as dirt and blend in well with their surroundings. To the north of the great mount lay Kelek`Vor, the Forest of Tears and the Kelek`Vor storm giants. They are born of the wood and take great pleasure in seeing it used to their own purposes.' [" . quest::saylink("continue") . "]");
				quest::setglobal("pop_pos_askr_the_lost", 2, 5, "F");	#used to differentiate between the two [continue] statements
			}
		}
		

		if(defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 3 && $text=~/Bastion of Thunder/i){
			quest::say("To be honest, I cannot say that it is entirely possible, what with the ferocity of the giants and their reluctance to leave the lands they now inhabit. From what I do know, each of the Leaders of each tribe has one piece to allow entrance into the Bastion of Thunder. When two of these pieces are combined, they form an esoteric medallion that allows instant passage to the thunderous plains beyond. If you can find and seal two pieces of the medallion in this bag, I will be able to forge them into the medallion that will help you on your journey.");
			quest::summonitem(17192);
		}
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

sub EVENT_ITEM {

	if(defined $qglobals{pop_poj_valor_storms} && $qglobals{pop_poj_valor_storms} == 1) {

		if(!defined $qglobals{pop_pos_askr_the_lost} && (plugin::check_handin(\%itemcount, 11486 => 1) || plugin::check_handin(\%itemcount,28749 => 1) || plugin::check_handin(\%itemcount,28781 => 1) || plugin::check_handin(\%itemcount,28782 => 1))){	#check for any of the 4 storm giant heads in the database
			quest::say("The drunken stupor that Askr had been in earlier appears to vanish in an instant; a glimmer of hope now flashes in the depths of his eyes. 'This is the head of a giant. . . a storm giant from outside the caves.' Askr ponders what this revelation could mean. He mutters to himself, 'If it is possible that someone has indeed bested a giant here in the planes, then perhaps it is possible. . .' He looks back at you very sternly and asks, 'Tell me now and be truthful, was it you who severed the head of this giant from his body?'");
			
			quest::setglobal("pop_pos_askr_the_lost", 1, 5, "F");
#handed in giant head
		} 
		
		if(defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 3 && plugin::check_handin(\%itemcount, 11488 => 1)){
			quest::emote("The mystical medallion given to you by Askr settles around your neck and then disappears into nothingness. There is no call for alarm, for the medallion is now a part of your soul. Askr the Lost says 'You have retrieved the pieces! You are well on your way to pushing forth on your quest to return balance to the plains of thunder. The most difficult part lies before you. . . deep in the heart of Mount Grenidor, there is a tempest that rages on eternally. It is there that you must present your medallion to the skies above to be transported to the citadel of thunderous might. Take the medallion and go forth, then deliver these storm giants to their creator!'");		
			quest::setglobal("pop_pos_askr_the_lost_final", 1, 5, "F");	#flagged for Bastion of Thunder
			$client->Message(2, "You recieve a character flag!");	
		}		

		if(defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 2 && plugin::check_handin(\%itemcount, 11487 => 1)){
			quest::emote("looks over the remnants of the storm giants in his hands then looks up at you with a glimmer of hope in his eyes. 'Then it's true! You have the means to push back the scourge of giants. . . you must go forth to the Bastion of Thunder and finish there what you have started here. It is imperative that you clear the forces of giants from the Bastion so that order can be restored to the thunderous reaches beyond.'");
			quest::setglobal("pop_pos_askr_the_lost", 3, 5, "F");	#handed in sealed back of verity		
		} 
		 
	}	
	else {
    plugin::return_items(\%itemcount);
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

#END of FILE  Zone:postorms  ID: 209046  -- Askr_the_Lost