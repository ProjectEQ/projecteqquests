# ancient pattern quest -- ranger epic
#

sub EVENT_SAY {
  if ($faction < 5) { #amiable or better Keepers of the Art
    if ($text=~/hail/i) {
      quest::say("Ah. Hello there, adventurer. Come to search for ancient artifacts with Fizzlebik and myself?");
    }
    if ($text=~/ancient artifact/i) {
      quest::say("Oh. All types of things. This area is great. So many artifacts and remains of things all over. It's starting to fall into the pattern of things.");
    }
    if ($text=~/ancient bowl/i) {
      quest::emote("rummages through his tattered bag and throws aside a towel. 'Too many towels. Oh well, someone told me they were good to have once. Here it is, a bowl pattern. Interesting bowl. Looks almost like a magical bowl but I'm no potter. You need it, you say? Well, it is interesting. Part of my research here is for the wizard guild in Felwithe. I'm sure they'd put a high price on this one, the enchanters guild being so interested in trading for magical paraphernalia and all. Of course if you helped me out on a chore I have, I'd be happy to give it to you. I need to deliver an artifact to the guild and I'd much rather stay here exploring. If you wish, you can take the artifact and return with the receipt and I'll give you the pattern.'");
    }
    if ($text=~/take the artifact/i) {
      quest::say("Hah! Okay, then. Here take this to Farios Elianos in Felwithe. He will give you the receipt.");
      quest::summonitem(20457);
    }
  }
  if ($faction > 4) {
	my $random = int(rand(3));
	if ($random == 0) {
		quest::say("I didn't know Slime could speak common.  Go back to the sewer before I lose my temper.");
	}
	if ($random == 1) {
		quest::say("Is that your BREATH, or did something die in here?  Now go away!");
	}
	if ($random == 2) {
		quest::say("I wonder how much I could get for the tongue of a blithering fool?  Leave before I decide to find out for myself.");
	}
  }
}

sub EVENT_ITEM {
	if ($faction < 5) { #amiable or better Keepers of the Art
		if (plugin::check_handin(\%itemcount, 20474 => 1)) {
			quest::emote("grins happily. 'Excellent! Was he pleased with the artifact? Oh, that's not even worth answering. I'm sure he was. He's always happy with the things I send him. That's why he honored me with this position of esteem, searching for useful and powerful items in this newly discovered land.'");
			quest::summonitem(18960);
			if($wp >= 3 && $wp <= 10) {
				quest::signalwith(96035,2,30);
			}
		}
	}
	plugin::return_items(\%itemcount);
}

sub EVENT_WAYPOINT_ARRIVE {

	if ($wp == 8) {
		quest::say("Hey there again, Xib!  Still a great day, isn't it?");
		quest::signalwith(96035,1,30);
	}
	if ($wp == 14) {
		quest::emote("grins a little and mumbles. 'This place is great.  Feels like I'm at the end of the universe.'");
	}
}

sub EVENT_SIGNAL {
	quest::say("What was that, Xib?");
	quest::signalwith(96035,3,30);
}

# EOF zone: timorous ID: 96032 NPC: Alrik_Farsight

