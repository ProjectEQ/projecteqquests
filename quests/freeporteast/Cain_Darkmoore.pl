sub EVENT_SPAWN {
    $x = $npc->GetX();
    $y = $npc->GetY();
    quest::set_proximity($x - 50, $x + 50, $y - 50, $y + 50);
}

sub EVENT_ENTER {
    if(plugin::check_hasitem($client, 18748)) {
        $client->Message(15, "A deep booming voice breaks the silence of the room as you get your bearings. 'Step forward young recruit. I am Cain Darkmoore, Guild Master of the Army of Steel. Read the note in your inventory and hand it to me when you are ready to begin your training. Of course if you are to afraid, I saw an Elf handing out flutes at the bards' Guild this morning.'");
    }
}

sub EVENT_SAY {
	if($text=~/hail/i) {
		quest::say("Hail, $name! We are the Steel Warriors of Freeport. Our training disciplines have created some of the finest warriors ever to walk upon Norrath. Perhaps the bards shall sing songs of you one day. Let your first mission be the extermination of [Clan Deathfist].");
	}
	if($text=~/clan deathfist/i) {
		quest::say("The orcs of the Commonlands call themselves Clan Deathfist. They have committed many vile acts upon the residents of the Commonlands as well as persons traveling to and from Freeport. They must be destroyed. Go forth to slay them. I shall pay a bounty for every two Deathfist belts. If you are a true warrior of the bunker. perhaps you can begin with [the green and blue].");
	}
	if($text=~/the green and blue/i && $class eq "Warrior") {
		quest::say("The green and blue was a test for all skilled warriors. All one needed do was return to me four orc legionnaire shoulderpads. Two from the loathsome green skinned Deathfist Clan and two from the vile blue skinned Crushbone Clan. But we have no more bunker battle blades to spare. We must prepare for war!!");
	}
	if($text=~/bigger problem/i) {
		quest::say("The bigger problem is the Freeport Militia. Go to the Hall of Truth and speak with the Knights of Truth about that. They have already started their campaign to rid the city of the militia. The so-called Freeport Militia is not to be trusted.");
	}
	if($text=~/trades/i) {
		quest::say("I thought you might be one who was interested in the various different trades, but which one would suit you? Ahh, alas, it would be better to let you decide for yourself, perhaps you would even like to master them all! That would be quite a feat. Well, lets not get ahead of ourselves, here, take this book. When you have finished reading it, ask me for the [second book], and I shall give it to you. Inside them you will find the most basic recipes for each trade. These recipes are typically used as a base for more advanced crafting, for instance, if you wished to be a smith, one would need to find some ore and smelt it into something usable. Good luck!");
		quest::summonitem(51121);
	}
	if($text=~/second book/i)	{
		quest::say("Here is the second volume of the book you requested, may it serve you well!");
		quest::summonitem(51122);
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 13916 => 2)) { #Deathfist Slashed Belt x 2
		quest::say("Very fine work $name. With your help, we shall soon rid the commonlands of the orcs. Then we can move on to a [bigger problem].");
		quest::ding();
		quest::givecash(0,0,8,0);
		quest::exp(50);
		quest::faction(105,-1); #Freeport Militia
		quest::faction(311,4);  #Steel Warriors
		quest::faction(184,4);  #Knights of Truth
	}
	elsif(plugin::check_handin(\%itemcount, 18748 => 1)) { #A Tattered Note
		quest::say("Welcome to the Steel Warriors, young warrior. It is time to prove your mettle. Look to the outskirts of Freeport and join the fray. Show Clan Deathfist what a warrior of the bunker can do. Once you are ready to begin your training please make sure that you see Arinna Trueblade, she can assist you in developing your hunting and gathering skills. Return to me when you have become more experienced in our art, I will be able to further instruct you on how to progress through your early ranks, as well as in some of the various [trades] you will have available to you.");
		quest::ding();
		quest::summonitem(13572); #Dirty Training Tunic
 		quest::faction(311,10);  #Steel Warriors
		quest::faction(135,10); #Guards of Qeynos
		quest::faction(53,-15); #Corrupt Qeynos Guards
		quest::faction(105,-15); #Freeport Militia
		quest::faction(184,10);  #Knights of Truth   
		quest::exp(100);
	}
	else {
		#do all other handins first with plugin, then let it do disciplines
		plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	}
	plugin::return_items(\%itemcount);
}

#END of FILE Zone:freeporteast -- Cain_Darkmoore