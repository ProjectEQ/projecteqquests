#Expin.pl
#Rogue Master Sketch/Rogue Trainer/Pixie Dust #2
#Much rewritten by Kilelen.  I triple checked the Pixie Dust #2
#description at alla's before I changed the way most everything worked in here.


#I'm interpreting occasionally to be 20% chance.  This is easily changed.
sub DoRandomPatchwork {
	my $a;
	$a = int(rand(100)); 
	#Change the 20 in the if to change the % chance.
	if ($a <= 20) {
		quest::summonitem(quest::ChooseRandom(2104, 2106, 2108, 2111, 2112));#Patchwork Tunic, Patchwork Cloak, Patchwork Sleeves, Patchwork Pants, Patchwork Boots
	}
	else {
		#Do nothing
	}
}

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::say("How are you, my friend?  You must be a [new scout of Kelethin].  I would hope so.  We dearly need more recruits.  Most of the Fier'Dal choose the path of the ranger.");
	}
	if($text=~/new scout of Kelethin/i){
		quest::say("Good.  I have an easy, but very important, task for you.  We require all young members to cleanse these woods of the troublesome pixie tricksters.  Take this pouch, fill it, and when it is combined, return it to me.  I just may have some used armor lying around for you.");
		quest::summonitem(17957);#Empty Pouch
	}
	if($text=~/dark assassin/i) {
		quest::emote("squints at you and says, 'So you have heard about him as well? I had heard of him through the rogue grapevine, so I was wary when the home guard spoke of the arrival of a dark stranger. I was approaching him from behind and some loud ranger clompipng about in the bushes must of spooked him, for off he ran. As he was running I took the liberty to swipe a piece of paper protruding from his pocket.'");
		quest::emote("mumbles to himself, 'Now where did I put that note?'");
	}
}

sub EVENT_ITEM { 
	if(plugin::check_handin(\%itemcount, 12109 => 1)) {#Pouch of Pixie Dust
		quest::say("Good work. scout!!  You have earned this reward.  It is all we have at the time.  I am certain you are satisfied.  If not, then do not let me hear of it.");
		&DoRandomPatchwork();
		quest::givecash("0","2","0","0");
		quest::faction(283, 10);#Scouts of Tunare
		quest::exp(800);#10% of level 3 experience.  Newbie quest, being a bit generous compared to the guidelines.
	} 
	elsif(plugin::check_handin(\%itemcount, 16390 => 1)) {#Crumpled Piece of Paper
		quest::say("Ahhh! You found it! Here let me make you a copy and put this in a secure spot so I don't lose it again.");
		quest::summonitem(24098);#Remiss Sketch
		quest::exp(5061818);#This is 2% of level 53 xp.
	}
	else {
  	#do all other handins first with plugin, then let it do disciplines
  	plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  	quest::say("I don't need this.");#text made up
  	plugin::return_items(\%itemcount);
 	}
}#END of FILE Zone:gfaydark  ID:54024 -- Expin 