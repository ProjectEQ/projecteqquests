#Bolodakan.pl
#The Spire Beacon, Honor Ladislev, Recover the Family Crest
#Must be warmly+ to do these. -Kilelen

sub EVENT_SAY
{
	if ($text=~/Hail/i) {
		quest::say("Come to watch those dreadful Muramites corrupt the tower have you? I tell you, they have no right to be there at all. They are perverting the craftsmanship and style of the dragorns that built that wondrous structure. If my [master] were still here he would have words for those beasts working on that accursed [beacon]. But, alas his time has passed and it is up to me to not only provide for my [family] and his, but to uphold the traditions of architecture and craftsmanship that are the heritage of all dragorn as well.");
	}
	
	if ($faction <= 2) {
	
		if ($text=~/beacon/i) {
			quest::say("Can't you see it? The one they placed on top of the tower. I expect it will be used as a signal of some sort. It is an outrage that the Muramites have turned our glorious works to this. Mata Muram's forces, with every day of work, are defiling the memory of the great father Dranik. It is said that when he died, Dranik's head rested on the very spot where the tower stands. If only I could get a [sample] of their work, perhaps I could find a way to do something to slow or destroy it.");
		}
	
		if ($text=~/sample/i) {
			quest::say("To best know what is going on in there I would need a set of blueprints of their work on the tower. I would also need samples of the materials being used there. Bits of mortar, stone, and wood would allow me to study the aspects of the materials and perhaps find a weakness.");
		}
		
		if ($text=~/master/i) {
			quest::say("Yes, Ladislev was a great architect. He taught me all that I know about building and craftsmanship. That was before he was taken though. Because of his great renown among the dragorn, he was taken to the Wall of Slaughter to aid in the renovations of what ruins were left there after the invasion. Since that day I have heard [rumors] that he was slain by one of the disgusting girplan he was forced to work with.");
		}
		
		if ($text=~/rumors/i) {
			quest::say("As you may know the girplan are often used by the legion to work on any construction projects they need. When Ladislev was taken to the Wall of Slaughter he was forced to work in concert with these horrid things. Undoubtedly he was working to preserve the dragorn architectural style against the designs of the girplans. I heard that he argued with them so much that they decided the work would be easier without him and [killed him].");
		}
		
		if ($text=~/killed him/i) {
			quest::say("As I said, they are only rumors. I refuse to believe that he is dead until I have proof. However, if he is dead I shudder to think of his knowledge and tools in the possession of the Muramites. Perhaps you could venture there and investigate these rumors for me. Ladislev always wore a ring that proclaimed his status as a master architect. If you find that he is dead bring me that ring along with his [tools]. But if he is alive, do all that you can to free him and return with him.");
		}
		
		if ($text=~/tools/i) {
			quest::say("Ladislev kept the tools of his trade in an ornate toolbox. It was a gift to him from the council many years ago to show their appreciation for some of his work on the palace. He also kept with him a detailed book of ancient dragorn architecture. He drew much of his inspiration from this book and it would be a great loss to our culture if it were destroyed.");
		}
		
		if ($text=~/family/i) {
			quest::say("My family used to have a wonderful home in Dranik. My father had planned on passing it on to me and I to my children. This was all before The Darkening and the coming of Mata Muram. With the coming of the Muramites our house was ransacked and we were chased from the city by a pack of ukun. We were forced to leave at a moment's notice and only just avoided being eaten alive by those vile beasts. One of the items we had to leave was the great [crest] of my family.");
		}
		
		if ($text=~/crest/i) {
			quest::say("It was a gift of the council many years ago, given to my family for service to the dragorn people. As such, it holds a great deal of sentimental value for me. If you could return the crest to me and three of the chain leashes used on the ukun as a measure of vengeance against them I would be in your debt.");
		}
	}
}

sub EVENT_ITEM
{
	if ($faction <= 2) {
		#The Spire Beacon
		if(plugin::check_handin(\%itemcount, 36541 => 1, 36540 => 1, 36539 => 1, 36538 => 1)) {#Sliver of Wood, Cornerstone Fragment, Tower Mortar, Harbingers Spire Blueprints
			quest::say("Excellent! You've found all that I asked for. I will review these plans and materials immediately and see what can be done. Take this belt as a reward. It has been in my family for ages, but seems a fitting reward for your efforts.");
			quest::faction(410, 10);#Dranik Loyalists
			quest::faction(432, -20);#Overlord Mata Muram
			quest::exp(10000);
			#Reward depends on class
			if (($class eq "Wizard") || ($class eq "Enchanter") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Cleric") || ($class eq "Druid") || ($class eq "Shaman")) {
				quest::summonitem(71138);#Belt of Braided Platinum
			}
			else {
				quest::summonitem(71137);#Belt of Melded Scales
			}
		}
		#Honor Ladislev
		elsif(plugin::check_handin(\%itemcount, 36536 => 1, 36537 => 1, 36535 => 1)) {#Ladislev's Toolbox, Book of Sketches, Ring of Architectural Mastery
			quest::say("So the rumors were true. I both feared and hoped they were. At least Ladislev no longer needs to suffer the torture of the Muramites. Thank you for looking into this for me and retrieving what you could. I will see that the knowledge is not lost and shall pass it down to the generations after me. Please take this mantle as a token of my gratitude. it was given to me by Ladislev on the day I became his student.");
			quest::faction(410, 10);#Dranik Loyalists
			quest::faction(432, -20);#Overlord Mata Muram
			quest::exp(10000);
			#Reward depends on class
			if (($class eq "Wizard") || ($class eq "Enchanter") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Cleric") || ($class eq "Druid") || ($class eq "Shaman")) {
				quest::summonitem(71141);#Mantle of the Architect
			}
			else {
				quest::summonitem(71142);#Pauldrons of the Builder
			}
		}
		#Recover the Family Crest
		elsif(plugin::check_handin(\%itemcount, 36543 => 3, 36542 => 1)) {#3x Chain Leash, Large Dragorn Crest
			quest::say("Take this amult as a reward.");#Text made up
			quest::faction(410, 10);#Dranik Loyalists
			quest::faction(432, -20);#Overlord Mata Muram
			quest::exp(10000);
			#Reward depends on class
			if (($class eq "Wizard") || ($class eq "Enchanter") || ($class eq "Magician") || ($class eq "Necromancer") || ($class eq "Cleric") || ($class eq "Druid") || ($class eq "Shaman")) {
				quest::summonitem(71140);#Gold Crested Amulet
			}
			else {
				quest::summonitem(71139);#Dragorn Crested Amulet
			}
		}
	}
	plugin::return_items(\%itemcount);
}#END of FILE Zone:draniksscar ID:302045 --Bolodakan.pl