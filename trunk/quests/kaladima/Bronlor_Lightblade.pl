sub EVENT_SAY {
	if($text=~/hail/i){ 
		# Initiate Symbol of Brell Serilis (Start)
		quest::say("Allo dere $name, how does ye fare today? Are ye a [priest] of the great Brell Serilis? If ye are not I mean nothing against yar but I am on a mission to administer guidance to a holy priest of milord Brell Serilis.");
	}
	if($text=~/priest/i){ 
 	# Initiate Symbol of Brell Serilis
		quest::say("Well now were talkin $name. I think if ye have been doing well in your training then ye will be ready to assist me in with the problem we been havin with those dern good fer nothin [green rascals].");
	}
	if($text=~/green rascals/i){ 
	# Initiate Symbol of Brell Serilis
		quest::say("Well of course I be talkin bout dose goblins that have tried to storm our front gates fer some time. I reckon dey are up to no good sense I hear dey just be a few from a well trained horde of goblin invaders that are planning an attack me thinks. Will ye [help] us in finding and slaying these goblins?");
	}
	if($text=~/help/i){ 
	# Initiate Symbol of Brell Serilis
		quest::say("Dats great to here $name! To prove to me that you have found and slain these beasts bring four sets of the beads that dey carry around their necks. I dont know much about dem but Id reckon dey have set up camp close by here. The night watch that haulted the first attack by these goblins described the fighting style to be of the highest goblin caliber. I hope this helps, good luck to ye.");
	}
	if($text=~/task/i){ 
	# Disciple Symbol of Brell Serilis (Start)
		quest::say("Ah ye are ready fer yer task are ya $name. I must say dat I am quite impressed with the excellent job dat ya did taking care of those strong goblins. Ok well ye came for yer task so here it tis. I need to get this note to me friend Taldrik, however he has told me that he was heading to the Oasis that is finest in norrath for sum relaxin time. Although I would love to go myself but Im afraid I hab many duties to uphold here. Will you [deliver] my note to Taldrik?");
	}
	if($text=~/deliver/i){ 
	# Disciple Symbol of Brell Serilis
		quest::say("Fantastic $name! I knew that ye would be able to help me. Please take this note to Taldrik, whereber he may be and be sure to give him his favorite [drinks] or he may be very grumpy.");
		# Summon: a note to Taldrik
		quest::summonitem(2429);
	}
	if($text=~/drinks/i){ 
	# Disciple Symbol of Brell Serilis
		quest::say("Oh yes of course. Taldriks favorites if I can remembur correctly be Elven wine, Freeport stout, and of course Dwarven ale! Bring these drinks to him with your note and after ye tell him you are sent from muh to continue your training im shure he will warm up to ye fer sure.");
	}
}

sub EVENT_ITEM {
	# Handin: Enraged Goblin Beads
	if(plugin::check_handin(\%itemcount, 2396 => 4)){
	# Initiate Symbol of Brell Serilis (End)
		quest::say("I knew I was able to trust ye to help me rid the land of these nasty goblins! The Bloodforge Brigade salutes ye $name. Ye will be well known in our city for being the young one that helped rid our mountains of these goblins. Please take this as a symbol of your devotion to your faith and your God and return to me when ye are ready for yer next [task].");
		# Summon: Initiate Symbol of Brell Serilis
		quest::summonitem(1430);
		quest::faction(44,10);   # +Clerics of Underfoot
		quest::faction(169,10);  # +Kazon Stormhammer
		quest::faction(219,10);  # +Miners Guild 249
		quest::exp(25);
	}
}


