#Elder_Priest_of_Discord.pl
#Wall of Slaughter Port Spells

sub EVENT_SAY { 
	if($text=~/hail/i){
		quest::say("'Should you wish to return from whence you came, tell me you wish to [go home] and I will send you. I am also able to aid wizards and druids with the ability to [find their way] further into Discord.");
	}
	
	if ($text=~/find their way/i) {
		quest::say("If you bring me the right materials -- three samples of pure discordant blood from a dark creature and a rare enchanted scroll, I can help to create teleportation spells.");
	}

	if ($text=~/go home/i) {
		quest::say("Very well, begone then!");#Text made up
		if ($race eq "Human") {
			quest::selfcast(6213);#Rift of Freeport 
		}
		
		elsif($race eq "Barbarian") {
			quest::selfcast(6215);#Rift of Halas 
		}
		
		elsif($race eq "Erudite") {
			quest::selfcast(6211);#Rift of Erudin 
		}
		
		elsif($race eq "Wood Elf") {
			quest::selfcast(6214);#Rift of Gfaydark 
		}
		
		elsif($race eq "High Elf") {
			quest::selfcast(6212);#Rift of Felwithe 
		}
		
		elsif($race eq "Dark Elf") {
			quest::selfcast(6217);#Rift of Neriak 
		}
		
		elsif($race eq "Half Elf") {
			quest::selfcast(6214);#Rift of Gfaydark 
		}
		
		elsif($race eq "Dwarf") {
			quest::selfcast(6216);#Rift of Kaladim 
		}
		
		elsif($race eq "Troll") {
			quest::selfcast(6223);#Rift of  Grobb
		}
		
		elsif($race eq "Ogre") {
			quest::selfcast(6218);#Rift of Oggok 
		}
		
		elsif($race eq "Halfling") {
			quest::selfcast(6221);#Rift of Rivervale
		}
		
		elsif($race eq "Gnome") {
			quest::selfcast(6210);#Rift of Ak'Anon 
		}
		
		elsif($race eq "Froglok") {
			quest::selfcast(6223);#Rift of  Grobb
		}
		
		elsif($race eq "Vah Shir") {
			quest::selfcast(6222);#Rift of SharVahl 
		}
		
		elsif($race eq "Iksar") {
			quest::selfcast(6224);#Rift of  Cabeast 
		}
		
		else {
			quest::say("You know what, I don't know where I should send you.  Sorry.");
		}
	}
}

sub EVENT_ITEM {

	if(plugin::check_handin(\%itemcount, 77768 => 1, 77767 => 3)){#1x Dark Enchanted Scroll, 3x Pure Discordant Blood.
		quest::emote("takes the sickly blood and spreads it across the enchanted scroll. It blends and swims horribly over it. When it settles, the priest hands it to you.");
		quest::say("You may now travel further into Discord, true power awaits!");
		if ($class eq "Druid") {
			quest::summonitem(77657);# Spell: Circle of Slaughter	 
			quest::summonitem(77658);# Spell: Ring of Slaughter
		}
		else {
			quest::summonitem(77654);# Spell: Slaughter Gate
			quest::summonitem(77656);# Spell: Slaughter Portal
			quest::summonitem(77655);# Spell: Translocate: Slaughter
		}

	}
	else {
		quest::say("I don't need this.");#text made up
		plugin::return_items(\%itemcount);
	}

}#END of FILE Zone:draniksscar ID:75013--Elder_Priest_of_Discord.pl