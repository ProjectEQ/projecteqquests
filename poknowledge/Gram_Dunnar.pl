# items: 35001, 35007, 35016, 35009, 35003, 35004, 35015, 35005, 35008, 35006, 35002, 35010, 35014, 35013, 35011, 35012



sub EVENT_SAY
{
	if($text=~/Hail/i && $ulevel < 51){
		quest::emote("The old dwarf glances at you briefly, then returns his attention to a small wooden object he is carving. 'Got no time for kids like you,' he grunts.");
	}
	
	elsif($text=~/Hail/i){
		quest::say("The old dwarf looks up at you slowly, his wrinkled hands continuing to carve a small wooden object. He grins as he eyes your dust-covered outfit and well-used equipment. 'Ahh, a young adventurer,' he says. 'Warms my heart to see the spirit I once had still going strong. Got too old, you see. He strokes his beard. 'Tried taking up a [craft], but it just isn't the same. Sure would be nice to hear some [stories] about those new places I'll never get to see.");
	}
	elsif($text=~/craft/i && $ulevel > 50){
		quest::emote("Gram Dunnar stops carving and holds up the object between his short fingers. It is a figurine of a swordsman with many intricate details. 'No one really wants to buy them, these days. If there's no magic in it...' he shrugs. 'Still, something to take up some time.' He rummages through some finished pieces on the floor around him, picks up one, and tosses it to you. 'Here,' he says. 'Maybe it'll bring you some luck.");
		if ($class eq 'Warrior') { quest::summonitem(35001); }
		elsif ($class eq 'Monk') { quest::summonitem(35007); }
		elsif ($class eq 'Berserker') { quest::summonitem(35016); }
		elsif ($class eq 'Rogue') { quest::summonitem(35009); }       
		elsif ($class eq 'Paladin') { quest::summonitem(35003); }
		elsif ($class eq 'Ranger') { quest::summonitem(35004); }
		elsif ($class eq 'Beastlord') { quest::summonitem(35015); }
		elsif ($class eq 'Shadowknight') { quest::summonitem(35005); }
		elsif ($class eq 'Bard') { quest::summonitem(35008); }
		elsif ($class eq 'Druid') { quest::summonitem(35006); }
		elsif ($class eq 'Cleric') { quest::summonitem(35002); }
		elsif ($class eq 'Shaman') { quest::summonitem(35010); }
		elsif ($class eq 'Enchanter') { quest::summonitem(35014); }
		elsif ($class eq 'Magician') { quest::summonitem(35013); }
		elsif ($class eq 'Necromancer') { quest::summonitem(35011); }
                elsif ($class eq 'Wizard') { quest::summonitem(35012); }
	}
	elsif($text=~/stories/i && $ulevel > 50 && defined $qglobals{pop_story} && $qglobals{pop_story} == 1){
		if(!defined $qglobals{pop_aa_codecay} && defined $qglobals{pop_pod_alder_fuirstel} &&  defined $qglobals{pop_pod_grimmus_planar_projection} &&  defined $qglobals{pop_pod_elder_fuirstel}) {
				$client->Message(4,"Gram Dunnar shudders as you tell him of the Crypt of Decay. 'A foul place, indeed. I would have loved to slay a few of those creatures, though.' His hand clenches and his eyes look past you. 'Ah, the battles I used to have,' he mutters.");
				$client->AddAAPoints(1);
				$client->Message(0,"You've earned an AA point!");
				quest::setglobal("pop_aa_codecay", 1, 5, "F");
				quest::setglobal("pop_story", 2, 5, "S20");
	}		
		else {
			$client->Message(1,"Please tell me another story!");
			quest::setglobal("pop_story", 2, 5, "S20");
		}
	}	
	elsif($text=~/stories/i && $ulevel > 50 && defined $qglobals{pop_story} && $qglobals{pop_story} == 2){
		if(!defined $qglobals{pop_aa_tactics} && defined $qglobals{pop_poi_behometh_preflag} &&  defined $qglobals{pop_poi_behometh_flag}) {
				$client->Message(4,"Gram Dunnar grins excitedly at your description of the Plane of Tactics. 'I'd show the minions of Rallos Zek something, I would!' he exclaims, swinging his hands around as though wielding an axe. He sits down again and looks sadly at his aged hands.");
				$client->AddAAPoints(1);
				$client->Message(0,"You've earned an AA point!");
				quest::setglobal("pop_aa_tactics", 1, 5, "F");
				quest::setglobal("pop_story", 3, 5, "S20");
		}		
		else {
			$client->Message(1,"Please tell me another story!");
			quest::setglobal("pop_story", 3, 5, "S20");
		}
	}
	elsif($text=~/stories/i && $ulevel > 50 && defined $qglobals{pop_story} && $qglobals{pop_story} == 3){
		if(!defined $qglobals{pop_aa_hohonor} && defined $qglobals{pop_poj_mavuin} &&  defined $qglobals{pop_poj_tribunal} &&  defined $qglobals{pop_poj_valor_storms} &&  defined $qglobals{pop_pov_aerin_dar}) {
				$client->Message(4,"'Animated suits of armor, eh?' Gram says as you tell him of the Halls of Honor. 'Saw something like that once, but never so many as that.' His eyes get a faraway look. 'If I only I still had my youth.'");
				$client->AddAAPoints(1);
				$client->Message(0,"You've earned an AA point!");
				quest::setglobal("pop_aa_hohonor", 1, 5, "F");
				quest::setglobal("pop_story", 4, 5, "S20");
		}		
		else {
			$client->Message(1,"Please tell me another story!");
			quest::setglobal("pop_story", 4, 5, "S20");
		}
	}
	elsif($text=~/stories/i && $ulevel > 50 && defined $qglobals{pop_story} && $qglobals{pop_story} == 4){	
		if(!defined $qglobals{pop_aa_bothunder} && defined $qglobals{pop_poj_mavuin} &&  defined $qglobals{pop_poj_tribunal} &&  defined $qglobals{pop_poj_valor_storms} &&  defined $qglobals{pop_pos_askr_the_lost} && $qglobals{pop_pos_askr_the_lost} == 3 &&  defined $qglobals{pop_pos_askr_the_lost_final}) {
				$client->Message(4,"'Giants and a huge fortress,' Gram sighs wistfully as you finish your story of the Bastion of Thunder. 'Storming through a place like that, killing everything in sight - those were good days.'");
				$client->AddAAPoints(1);
				$client->Message(0,"You've earned an AA point!");
				quest::setglobal("pop_aa_bothunder", 1, 5, "F");
				quest::setglobal("pop_story", 5, 5, "S20");
		}
		else {
			$client->Message(1,"Please tell me another story!");
			quest::setglobal("pop_story", 5, 5, "S20");
		}	
	}
	elsif($text=~/stories/i && $ulevel > 50 && defined $qglobals{pop_story} && $qglobals{pop_story} == 5){
		if(!defined $qglobals{pop_aa_potorment} && defined $qglobals{pop_pod_alder_fuirstel} &&  defined $qglobals{pop_pod_grimmus_planar_projection} &&  defined $qglobals{pop_pod_elder_fuirstel} &&  defined $qglobals{pop_pon_construct} &&  defined $qglobals{pop_pon_hedge_jezith} &&  defined $qglobals{pop_ponb_terris} &&  defined $qglobals{pop_ponb_poxbourne} &&  defined $qglobals{pop_cod_preflag} &&  defined $qglobals{pop_cod_bertox} &&  defined $qglobals{pop_cod_final}) {
				$client->Message(4,"Gram Dunnar listens attentively to your story of the Plane of Torment. 'Ravens with bloody eyes,' he muses, 'and creatures with four mouths?' He shakes his head. 'Never in my day did I see such things.'");
				$client->AddAAPoints(1);
				$client->Message(0,"You've earned an AA point!");
				quest::setglobal("pop_aa_potorment", 1, 5, "F");
				quest::setglobal("pop_story", 6, 5, "S20");
		}		
		else {
			$client->Message(1,"Please tell me another story!");
			quest::setglobal("pop_story", 6, 5, "S20");
		}	
	}
	elsif($text=~/stories/i && $ulevel > 50 && defined $qglobals{pop_story} && $qglobals{pop_story} == 6){	
		if(!defined $qglobals{pop_aa_solrotower} && defined $qglobals{pop_poi_behometh_preflag} &&  defined $qglobals{pop_poi_behometh_flag} &&  defined $qglobals{pop_tactics_tallon} &&  defined $qglobals{pop_tactics_vallon} &&  defined $qglobals{pop_pot_saryrn_final} &&  defined $qglobals{pop_pot_saryrn} &&  defined $qglobals{pop_hohb_marr}) {
				$client->Message(4,"Gram Dunnar strokes his beard thoughtfully as you tell him of the Tower of Solusek Ro. 'The burning prince himself. A worthy opponent, I'm sure,' he says. 'Thank you for the tales, $name. It's good to imagine these places, even if I may never see them.'");
				$client->AddAAPoints(1);
				$client->Message(0,"You've earned an AA point!");
				quest::setglobal("pop_aa_solrotower", 1, 5, "F");
				quest::delglobal("pop_story");
		}	
		else {
			$client->Message(1,"I've already heard all of those stories!");
			quest::delglobal("pop_story");
		}	
	}
       elsif($text=~/stories/i && $ulevel > 50){
		if(!defined $qglobals{pop_aa_stormvalor} && defined $qglobals{pop_poj_mavuin} && defined $qglobals{pop_poj_tribunal} && defined $qglobals{pop_poj_valor_storms}) {
				$client->Message(4,"Gram Dunnar listens eagerly to your tales of the Plane of Valor and Plane of Storms. 'Everything turned to glass by the dragon! That must be a sight,' he exclaims. 'Wish I could go there,' he sighs.");
				$client->AddAAPoints(1);
				$client->Message(0,"You've earned an AA point!");
				quest::setglobal("pop_aa_stormvalor", 1, 5, "F");
				quest::setglobal("pop_story", 1, 5, "S20");
		}		
		else {
			$client->Message(1,"Please tell me another story!");
			quest::setglobal("pop_story", 1, 5, "S20");
		}
	}
        else {
             quest::emote("The old dwarf glances at you briefly, then returns his attention to a small wooden object he is carving. 'Got no time for kids like you,' he grunts.");
	}

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
	$qglobals{pop_aa_stormvalor}=undef;
	$qglobals{pop_aa_codecay}=undef;
	$qglobals{pop_aa_tactics}=undef;
	$qglobals{pop_aa_hohonor}=undef;
	$qglobals{pop_aa_bothunder}=undef;
	$qglobals{pop_aa_potorment}=undef;
	$qglobals{pop_aa_solrotower}=undef;
	$qglobals{pop_story}=undef;
}