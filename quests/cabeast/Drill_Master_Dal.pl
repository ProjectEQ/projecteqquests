sub EVENT_SAY {
	if($text=~/Hail/i){
		quest::say("Yes. yes!!  What do I have here?!!  Another [new recruit]?  If so. then speak up!  If not. then leave and do not waste my time nor risk your life.  I also seek a [legion soldier] if you be one.");
	}
	if((($text=~/new recruit/i) || ($text=~/legion soldier/i) || ($text=~/ready for my task/i)) && ($faction > 4)) {
		quest::say("No Iksar resident will have anything to do with you!!");
	}
	if(($text=~/new recruit/i) && ($faction < 5)) {
		quest::say("Yes.  You have the look of the Partisan.  I trust you have begun your blacksmith training.  If not. then do so.  Also. you should read all the books available to you in Fortress Talishan.  We are not dimwitted broodlings here.  You shall need the knowledge soon. That. or a coffin.  Ha!!  Here is your task. are you [ready for your task]?");
	}
	if(($text=~/legion soldier/i) && ($faction < 5)) {
		quest::say("Good news to my ears!!  I seek to prove to the War Baron that the infamous forsaken band of thieves who call themselves Marrtail's Marauders are operating within earshot of our city.  You must bring me proof that you encountered no fewer than four of these thieves.  Do so and I shall offer you an armor item unavailable to most.");
	}
	if(($text=~/ready for my task/i) && ($faction < 5)) {
		quest::say("Yes. yes!!  It does not matter.  You must be ready.  I will hand you the Partisan pack.  Into it you shall combine one giant blood sac of the giant leech;  scout beads from a goblin scout; one sabertooth kitten canine and finally. three bone shards from decaying skeletons.  Hopefully. you will survive your attempt to obtain these items.  Return the full Partisan pack and you shall be rewarded with a curscale shield.");
		quest::summonitem(17997);
	}
}


sub EVENT_ITEM {
	if($faction < 5) {
		if (plugin::check_handin(\%itemcount, 12915 => 4)) {
			quest::emote("hands you a shimmering black piece of armor which smells quite horrid. You find it hard to keep it from slithering out of your hand. 'Here is the armor the tailors have been working on for the legion. You may test it for us. Keep up your fine work and I may have other pieces available for you to test.'");
			quest::summonitem(quest::ChooseRandom(12917,12918,12919,12920,12921));
			quest::ding();
			quest::faction( 193,10);
			quest::faction( 30,10);
			quest::faction( 282,10);
			quest::faction( 62,10);
			quest::faction( 317,10);
			quest::exp(1000);
			quest::givecash(0,14,0,0);
		}
		if (plugin::check_handin(\%itemcount, 12673 => 1)) {
			quest::say("Well done recruit, I knew we could count on you to do the job.  Here is the reward you were promised");
			quest::summonitem(12674);
			quest::ding();
			quest::faction( 193,2);
			quest::faction( 30,2);
			quest::faction( 282,2);
			quest::faction( 62,2);
			quest::faction( 317,2);
			quest::exp(250);
			quest::givecash(0,9,0,0);
		}
	}
	#do all other handins first, then let it do disciplines
	plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
	plugin::return_items(\%itemcount);
}

