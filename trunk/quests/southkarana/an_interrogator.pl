#an_interrogator in south karana

sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("I see you wish to become an interrogator. This is not a duty for the weak of heart you know. This job sometimes requires. .. an interrogator coughs, 'a little muscle I guess you would say.'");
	quest::say("Nevertheless, we have an important job to do. There is a man by the name of Theodore Exanthem who is a known member of the Bloodsaber cult. He fled from Qeynos some time ago and we have been hot on his tail ever since.");
	quest::say("We have tracked this man down and we now know his whereabouts. However, we have bigger fish to fry today then just this low life. Theodore knows the location of two other individuals also suspected of hiding out here in the plains.");
	quest::say("Sadly, these fiends were the two that slipped into Surefall Glade and poisoned the waters there. Though the druids were able to quickly combine their efforts and neutralize the toxins with their magicks, grievous damage was done none the less. Two of the great protectors of the hills and the glade, Holly Windstalker and Cros Treewind, became seriously ill as did one of the glade's sacred bears.");
	quest::say("Holly and Cros, sickened as they were, removed themselves from the Hills to weather out their illness and to keep the disease from spreading further. During their absence, the Bloodsabers were easily able to traffic in the materials needed to complete their terrible work.");
	quest::say("Tragically, Cros Treewind was attacked by one of the sacred bears which was maddened by its illness. In his weakened state Cros was unable to defend himself and was killed by this defiled grizzly, one of the very creatures he was sworn to protect.");
	quest::say("So our goal is to pry the information we need from Theodore Exanthem so that we may bring these two fugitives to justice. After getting him to comply, you are to collect a confession from Theodore and have him lead us to the two fugitives. Give me Theodore's confession and the heads of these two fugitives and you shall have your badge.");
	quest::say("I believe I know where we can find him. Follow me please.");
	#need to find correct spawn location
	quest::unique_spawn(14146, 0, 0, $x+10, $y+10, $z);
	#need to make grid to walk to spawn
	quest::moveto($x+7, $y+7, $z);	
	quest::settimer(1, 3);
 }
 if($text =~ /Give me a confession document/i) {
	quest::say("Here you are.'");
	quest::summonitem(2344);
 }
}

sub EVENT_TIMER {
	if ($timer == 1) {
		quest::stoptimer(1);
		quest::say("Theodore Exanthem by order of the Council of Qeynos and his lordship Antonius Bayle, I order you to come out of there immediately!");
		quest::say("Theodore Exanthem, you will [take us to the location] of Marcus Cachexia and Morley Murrain immediately.");
		quest::signalwith(14146,2,3000);
	}
}

sub EVENT_SIGNAL {
	if ($signal == 3) {
		quest::say("Vile beast! You are withholding information on two men guilty of terrible atrocities, not the least of which was causing the death of one of Qeynos' most respected and well known citizens, Cros Treewind! As an Interrogator I am authorized to use physical force if necessary.");
		quest::signalwith(14146,4,3000);
	}	
	if ($signal == 5) {
		quest::say("[Take us to the location] of Markus Cachexia and Morley Murrain!");
	}
	if ($signal == 6) {
		quest::say("Take us to Markus Chachexia and Morley Murrain this instant or I'll turn you over to my friend here who appears to be much stronger then I am!");
		quest::emote("smiles and says, 'Well, I'm getting tired. Why don't you hit him for a while. Maybe you will be more convincing then I have been.'");
	}
	if ($signal == 8) {
		#need to make grid of path & spawn minions and wraiths
		quest::unique_spawn(14127,0,0,-3280+10,-6050+10,0);
		quest::unique_spawn(14147,0,0,-3280,-6050,0);
		quest::moveto(-3260,-6040,0);
	}
}

sub EVENT_ITEM {
	if ($itemcount{2390} == 1 && $itemcount{2391} == 1 && $itemcount{2395} == 1) {
		quest::say("Excellent work, you did just fine today. You'll make a fine interrogator. Talk to Vegalys about advancing further.");
		quest::summonitem(2387);
		quest::signalwith(14146,9,3000);
		quest::depop();
		#faction raised Guards of Qeynos
		#faction raised Priests of Life
		#faction lowered Bloodsabers
		#faction lowered Corrupt Qeynos Guards
		#faction lowered Opal Dark Briar
	}
}


