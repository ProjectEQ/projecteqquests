# items: 57008, 52901
sub EVENT_SAY {
	if ($text=~/hail/i) {
		#:: Set by /....someone!
		if ($client->GetGlobal("beast_epic") == 9) {
			quest::say("Aye, ye have returned to help with this great and difficult problem. 'Tis is so complicated, I hardly know where to [" . quest::saylink("begin") . "].");
		}
		#:: Test response with no epic in progress
	}
	elsif ($text=~/way/i) {
		#:: Set by turnin below
		if ($client->GetGlobal("beast_epic") == 2) {
			quest::say("I do miss me time with Muada and I suppose I'll get me chance again. I'll have to leave ye now and go to Muada so that I may learn what I must do for him to end the threat to our ways as beastlords. Be well and ready to open your mind to learn from Muada.");
    			#:: Give a 57008 - Letter from Muada
    			quest::summonitem(57008); # Item: Letter from Muada
    		}
    		#:: Test response with no epic in progress
	}
	#:: Set by /....someone!
	elsif ($client->GetGlobal("beast_epic") == 9) {
		if ($text=~/begin/i) {
			quest::say("Not without an ale. Would ye have one handy? If not, would ye be so kind as to get one? Actually, make it three. Sorry for the trouble, but I've been out here so long, I've near forgotten the finer things in life!");
		}
		#:: Test responses with no epic in progress
	}
	#:: Set by turnin below
	elsif ($client->GetGlobal("beast_epic") == 10) {
		if ($text=~/ready/i) {
			quest::say("Aye, so, this takes us back many, many years ago, so it's hard to tell truth from legend, but I'll share it all with ye. I'm sure at some point in yer life, ye've either seen or heard of them sphinxes in the Rathe Mountains? And, I bet ye have [" . quest::saylink("no idea") . "] where they came from.");
		}
		elsif ($text=~/no idea/i) {
			quest::say("Indeed. Well, here is what I can tell ye and ye can decide if it's true or tale. Only the sphinxes themselves know where they came from. No one else does at all. Two of the few remaining sphinxes, named Zazamoukh and Ankhefenmut, have [" . quest::saylink("been on Norrath") . "] longer than you or I and, maybe, before Veeshan laid her mighty claws across the ice of Velious.");
		}
		elsif ($text=~/been on norrath/i) {
			quest::say("Aye, I'm glad ye asked. So, the story goes that during the Age of Blood, there were great ogre magi of the Rallosian Empire who convinced the sphinxes to ally with their legions, but it was no easy task. That ogre magi had their [" . quest::saylink("work") . "] cut out for him to get that alliance to come about.");
		}
		elsif ($text=~/work/i) {
			quest::say("Them ogres really had to wrap their minds about riddles that the [" . quest::saylink("sphinxes") . "] created and after many attempts, they finally won their allegiance and some of the secrets the ancient creatures guarded. Some say that those secrets were the reason the gods destroyed the ogre magi instead of cursing them as they did the other ogres.");
		}
		elsif ($text=~/sphinxes/i) {
			quest::say("At one time, there were many of those creatures, but a lot of sphinxes were slain during the great wars of the Age of Blood and in the aftermath of the fall of the Rallosian Empire. Two of the few remaining sphinxes flew with haste to hidden valleys in the Rathe Mountains, away from the meddlesome races. Their secrets were once again protected and freed from the alliance with the ogre magi. But now they are [" . quest::saylink("threatened") . "].");
		}
		elsif ($text=~/threatened/i) {
			quest::say("It is a very rare occasion when those sphinxes attempt to contact any Norrathian, but they have. Their minds have been invaded and they feel a dark presence trying to overcome them. They believe it to be a dark influence in Discord. While they want our help, we cannot just go [" . quest::saylink("speak") . "] to them.");
		}
		elsif ($text=~/speak/i) {
			quest::say("We must accommodate their requests to build trust. This means we must weave through their riddles. Once we do, we will be able to talk to them and help them. We've decided that ye be the beastlord who will take on this task. Go tell them you are willing to help them and see what you learn.");
			#:: Give a 52901 - Feral Lord's Brooch
			quest::summonitem(52901); # Item: Feral Lord's Brooch
			#:: Set a quest global keyed for 'beast_epic', with a value of '11', for the player who triggered the event, forever
			quest::setglobal("beast_epic", 11, 5, "F");
		}
		#:: Test responses with no epic in progress
	}
}

sub EVENT_ITEM {
	#:: Match a 57008 - Letter from Muada
	if (plugin::takeItems(57008 => 1)) {
		#:: Set by /sharvahl/#Elder_Animist_Muada.pl
		if ($client->GetGlobal("beast_epic") == 1) {
			quest::say("It is indeed authentic. I suppose I can tell ye that I've been studyin' the ways o' the sirens. We as beastlords use the strength of our warders, as well as bestow magic upon them. These sirens use mind tricks! I'm workin' on a [" . quest::saylink("way") . "] to use the magic these fair ocean maidens do to help our kin.");
			#:: Set a quest global keyed for 'beast_epic', with a value of '2', for the player who triggered the event, forever
			quest::setglobal("beast_epic", "2", 5, "F");
		}
		#:: Test handin with no epic in progress--eat item?
	}
	#:: Match three 13039 - Ale
	if (plugin::takeItems(13039 =>3 )) {
		#:: Set by /....someone!
		if ($client->GetGlobal("beast_epic") == 9) {
			quest::say("Thanks to ye. Ah! Now, let's get on with it. 'Tis a long story, so how about we have a wee chat. Take a seat if ye like, hm? Are ye [" . quest::saylink("ready") . "] to listen? Ye are going to need to pay attention -- even as I ramble on a bit.");
			#:: Set a quest global keyed for 'beast_epic', with a value of '10', for the player who triggered the event, forever
			quest::setglobal("beast_epic",10,5,"F");
		}
		#:: Test handin with no epic in progress--eat item?
	}
	#:: Return unused items
	plugin::returnUnusedItems();
}
