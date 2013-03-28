##Karsor_the_Mad.pl
#Omens of War Spells
#Concerning the behaviour, reports on Alla's say "Deleting the scroll or tome before you scribe it also stillo counts, and further rune turn ins do not recover the deleted tome / scroll",
#Which tells me I should use a global, increment it for each turnin, and not pay attention to what spells a player has scribed.
#Not the most simple quest. -Kilelen

sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		quest::emote("turns toward you with a crazed look in his eyes. 'Hail?. . . All day long I [study] here and all day long the dirty Human says, 'hail.' What do you know of 'hail'?! I know not of 'hail'! You have injured my soul forever!'");
	}
	
	if ($text=~/study/i) {
		quest::emote("glares at you and then falls silent. He stares into the distance for a moment, lost in thought. Without warning, he speaks again. 'Yes. I study [Discord]. Why do you ask?' ");
	}
	
	if ($text=~/discord/i) {
		quest::say("So, you know of Discord then! Excellent!' The dragorn extends his hand. 'I am a student of Yemall the Arcane, a dragorn noble who sought to [understand] the magic of Discord. He was a great teacher . . . until he died, leaving me to carry on the study of Discord alone. Some say the study of Discord has made me insane. Some say, 'Karsor, stop studying Discord! It is making you insane,' but I say to them, 'If I'm insane, then why are my eyes on fire?' Ha ha! That usually puts them in their place, especially when my eyes are, in fact, on fire.");
	}
	
	if ($text=~/understand/i) {
		quest::say("Ahhh, you want to understand too, do you? He he. Well, I've been studying the magic of Discord for ten years! That's a long time. So . . . I . . . understand! If you bring me a Muramite [rune], I can help you understand too.");
	}
	
	if ($text=~/rune/i) {
		quest::say("Hurry! We are running out of time! Time! It is imperative that you bring me a Muramite rune so I can translate it for you! Bring me one . . . bring one now or I will languish for eternity!");
	}
	
	#if ($text=~/mmr/i) {
	#	if(!defined $qglobals{MuramiteMinor}){
	#		quest::say("No global to reset.");
	#	}
	#	else {
	#		quest::delglobal("MuramiteMinor");
	#		quest::say("Muramite Minor Reset.");
	#	}
	#}
	
	#if ($text=~/mlr/i) {
	#	if(!defined $qglobals{MuramiteLesser}){
	#		quest::say("No global to reset.");
	#	}
	#	else {
	#		quest::delglobal("MuramiteLesser");
	#		quest::say("Muramite Minor Reset.");
	#	}
	#}
	
	#if ($text=~/mnr/i) {
	#	if(!defined $qglobals{MuramiteNormal}){
	#		quest::say("No global to reset.");
	#	}
	#	else {
	#		quest::delglobal("MuramiteNormal");
	#		quest::say("Muramite Normal Reset.");
	#	}
	#}
	
	#if ($text=~/mgr/i) {
	#	if(!defined $qglobals{MuramiteGreater}){
	#		quest::say("No global to reset.");
	#	}
	#	else {
	#		quest::delglobal("MuramiteGreater");
	#		quest::say("Muramite Greater Reset.");
	#	}
	#}
	
	#if ($text=~/mglr/i) {
	#	if(!defined $qglobals{MuramiteGlowing}){
	#		quest::say("No global to reset.");
	#	}
	#	else {
	#		quest::delglobal("MuramiteGlowing");
	#		quest::say("Muramite Glowing Reset.");
	#	}
	#}
	
	#if ($text=~/mar/i) {
	#	if(!defined $qglobals{MuramiteAncient}){
	#		quest::say("No global to reset.");
	#	}
	#	else {
	#		quest::delglobal("MuramiteAncient");
	#		quest::say("Muramite Ancient Reset.");
	#	}
	#}
}

sub EVENT_ITEM
{
	if(plugin::check_handin(\%itemcount, 59983 => 1)) {#Minor Muramite Rune
		# If the global isn't defined for us, do so and set it at once, else increment it by one
		if(!defined $qglobals{MuramiteMinor}){
			quest::setglobal("MuramiteMinor", 1, 5, "F");
			quest::say("MuramiteMinor should be 1 now.");
		}
		else {
			my $x = $qglobals{MuramiteMinor};
			$x++;
			quest::setglobal("MuramiteMinor", $x, 5, "F");
		}
		quest::say("global at $qglobals{MuramiteMinor}");
		#Check my class, load what spells my class is eligible for.
		LoadSSet("minor");
		
		#Number of spells in this progression
		$count = @spell_choices;
		#If we don't have this spell yet, give it to us.  Otherwise have a hissy and return the rune.
		#Special case for magicians turning in their first minor rune, they get a crapload of spells, not just one.
		if (($class eq "Magician") && ($qglobals{MuramiteMinor} == 0)) {
			#Summon Calliav's Glowing Bauble, Summon Calliav's Jeweled Bracelet, Summon Calliav's Platinum Choker, Summon Calliav's Runed Mantle, Summon Calliav's Spiked Ring, Summon Calliav's Steel Bracelet
			quest::say("Hmm, a bit of magic you have discovered! I'll write the meaning of this rune onto a parchment for you. Don't show anyone else. They wouldn't understand!");
			quest::summonitem(77206);
			quest::summonitem(77204);
			quest::summonitem(77211);
			quest::summonitem(77200);
			quest::summonitem(77205);
			quest::summonitem(77207);
		}
		
		elsif (!($qglobals{MuramiteMinor} >= $count) && !(@spell_choices[$qglobals{MuramiteMinor}] eq "none")) {
			quest::say("Hmm, a bit of magic you have discovered! I'll write the meaning of this rune onto a parchment for you. Don't show anyone else. They wouldn't understand!");
			quest::summonitem(@spell_choices[$qglobals{MuramiteMinor}]);
		}
		
		else {
			quest::emote("throws the rune back at you. 'What is this! We've been over this rune already! My soul burns with fury and you are stoking the embers!'");
			#We don't want this global to keep growing everytime someone tries to turn in a rune when they've completed the spell progression.
			#If the spell progression is complete, set the global to just one more than the number of spells in the progression.
			$count++;
			quest::setglobal("MuramiteMinor", $count, 5, "F");
			quest::summonitem(59983);#Give the rune back.  For whatever reason plugin::return_items is not working here.
		}
	}
	
	elsif(plugin::check_handin(\%itemcount, 59984 => 1)) {#Lesser Muramite Rune
		# If the global isn't defined for us, do so and set it at once, else increment it by one
		if(!defined $qglobals{MuramiteLesser}){
			quest::setglobal("MuramiteLesser", 1, 5, "F");
		}
		else {
			my $x = $qglobals{MuramiteLesser};
			$x++;
			quest::setglobal("MuramiteLesser", $x, 5, "F");
		}
		
		#Check my class, load what spells my class is eligible for.
		LoadSSet("lesser");
		
		#Number of spells in this progression
		$count = @spell_choices;
		
		if (!($qglobals{MuramiteLesser} >= $count) && !(@spell_choices[$qglobals{MuramiteLesser}] eq "none")) {
			quest::emote("begins translating the rune. He mutters to himself while furiously scribbling on a parchment. When he's done, he hands you the parchment and turns his head quizzically, 'When did you get here?' ");
			quest::summonitem(@spell_choices[$qglobals{MuramiteLesser}]);
		}
		
		else {
			quest::emote("throws the rune back at you. 'What is this! We've been over this rune already! My soul burns with fury and you are stoking the embers!'");
			#We don't want this global to keep growing everytime someone tries to turn in a rune when they've completed the spell progression.
			#If the spell progression is complete, set the global to just one more than the number of spells in the progression.
			$count++;
			quest::setglobal("MuramiteLesser", $count, 5, "F");
			quest::summonitem(59984);
		}
	}
	
	elsif(plugin::check_handin(\%itemcount, 59985 => 1)) {#Muramite Rune
		# If the global isn't defined for us, do so and set it at once, else increment it by one
		if(!defined $qglobals{MuramiteNormal}){
			quest::setglobal("MuramiteNormal", 1, 5, "F");
		}
		else {
			my $x = $qglobals{MuramiteNormal};
			$x++;
			quest::setglobal("MuramiteNormal", $x, 5, "F");
		}
		
		#Check my class, load what spells my class is eligible for.
		LoadSSet("normal");
		
		#Number of spells in this progression
		$count = @spell_choices;
		
		if (!($qglobals{MuramiteNormal} >= $count) && !(@spell_choices[$qglobals{MuramiteNormal}] eq "none")) {
			quest::say("Quite a find, for a filthy Human! Yes, indeed! Quite a find! Give me a moment while I decipher this rune. Do not disturb me. Do not!");
			quest::emote("furiously scribbles on a piece of parchment. He looks back and forth from the rune to the parchment, wiping sweat from the scales on his brow, muttering to himself. When he's finished, he hands you a parchment. The arcane text is written in a circle that spirals toward the center of the scroll. 'Sorry,' he shrugs. 'That's the only way it could possibly make sense.");
			quest::summonitem(@spell_choices[$qglobals{MuramiteNormal}]);
		}
		
		else {
			quest::emote("throws the rune back at you. 'What is this! We've been over this rune already! My soul burns with fury and you are stoking the embers!'");
			#We don't want this global to keep growing everytime someone tries to turn in a rune when they've completed the spell progression.
			#If the spell progression is complete, set the global to just one more than the number of spells in the progression.
			$count++;
			quest::setglobal("MuramiteNormal", $count, 5, "F");
			quest::summonitem(59985);
		}
	}
	
	elsif(plugin::check_handin(\%itemcount, 59986 => 1)) {#Greater Muramite Rune
		# If the global isn't defined for us, do so and set it at once, else increment it by one
		if(!defined $qglobals{MuramiteGreater}){
			quest::setglobal("MuramiteGreater", 1, 5, "F");
		}
		else {
			my $x = $qglobals{MuramiteGreater};
			$x++;
			quest::setglobal("MuramiteGreater", $x, 5, "F");
		}
		
		#Check my class, load what spells my class is eligible for.
		LoadSSet("greater");
		
		#Number of spells in this progression
		$count = @spell_choices;
		
		if (!($qglobals{MuramiteGreater} >= $count) && !(@spell_choices[$qglobals{MuramiteGreater}] eq "none")) {
			#Like magicians in with the minor first turn in, shammies have a special case here.
			#They're supposed to get Spell: Balance of Discord after any greater turn in, assuming they don't have it yet.
			#Don't see a way to check and see if a spell is scribed, so just giving a copy upon any greater turn in, regardless.
			if ($class eq "Shaman") {
				quest::summonitem(77302);#Balance of Discord
			}
			quest::say("The filthy little $race has brought me a rune! How thoughtful! In return I shall translate its magic for you. You must keep this secret though! Mata Muram has spies everywhere.");
			quest::emote("surreptitiously points to his own shadow and leans in close, nodding gravely.");
			quest::summonitem(@spell_choices[$qglobals{MuramiteGreater}]);
		}
		
		else {
			quest::emote("throws the rune back at you. 'What is this! We've been over this rune already! My soul burns with fury and you are stoking the embers!'");
			#We don't want this global to keep growing everytime someone tries to turn in a rune when they've completed the spell progression.
			#If the spell progression is complete, set the global to just one more than the number of spells in the progression.
			$count++;
			quest::setglobal("MuramiteGreater", $count, 5, "F");
			quest::summonitem(59986);
		}
	}
	
	elsif(plugin::check_handin(\%itemcount, 59987 => 1)) {#Glowing Muramite Rune
		# If the global isn't defined for us, do so and set it at once, else increment it by one
		if(!defined $qglobals{MuramiteGlowing}){
			quest::setglobal("MuramiteGlowing", 1, 5, "F");
		}
		else {
			my $x = $qglobals{MuramiteGlowing};
			$x++;
			quest::setglobal("MuramiteGlowing", $x, 5, "F");
		}
		
		#Check my class, load what spells my class is eligible for.
		LoadSSet("glowing");
		
		#Number of spells in this progression
		$count = @spell_choices;
		
		if (!($qglobals{MuramiteGlowing} >= $count) && !(@spell_choices[$qglobals{MuramiteGlowing}] eq "none")) {
			quest::say("Excellent find! I can decipher that for you.");
			quest::emote("translates the rune onto a scroll as a strange wind arises from nowhere. 'You feel the magic of Discord, my friend?' he asks without looking up from his work. 'It's tangible in the air. It's tangible . . . and they call me crazy! Hmph.'");
			quest::summonitem(@spell_choices[$qglobals{MuramiteGlowing}]);
		}
		
		else {
			quest::emote("throws the rune back at you. 'What is this! We've been over this rune already! My soul burns with fury and you are stoking the embers!'");
			#We don't want this global to keep growing everytime someone tries to turn in a rune when they've completed the spell progression.
			#If the spell progression is complete, set the global to just one more than the number of spells in the progression.
			$count++;
			quest::setglobal("MuramiteGlowing", $count, 5, "F");
			quest::summonitem(59987);
		}
	}
	
	elsif(plugin::check_handin(\%itemcount, 59988 => 1)) {#Ancient Muramite Rune
		# If the global isn't defined for us, do so and set it at once, else increment it by one
		if(!defined $qglobals{MuramiteAncient}){
			quest::setglobal("MuramiteAncient", 1, 5, "F");
		}
		else {
			my $x = $qglobals{MuramiteAncient};
			$x++;
			quest::setglobal("MuramiteAncient", $x, 5, "F");
		}
		
		#Check my class, load what spells my class is eligible for.
		LoadSSet("ancient");
		
		#Number of spells in this progression
		$count = @spell_choices;
		
		if (!($qglobals{MuramiteAncient} >= $count) && !(@spell_choices[$qglobals{MuramiteAncient}] eq "none")) {
			quest::emote("giggles as he sets about translating the rune onto a scroll. When he's finished, he looks up with a crazed energy in his eyes. 'What is this? What have you brought me?! This has sliced deep into my soul. Take your translation and go!' ");
			quest::summonitem(@spell_choices[$qglobals{MuramiteAncient}]);
		}
		
		else {
			quest::emote("throws the rune back at you. 'What is this! We've been over this rune already! My soul burns with fury and you are stoking the embers!'");
			#We don't want this global to keep growing everytime someone tries to turn in a rune when they've completed the spell progression.
			#If the spell progression is complete, set the global to just one more than the number of spells in the progression.
			$count++;
			quest::setglobal("MuramiteAncient", $count, 5, "F");
			quest::summonitem(59988);
		}
	}
   
  plugin::return_items(\%itemcount);
}

sub LoadSSet {
	my $tier = shift;
	
	if ($tier eq "minor") {
		if ($class eq "Wizard") {
			@spell_choices = qw(77178 77179 77180 77182);#Icebane, Ether Shield, Tears of the Sun, Spark of Fire
		}
		
		elsif ($class eq "Enchanter") {
			@spell_choices = qw(77234 77238 77235 77272 77233);#Ethereal Rune, Salik's Animation, Mystic Shield, Cloud of Indifference, Synapsis Spasm
		}
		
		elsif ($class eq "Necromancer") {
			@spell_choices = qw(77158 77157 77159 77846);#Shadow Guard, Acikin, Chaos Plague, Eidolon Howl
		}
		
		elsif ($class eq "Magician") {
			@spell_choices = qw(mageminor1 77209 77202 77210 77203 77208);#all of {Summon Calliav's Glowing Bauble, Summon Calliav's Jeweled Bracelet, Summon Calliav's Platinum Choker, Summon Calliav's Runed Mantle, Summon Calliav's Spiked Ring, Summon Calliav's Steel Bracelet}, Child of Wind, Fireskin, Bolt of Jerikor, Summon: Fireblade, Elemental Aura
		}
		
		elsif ($class eq "Cleric") {
			@spell_choices = qw(77002 77001 77004 77005 77275 77003 77843);#Pious Remedy, Confidence, Ward of Valiance, Shock of Wonder, Sun Cloak, Symbol of Balikor, Revulsion of Death
		}
		
		elsif ($class eq "Shaman") {
			@spell_choices = qw(77129 77130 77132 77131 77133);#Spirit of Sense, Yoppa's Spear of Venom, Spirit of Perseverance, Putrid Decay, Crippling Spasm
		}
		
		elsif ($class eq "Druid") {
			@spell_choices = qw(77088 77087 77084 77085 77852);#Earth Shiver, Tempest Wind, Oaken Vigor, Stormwatch, Instinctual Terror
		}
		
		elsif ($class eq "Warrior") {
			@spell_choices = qw(77287);#Aura of Runes Discipline
		}
		
		elsif ($class eq "Rogue") {
			@spell_choices = qw(77294);#Imperceptible Discipline
		}
		
		elsif ($class eq "Monk") {
			@spell_choices = qw(77289);#Dreamwalk Discipline
		}
		
		elsif ($class eq "Bard") {
			@spell_choices = qw(77111 77112 77113);#Luvwen's Aria of Serenity, Vulka's Chant of Disease, Bellow of Chaos
		}
		
		elsif ($class eq "Paladin") {
			@spell_choices = qw(77031 77029 77028);#Force of Piety, Touch of Piety, Direction
		}
		
		elsif ($class eq "Shadowknight") {
			@spell_choices = qw(77066 77067 77065);#Dark Constriction, Bond of Inruku, Blood of Discord
		}
		
		elsif ($class eq "Ranger") {
			@spell_choices = qw(77048 77049 77047);#Displace Summoned, Shield of Briar, Nature Veil
		}
		
		elsif ($class eq "Beastlord") {
			@spell_choices = qw(77255 77256);#Healing of Mikkily, Chimera Blood
		}
		
		elsif ($class eq "Berserker") {
			@spell_choices = qw(77300 77296);#Axe of the Destroyer, Unpredictable Rage Discipline
		}
	}
	
	elsif ($tier eq "lesser") {
		if ($class eq "Wizard") {
			@spell_choices = qw(77191 77181 77271);#Circle of Fire, Lightningbane, Phase Walk
		}
		
		elsif ($class eq "Enchanter") {
			@spell_choices = qw(77236 77240 77239 77237 77837);#Felicity, Speed of Salik, Placate, Rune of Salik, Anxiety Attack
		}
		
		elsif ($class eq "Necromancer") {
			@spell_choices = qw(77156 77167 77168 77161 77160 77834);#Soulspike, Lost Soul, Dark Nightmare, Glyph of Darkness, Grip of Mori, Unholy Howl
		}
		
		elsif ($class eq "Magician") {
			@spell_choices = qw(77213 77215 77216 77223 77201 77221);#Summon Dagger of the Deep, Rain of Jerikor, Child of Water, Summon Crystal Belt, Summon Staff of the North Wind, Summon Sphere of Air
		}
		
		elsif ($class eq "Cleric") {
			@spell_choices = qw(77011 77012 77006 77010 77009 77008);#Reproach, Panoply of Vie, Sermon of Reproach, Pious Elixir, Blessing of Devotion, Conviction
		}
		
		elsif ($class eq "Shaman") {
			@spell_choices = qw(77128 77149 77143 77136 77141);#Farrel's Companion, Breath of Wunshi, Spirit of Might, Ancestral Bulwark, Spirit Veil
		}
		
		elsif ($class eq "Druid") {
			@spell_choices = qw(77100 77089 77096 77092 77093 77090);#Nettle Shield, Nature's Serenity, Glacier Breath, Lion's Strength, Sun's Corona, Immolation of the Sun
		}
		
		elsif ($class eq "Warrior") {
			@spell_choices = qw(none);#(none)
		}
		
		elsif ($class eq "Rogue") {
			@spell_choices = qw(none);#(none)
		}
		
		elsif ($class eq "Monk") {
			@spell_choices = qw(none);#(none)
		}
		
		elsif ($class eq "Bard") {
			@spell_choices = qw(77116 77120 77114 77118 77854);#Zuriki's Song of Shenanigans, Vulka's Chant of Frost, Luvwen's Lullaby, Cantata of Life, Angstlich's Wail of Panic
		}
		
		elsif ($class eq "Paladin") {
			@spell_choices = qw(77030 77034 77030 77032);#Spurn Undead, Symbol of Jeron, Crusader's Purity, Silvered Fury
		}
		
		elsif ($class eq "Shadowknight") {
			@spell_choices = qw(77070 77072 77068 77069 77840);#Shroud of Discord, Terror of Discord, Touch of Inruku, Inruku's Bite, Shadow Howl
		}
		
		elsif ($class eq "Ranger") {
			@spell_choices = qw(77050 77052 77051 77053);#Locust Swarm, Guard of the Earth, Sylvan Water, Strength of the Hunter
		}
		
		elsif ($class eq "Beastlord") {
			@spell_choices = qw(77257 77258 77259);#Muada's Mending, Focus of Alladnu, Spiritual Vitality
		}
		
		elsif ($class eq "Berserker") {
			@spell_choices = qw(77294);#Crippling Strike
		}
	}
	
	elsif ($tier eq "normal") {
		if ($class eq "Wizard") {
			@spell_choices = qw(77188 77183 77185 77184 77186);#Spark of Lightning, Firebane, Spark of Thunder, Ether Skin, Thundaka
		}
		
		elsif ($class eq "Enchanter") {
			@spell_choices = qw(77244 77246 77242 77249 77855);#Clairvoyance, Wall of Alendar, Compel, Psychosis, Circle of Dreams
		}
		
		elsif ($class eq "Necromancer") {
			@spell_choices = qw(77166 77274 7716277163);#Desecrating Darkness, Shadow of Death, Fang of Death, Scent of Midnight
		}
		
		elsif ($class eq "Magician") {
			@spell_choices = qw(77212 77219 77218 77220 77226);#Phantom Shield, Blade Strike, Summon Pouch of Jerikor, Child of Fire, Pyrilen Skin
		}
		
		elsif ($class eq "Cleric") {
			@spell_choices = qw(77015 77013 77014 77016 77007 77831);#Sound of Divinity, Hammer of Reproach, Pious Light, Desolate Undead, Unswerving Hammer of Retribution, Deistic Howl
		}
		
		elsif ($class eq "Shaman") {
			@spell_choices = qw(77138 77140 77142 77137 77134 77135);#Talisman of Sense, Yoppa's Rain of Venom, Pained Memory, Spirit of Fortitude, Yoppa's Mending, Wunshi's Focusing
		}
		
		elsif ($class eq "Druid") {
			@spell_choices = qw(77094 77097 77273 77224 77103 77099);#Steeloak Skin, Chlorotrope, Cloak of Nature, Desolate Summoned, Nettlecoat, Wasp Swarm
		}
		
		elsif ($class eq "Warrior") {
			@spell_choices = qw(77288);#Savage Onslaught Discipline
		}
		
		elsif ($class eq "Rogue") {
			@spell_choices = qw(77292);#Deadly Aim Discipline
		}
		
		elsif ($class eq "Monk") {
			@spell_choices = qw(77291);#Counterforce Discipline
		}
		
		elsif ($class eq "Bard") {
			@spell_choices = qw(77119 77117 77121 77676);#Vulka's Chant of Poison, War March of Muram, Yelhun's Mystic Call, Dirge of Metala
		}
		
		elsif ($class eq "Paladin") {
			@spell_choices = qw(77035 77042 77039 77036);#Pious Fury, Jeron's Mark, Serene Command, Light of Piety
		}
		
		elsif ($class eq "Shadowknight") {
			@spell_choices = qw(77074 77073 77078 77071);#Son of Decay, Blood of Inruku, Scythe of Inruku, Theft of Pain
		}
		
		elsif ($class eq "Ranger") {
			@spell_choices = qw(77056 77054 77055 77677);#Hunter's Vigor, Briarcoat, Frost Wind, Tranquility of the Glade
		}
		
		elsif ($class eq "Beastlord") {
			@spell_choices = qw(77261 77260 77262);#Growl of the Beast, Spirit of Alladnu, Spirit of Irionu
		}
		
		elsif ($class eq "Berserker") {
			@spell_choices = qw(77298 77675);#Mind Strike, Unflinching Will
		}
	}
	
	elsif ($tier eq "greater") {
		if ($class eq "Wizard") {
			@spell_choices = qw(77190 77193 77194 77196 77189);#Meteor Storm, Spark of Ice, Gelidin Comet, Solist's Frozen Sword, Ether Ward
		}
		
		elsif ($class eq "Enchanter") {
			@spell_choices = qw(77251 77241 77301 77245 77247 77243);#Euphoria, Arcane Noose, Desolate Deeds, Mayhem, Color Snap, Wake of Felicity
		}
		
		elsif ($class eq "Necromancer") {
			@spell_choices = qw(77173 77172 77171 77164 77165);#Pyre of Mori, Bulwark of Calliav, Dark Salve, Dull Pain, Dark Hold
		}
		
		elsif ($class eq "Magician") {
			@spell_choices = qw(77214 77224 77217 77225 77228);#Elemental Fury, Desolate Summoned, Burning Earth, Renewal of Jerikor, Bulwark of Calliav
		}
		
		elsif ($class eq "Cleric") {
			@spell_choices = qw(77021 77017 77018 77020 77019);#Yaulp VII, Mark of the Blameless, Word of Vivification, Aura of Devotion, Calamity
		}
		
		elsif ($class eq "Shaman") {
			@spell_choices = qw(77144 77148 77145 77150 77146);#Talisman of Fortitude, Pure Spirit, Talisman of Perseverance, Curse of Sisslak, Ice Age.
		}
		
		elsif ($class eq "Druid") {
			@spell_choices = qw(77095 77098 77102 77104);#Blessing of Oak, Oaken Guard, Solstice Strike, Vengeance of the Sun
		}
		
		elsif ($class eq "Warrior") {
			@spell_choices = qw(77283);#Bazu Bellow
		}
		
		elsif ($class eq "Rogue") {
			@spell_choices = qw(77284);#Daggerfall
		}
		
		elsif ($class eq "Monk") {
			@spell_choices = qw(77285);#Phantom Cry
		}
		
		elsif ($class eq "Bard") {
			@spell_choices = qw(77115 77124 77122);#Verse of Vesagran, Chorus of Life, Eriki's Psalm of Power
		}
		
		elsif ($class eq "Paladin") {
			@spell_choices = qw(77041 77038 77037 77040);#Bulwark of Piety, Armor of the Champion, Hand of Direction, Pious Cleansing
		}
		
		elsif ($class eq "Shadowknight") {
			@spell_choices = qw(77075 77077 77076 77079);#Rune of Decay, Spear of Muram, Pact of Decay, Dread Gaze
		}
		
		elsif ($class eq "Ranger") {
			@spell_choices = qw(77059 77058 77057 77060);#Hearth Embers, Howl of the Predator, Nature's Denial, Nature's Balance
		}
		
		elsif ($class eq "Beastlord") {
			@spell_choices = qw(77265 77264 77263 77267);#Spiritual Ascendance, Feral Vigor, Glacier Spear, Feral Guard
		}
		
		elsif ($class eq "Berserker") {
			@spell_choices = qw(77299);#Baffling Strike
		}
	}
	
	elsif ($tier eq "glowing") {
		if ($class eq "Wizard") {
			@spell_choices = qw(77187 77192 77197 77198 77195);#Circle of Thunder, Telekara, Gelid Rains, Corona Flare, Bulwark of Calrena
		}
		
		elsif ($class eq "Enchanter") {
			@spell_choices = qw(77248 77252 77253 77250);#Circle of Alendar, Hastening of Salik, Voice of Clairvoyance, True Name
		}
		
		elsif ($class eq "Necromancer") {
			@spell_choices = qw(77016 77174 77169 77170 77175);#Desolate Undead, Dark Assassin, Chaos Venom, Dark Possession, Word of Chaos
		}
		
		elsif ($class eq "Magician") {
			@spell_choices = qw(77222 77229 77227 77230 77231);#Circle of Fireskin, Child of Earth, Star Scream, Star Strike, Elemental Simulacrum 
		}
		
		elsif ($class eq "Cleric") {
			@spell_choices = qw(77022 77024 77023 77026);#Placate, Balikor's Mark, Armor of the Pious, Silent Dictation, Hand of Conviction
		}
		
		elsif ($class eq "Shaman") {
			@spell_choices = qw(77151 77153 77152 77154 77139 77147);#Blood of Yoppa, Spiritual Serenity, Talisman of Wunshi, Champion, Vindictive Spirit, Talisman of Might
		}
		
		elsif ($class eq "Druid") {
			@spell_choices = qw(77106 77108 77107 77109 77091 77101);#Circle of Nettles, Glitterfrost, Blessing of Steeloak, Mask of the Wild, Hungry Vines, Nature's Beckon
		}
		
		elsif ($class eq "Warrior") {
			@spell_choices = qw(77286);#Shocking Defense Discipline
		}
		
		elsif ($class eq "Rogue") {
			@spell_choices = qw(77293);#Frenzied Stabbing Discipline
		}
		
		elsif ($class eq "Monk") {
			@spell_choices = qw(77290);#Rapid Kick Discipline
		}
		
		elsif ($class eq "Bard") {
			@spell_choices = qw(77125 77126 77123);#Vulka's Chant of Flame, Vulka's Lullaby, Voice of the Vampire
		}
		
		elsif ($class eq "Paladin") {
			@spell_choices = qw(77044 77045 77043);#Brell's Brawny Bulwark, Affirmation, Wave of Piety
		}
		
		elsif ($class eq "Shadowknight") {
			@spell_choices = qw(77080 77082 77081);#Theft of Hate, Cloak of Discord, Touch of the Devourer
		}
		
		elsif ($class eq "Ranger") {
			@spell_choices = qw(77061 77062 77063);#Onyx Skin, Ward of the Hunter, Call of Lightning
		}
		
		elsif ($class eq "Beastlord") {
			@spell_choices = qw(77303 77266 77269 77268);#Sha's Legacy, Spirit of Rashara, Ferocity of Irionu, Festering Malady
		}
		
		elsif ($class eq "Berserker") {
			@spell_choices = qw(77295);#Vengeful Flurry Discipline
		}
	}
	
	elsif ($tier eq "ancient") {
		if ($class eq "Wizard") {
			@spell_choices = qw(77199 77282);#Core Fire, Spear of Gelaqua 
		}
		
		elsif ($class eq "Enchanter") {
			@spell_choices = qw(77280 77254);#Voice of Muram, Neurosis
		}
		
		elsif ($class eq "Necromancer") {
			@spell_choices = qw(77279 77177);#Touch of Orshilak, Curse of Mori
		}
		
		elsif ($class eq "Magician") {
			@spell_choices = qw(77232 77281);#Nova Strike, Veil of Pyrilonus
		}
		
		elsif ($class eq "Cleric") {
			@spell_choices = qw(77276 77027);#Hallowed Light, Pious Conscience
		}
		
		elsif ($class eq "Shaman") {
			@spell_choices = qw(77278 77155);#Wilslik's Mending, Ancestral Calling
		}
		
		elsif ($class eq "Druid") {
			@spell_choices = qw(77277 77110);#Chlorobon, Glacier Frost
		}
		
		elsif ($class eq "Warrior") {
			@spell_choices = qw(none);#(none)
		}
		
		elsif ($class eq "Rogue") {
			@spell_choices = qw(none);#(none)
		}
		
		elsif ($class eq "Monk") {
			@spell_choices = qw(none);#(none)
		}
		
		elsif ($class eq "Bard") {
			@spell_choices = qw(77127);#Call of Power
		}
		
		elsif ($class eq "Paladin") {
			@spell_choices = qw(77046);#Force of Jeron
		}
		
		elsif ($class eq "Shadowknight") {
			@spell_choices = qw(77083);#Bite of Muram
		}
		
		elsif ($class eq "Ranger") {
			@spell_choices = qw(77064);#North Wind
		}
		
		elsif ($class eq "Beastlord") {
			@spell_choices = qw(77270);#Savage Ice
		}
		
		elsif ($class eq "Berserker") {
			@spell_choices = qw(none);#(none)
		}
	}
}#END of FILE Zone:draniksscar ID:302038 --#Karsor_the_Mad.pl