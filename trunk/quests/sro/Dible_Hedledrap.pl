#Dible_Hedledrap.pl
#Augmentation Refund
#Yes, this was a beast.  -Kilelen

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("puffs up his chest and lifts his chin with hearty arrogance.");
		quest::say("Greetings, $name. It seems some of the strange minerals the Wayfarers Brotherhood sold have broken or stopped working as they should. Luckily, I alone have been tasked by Morden Rasp to exchange a Broken Chunk of Coal, a Cracked Ruby, a Charred Pebble, or any other pieces that don't work properly. I need to examine it first, though. Let me see what you've got!");
	}
}

sub EVENT_ITEM {

	if(plugin::check_handin(\%itemcount, 42259 => 1)){# Radiant Slimestone of Retribution 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1450, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42238 => 1)){# Pristine Prism of Lucidity 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1450, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42244 => 1)){# Marble Sphere of Conservation 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1450, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42233 => 1)){# Cold Slimestone of Fury 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1450, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42204 => 1)){# Radiant Marble Sphere of Ire 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42186 => 1)){# Smokey Quartz of Peculiarity 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42178 => 1)){# Mangled Slimestone 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42161 => 1)){# Magnetite Prism of Stoutness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42207 => 1)){# Ooze-Covered Pebble of Perfection 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42170 => 1)){# Pristine Limestone of Hatred 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42182 => 1)){# Glowing Prism of Brawling 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42209 => 1)){# Radiant Ruby of Understanding 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42153 => 1)){# Slimestone Fragment of Dread 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42145 => 1)){# Limestone Shard of Battle Cries 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42199 => 1)){# Radiant Fragment of Dread 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42136 => 1)){# Greenish Magnetite of Immunity 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42132 => 1)){# Yellowish Magnetite of Vitality 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42234 => 1)){# Cracked Slimestone of Combat 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42157 => 1)){# Magnetite Shard of Stalwartness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42223 => 1)){# Polished Ore of Power 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(663, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42120 => 1)){# Alluring Limestone of Thrift 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42107 => 1)){# Magnetite Fragment of Fortitude 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42128 => 1)){# Slimestone Fragment of Shock 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42196 => 1)){# Radiant Slimestone of Shock 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42111 => 1)){# Gray Magnetite of Ingenuity 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42250 => 1)){# Slippery Slimestone of Endurance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42256 => 1)){# Radiant Slate of Health 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42103 => 1)){# Slimestone Fragment of Ruin 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42217 => 1)){# Peerless Crystal of Enticement 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(357, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42218 => 1)){# Peerless Pearl of Magical Warding 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(357, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42211 => 1)){# Peerless Shard of Might 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(357, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42095 => 1)){# Limestone of Suffocation 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42082 => 1)){# Quartz Shard of Force 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42086 => 1)){# Cold Quartz of Resilience 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42078 => 1)){# Venom-Coated Slimestone 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 1);
		}
		
	elsif(plugin::check_handin(\%itemcount, 42057 => 1)){#Robust Blue-Flecked Quartz Shard
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42061 => 1)){# Uneven Quartz of Sturdiness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42070 => 1)){# Scarred Limestone of Vengeance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42049 => 1)){# Spore-Covered Pebble of Warding 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42053 => 1)){# Cracked Slimestone of Guarding 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42036 => 1)){# Green Microcline Shard of Health 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42045 => 1)){# Cracked Limestone of Aggression 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42028 => 1)){# Poison-Covered Slimestone 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(100, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42032 => 1)){# Yellow Microcline Shard of Vigor 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(100, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42020 => 1)){# Broken Limestone of Focus 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(60, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42011 => 1)){# Microcline Shard of Quickness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(40, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42007 => 1)){# Microcline Shard of Knowledge 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(30, 1);
		}

	elsif(plugin::check_handin(\%itemcount, 42003 => 1)){# Cold Slimestone Fragment 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(20, 1);
		}


	elsif(plugin::check_handin(\%itemcount, 42208 => 1)){# Radiant Coal of Prowess 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42183 => 1)){# Permafrost Chunk of Marring 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42179 => 1)){# Marble Sphere of Ire 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42252 => 1)){# Radiant Diamond of Assault 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42229 => 1)){# Gleaming Prism of Destruction 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42235 => 1)){# Icy Diamond of Assault 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42201 => 1)){# Radiant Emerald of Protection 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42187 => 1)){# Tundra Ice of Improvement 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42175 => 1)){# Eternal Ice Prism of Sense 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42166 => 1)){# Polar Ice of Virtue 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42162 => 1)){# Glacial Ice of Toughness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42242 => 1)){#Icy Shard of Resonance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(960, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42133 => 1)){# Flattened Permafrost 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42237 => 1)){# Transparent Shard of Thought 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42137 => 1)){# Distilled Ice of Insight 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42141 => 1)){# Arctic Ice Shard of Keenness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42158 => 1)){# Radiant Permafrost 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42150 => 1)){#Icy Prism of Avoidance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42254 => 1)){# Radiant Shard of Thought 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42224 => 1)){# Obsidian Fragment of Durability 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(663, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42129 => 1)){# Marble Sphere of Disgust 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42195 => 1)){# Radiant Black Diamond 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42125 => 1)){# Brilliant Enchanted Prism 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42104 => 1)){# Smooth Marble Sphere of Prowess 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42108 => 1)){# Grainy Permafrost of Maiming 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42112 => 1)){# Icy Shard of Illness Protection 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42116 => 1)){# Frigid Shard of Acuteness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42219 => 1)){# Peerless Ruby of Fiery Warding 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(357, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42212 => 1)){# Peerless Jewel of Nimbleness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(357, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42100 => 1)){# Eternal Ice of Replenishment 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42091 => 1)){# Heated Shard of Protection 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42087 => 1)){# Frigid Shard of Cleverness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42083 => 1)){# Jagged Permafrost Chunk 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42191 => 1)){# Radiant Permafrost Chunk 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42066 => 1)){# Cracked Icy Shard of Research 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42058 => 1)){# Lethal Permafrost Chunk 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42062 => 1)){# Crushed Frozen Shard of Brilliance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42075 => 1)){# Eternal Ice of Reconstruction 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42037 => 1)){# Black Diamond of Advantage 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42054 => 1)){# Jagged Marble Sphere of Protection 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42050 => 1)){# Eternal Ice of Avoidance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42041 => 1)){# Black Diamond of Knowledge 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42033 => 1)){# Glowing Permafrost 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(100, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42025 => 1)){# Crushed Ice Fragment of Visions 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(100, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42016 => 1)){# Icy Bone Chip of the Elements 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(60, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42012 => 1)){# Black Diamond of Deception 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(40, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42008 => 1)){# Permafrost Chunk of Resilience 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(30, 2);
		}

	elsif(plugin::check_handin(\%itemcount, 42236 => 1)){# Onyx Orb of Aggression 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1450, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42245 => 1)){# Jagged Gravestone of Affliction 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1450, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42255 => 1)){# Radiant Prism of Lucidity 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1450, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42190 => 1)){# Gravestone Fragment of Battle Mastery 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42181 => 1)){# Crypt Stone of Resilience 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42173 => 1)){# Black Diamond of Regeneration 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42241 => 1)){# Gleaming Ore of Dark Healing 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42165 => 1)){# Gravestone Fragment of Flailing Dead 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42206 => 1)){# Blood Ruby of Understanding 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42203 => 1)){# Radiant Diamond of Regeneration 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42177 => 1)){# Bloodied Soil of Wit 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42131 => 1)){# Fetid Soil of Hardiness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42156 => 1)){# Gory Crypt Stone of Strength 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42251 => 1)){# Radiant Ore of Combat 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42148 => 1)){# Black Diamond of Absorption 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42152 => 1)){# Noxious Soil of Stability 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42140 => 1)){# Bloodied Gravestone of Cunning 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42225 => 1)){# Ruby Sphere of Intellect 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(663, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42228 => 1)){# Hardened Slate of Protection 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(663, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42248 => 1)){# Chilling Orb of Dark Sight 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42115 => 1)){# Dusty Gravestone of Destruction 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42106 => 1)){# Tainted Soil of Battle Stance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42231 => 1)){# Gravestone of Aggression 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42123 => 1)){# Blessed Black Diamond 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42119 => 1)){# Brilliant Blood Ruby of Prowess 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42127 => 1)){# Eroded Soil of Tenacity 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42102 => 1)){# Rotted Soil of Avoidance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42262 => 1)){# Radiant Gravestone of Endurance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42197 => 1)){# Radiant Sphere of Disgust 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42220 => 1)){# Peerless Diamond of Chilling Protection 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(357, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42213 => 1)){# Peerless Gem of Deftness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(357, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42098 => 1)){# Rejuvenating Bone Fragment 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42193 => 1)){#Radiant Diamond Shard 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42077 => 1)){# Thick Soil of Vitality 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42090 => 1)){# Night Agent Gravestone Fragment 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42081 => 1)){# Putrid Soil of Essence 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42056 => 1)){# Crypt Stone of Mind Enhancement 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42065 => 1)){# Gravestone of Dire Melodies 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42073 => 1)){# Black Diamond of Crippling 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42044 => 1)){#Plain Blood Ruby of Defense 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42040 => 1)){#Worn Gravestone of Awareness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42052 => 1)){#Corroded Crypt Stone of Protection 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42048 => 1)){# Glowing Black Diamond 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42031 => 1)){# Burning Crypt Stone Fragment 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(100, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42023 => 1)){# Black Diamond of Preservation 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(100, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42027 => 1)){# Broken Crypt Stone of Fortitude 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(100, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42015 => 1)){#Crumbled Gravestone of Renewal 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(40, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42006 => 1)){#Crumbling Crypt Stone of Power 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(30, 3);
		}

	elsif(plugin::check_handin(\%itemcount, 42002 => 1)){# Crushed Crypt Stone of Genius 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(20, 3);
		}


	elsif(plugin::check_handin(\%itemcount, 42247 => 1)){# Blackened Ore of Retribution 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1450, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42172 => 1)){# Glowing Crystal of Endowments 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42205 => 1)){# Solid Coal of Prowess 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42168 => 1)){# Gold-Flecked Crystal of Negation 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42176 => 1)){# Crystal Prism of Perception 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42230 => 1)){# Bloodied Ore of Vengeance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42185 => 1)){# Glowing Ore of Rapid Thought 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42243 => 1)){#Refined Ore of Harmonies 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(960, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42257 => 1)){# Radiant Chunk of Warmth 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42200 => 1)){# Radiant Mass of Affliction 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42143 => 1)){# Preserved Pyrite Crystal 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42232 => 1)){# Polished Sandstone of Ire 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42135 => 1)){# Translucent Ore of Courage 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42160 => 1)){# Refined Ore of Wellness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42151 => 1)){# Adamantine Orb of Intensity 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42147 => 1)){# Bastnasite Fragment of Might 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42226 => 1)){# Tainted Shard of Ingenuity 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(663, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42239 => 1)){# Crushed Slate of Health 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42110 => 1)){# Slippery Ore of Velocity 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42122 => 1)){# Obsidian Orb of Endurance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42126 => 1)){# Feldspar Fragment of Tolerance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42114 => 1)){# Brittle Coal of Prowess 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42118 => 1)){# Silver-Flecked Crystal of Agony 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42261 => 1)){# Radiant Prism of Perception 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42101 => 1)){# Sparkling Sphere of Resistance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42221 => 1)){# Peerless Opal of Illness Warding 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(357, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42214 => 1)){# Peerless Sphere of Fortitude 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(357, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42093 => 1)){# Freezing Nickel Fragment 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42085 => 1)){# Jagged Ore of Foresight 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42192 => 1)){# Radiant Crystal of Affliction 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42076 => 1)){# Cylindrical Shard of Acuity 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42097 => 1)){# Raw Quartz Crystal of Peculiarity 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42068 => 1)){# Cobalt Crystal of Affliction 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42072 => 1)){# Sharp Crystal of Learning 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42060 => 1)){# Diffused Ore of Rapidity 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42047 => 1)){# Opaque Crystal of Deftness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42039 => 1)){# Loose Coal of Guarding 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42051 => 1)){# Notched Shard of Lost Spirits 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42043 => 1)){# Blazing Flecked Crystal 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42026 => 1)){# Limonite Orb of Attack 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(100, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42022 => 1)){# Prismatic Crystal of Intellect 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(100, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42035 => 1)){# Refined Ore of Regeneration 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(100, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42022 => 1)){# Prismatic Crystal of Intellect 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(84, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42018 => 1)){# Burning Flake of Pyrite 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(60, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42010 => 1)){# Refined Ore of Nimbleness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(30, 4);
		}

	elsif(plugin::check_handin(\%itemcount, 42001 => 1)){#Gypsum Flake of Improvement 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(20, 4);
		}


	elsif(plugin::check_handin(\%itemcount, 42246 => 1)){# Sparkling Ruby of Fortune 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1450, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42253 => 1)){# Radiant Orb of Aggression 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1450, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42202 => 1)){# Radiant Crystal of Negation 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42163 => 1)){# Sparkling Emerald of Protection 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42188 => 1)){# Pristine Emerald of Harm 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42210 => 1)){# Radiant Pebble of Perfection 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42258 => 1)){# Radiant Ore of Dark Healing 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42180 => 1)){# Glowing Sandstone of Focus 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42167 => 1)){# Glowing Sapphire of Courage 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42171 => 1)){# Pristine White Sapphire of Sense 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(1150, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42146 => 1)){# Sapphire Sphere of Havoc 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42240 => 1)){# Etched Sandstone of Warmth 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42155 => 1)){# Gleaming Sandstone of Deflection 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42138 => 1)){# Heated Desert Emerald Fragment 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42142 => 1)){# Sapphire Sphere of Comprehension 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42134 => 1)){# Diamond Prism of Companionship 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(760, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42227 => 1)){# Sparkling Quartz of Resistance 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(663, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42105 => 1)){# Dull Sandstone of Ire 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42113 => 1)){# Sparkling Emerald of Ravaging 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42121 => 1)){# Flawed Sapphire Sphere of War 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42260 => 1)){# Radiant Orb of Dark Sight 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42109 => 1)){# Fractured Diamond Prism of Prowess 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42130 => 1)){# Shiny Sandstone of Reconstruction 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42249 => 1)){# Intricate Prism of Perception 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42117 => 1)){# Raw Sapphire of Proficiency 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42194 => 1)){# Radiant Crystal of Flame 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(510, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42216 => 1)){# Peerless Gemstone of Knowledge 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(357, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42215 => 1)){# Peerless Fragment of Intellect 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(357, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42222 => 1)){# Peerless Emerald of Poison Protection 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(357, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42092 => 1)){# Finely Cut Ruby of Capability 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42096 => 1)){# Warm Ruby of Wellness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42080 => 1)){# Grainy Sandstone of Clarity 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42088 => 1)){# Searing Flawed Emerald Fragment 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(340, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42071 => 1)){# Dusty Ruby Shard of Prowess 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42063 => 1)){# Raw Emerald Shard of Malevolence 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42067 => 1)){# Fractured Ruby Shard of Wellness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(220, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42042 => 1)){# Raw Ruby Shard of the Arcane 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42038 => 1)){# Enhanced Emerald of Destruction 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42046 => 1)){# Flawed Ruby Shard of Victory 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42055 => 1)){# Cracked Sandstone of Health 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(150, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42021 => 1)){# Brittle Ruby Fragment of Brawn 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(100, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42030 => 1)){# Jagged Slate of Battle Prowess 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(100, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42017 => 1)){# Colorless Crystal of Prevention 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(60, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42013 => 1)){# Warm Emerald Shard 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(40, 5);
		}

	elsif(plugin::check_handin(\%itemcount, 42005 => 1)){# Brittle Slate of Keenness 
		quest::emote("takes the item and tosses it into his satchel.");
		quest::say("Very well, $name. Go ahead and find something else you'd like.");
		quest::addldonpoints(20, 5);
		}
		
	else {
		quest::say("I don't need this.");#text made up
		plugin::return_items(\%itemcount);
	}
}
#END of FILE Zone:sro  ID:35055--Dible_Hedledrap.pl