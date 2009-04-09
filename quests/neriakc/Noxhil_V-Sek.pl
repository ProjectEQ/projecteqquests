#Noxhil_V-Sek.pl
#Fire Beetle Eyes/Mammoth Tusks (Kerran Fire Beetle Eyes)
#There is alot of confusion about the fire beetle eyes/kerran fire beetle eyes.
#It is my thought that people are mixing the two quests up, and imagining a
#third quest, when really there are just two.  It's not possible to turn
#in 5 items to a quest giver at once, the person who said 4 beetle eyes
#and 1 mammoth tusk was making it up.  I don't know why.  The turn ins
#are a combined box of fire beetle eyes (either sort of beetle eye works)
#for the first quest and 2 mammoth tusks (called bull elephant tusks in the
#dialog, but a well known never fixed screw up on VI's part) for the second.
#I did this quest on live numerous times, though it has been years.  It was
#excellent xp for a new character. -Kilelen

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("Greetings, $name!  We of the Dead are proud to have you among us.  Your lineage is well known.  Still, you must learn to claw your way to the upper echelon.  There are many [menial tasks] to be performed before you can truly be inducted as a member.");
	}
	if($text=~/menial tasks/i){
		quest::say("You cannot avoid the toil of peons. We have all spent our time in the lower ranks. There are duties such as [collecting beetle eyes].");
	}
	if($text=~/collecting beetle eyes/i){
		quest::say("Take this chest.  It has been fitted with a mold designed to hold ten beetle eyes.  We require them for further experiments.  Do not return until you fill the chest.");
		quest::summonitem(17930);#Empty Box
	}
	if($text=~/other components/i){
		quest::say("The other components that are required are two Bull Elephant tusks.  Mammoth tusks would do as well.");#text made up
	}
}
sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 13389 => 1)){#Box of Beetle Eyes
		quest::say("Fantastic work, my child! We shall store these for further experiments. Take this as extra payment for a fine job. You have done so well I believe you can assist in obtaining two [other components].");
		quest::faction(322, 5); #The Dead
		quest::faction(268, 5); #Queen Cristanos Thex
		quest::faction(177,-10); #King Naythox Thex
		quest::faction(170,-10); #Keepers of Art
		quest::faction(91,-10); #Eldritch Collective
		quest::faction(260,-10); #Primordial Malice
		quest::exp(17150);#5% level 8 experience, comments on alla's suggest the reward is this much.
		quest::givecash(0,16,0,0);#16 silver
		quest::summonitem(quest::ChooseRandom(13021, 13022));#Neriak Necter or Rotgrub Rye
	}
	elsif(plugin::check_handin(\%itemcount, 10124 => 2)){#Mammoth Tusks
		quest::say("These will do.  Thank you, child.");#text made up
		quest::faction(322, 5); #The Dead
		quest::faction(268, 5); #Queen Cristanos Thex
		quest::faction(177,-10); #King Naythox Thex
		quest::faction(170,-10); #Keepers of Art
		quest::faction(91,-10); #Eldritch Collective
		quest::faction(260,-10); #Primordial Malice
		quest::exp(17150);#5% level 8 experience, comments on alla's suggest the reward is this much.
		#Lesser summon corpse was not in the game when I played, and not one of the rewards.
		#However, it is a level 12 necro spell now, and I have no clue if it was added to the
		#list of rewards on live, so I'm adding it for completeness. -Kilelen
		quest::summonitem(quest::ChooseRandom(15035, 15362, 15445, 28216));#Random level 12 Necromancer spell (Bind Affinity, Convoke Shadow, Lifedraw, Lesser Summon Corpse
	}
	else {
  	quest::say("I don't need this.");#text made up
  	plugin::return_items(\%itemcount);
	}
}#END of FILE Zone:neriakc  ID:42042 -- Noxhil_V`Sek 