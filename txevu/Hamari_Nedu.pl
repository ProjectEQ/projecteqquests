#live text. Still needs logic.

sub EVENT_SAY {
	if ($text=~/hail/i) {
		#if have signet of command
			quest::say("You hold a Signet of Command! I can use the power of the signet to [". quest::saylink("open the way") . "] for you to the upper reaches of the temple once you are prepared to face the Tunat'Muram.");
		#if don't have signet of command		
			quest::say("Aaaaahh! You frightened me! I've spent days hiding in the rubble here waiting for someone to come. Thank Trushar it's you and not one of those monsters! I didn't know how much longer I could hold out, but I have information that may [" . quest::saylink("help") . "] you rid our island of those vile Muramites and help me get out of this cursed place.");
	} elsif ($text=~/help/i) {
		quest::say("I know the monster that guards this place. He calls himself [" . quest::saylink("Tkarish") . "]. I was held captive by the two-headed beast. I don't know exactly what fate awaited me, but the cries of my fellow prisoners were enough to know that it wouldn't have been pleasant.");
	} elsif ($text=~/Tkarish/i) {
		quest::say("I believe the full title he demanded his servants use is Zun'Muram Tkarish Zyk. Fortunately, he's as arrogant as he is strong and I was able to slip away when he thought me secure. Unfortunately, he has gained control over the sacred [" . quest::saylink("constructs") . "] in the temple so I haven't been able to leave.");
	} elsif ($text=~/constructs/i) {
		quest::say("There are special constructs within this temple that allow access to other areas. The one next to us would normally allow me to leave the temple entirely, but it is under the sway of the Muramites. I overheard Tkarish speaking of a Tunat'Muram, a kind of commander as far as I could tell, that resides within the upper levels of the temple only reachable via the constructs. But Tkarish holds a [" . quest::saylink("Signet of Command") . "] which gives him control over the constructs. As long as he has that Signet, the way to the Tunat'Muram is closed to you and the way out is closed to me.");
	} elsif ($text=~/signet of command/i) {
		quest::say("If you can wrest the signet from Tkarish's grasp, the constructs will allow you passage to the upper levels of the temple. Should you claim a Signet of Command for yourself, I can use it to activate a nearby construct. From here, the influence of your signet would be stronger than the one Tkarish wields in the chapel above and I should be able to convince the construct to grant you passage to the upper levels of the temple.");
	} elsif ($text=~/open the way/i) {
		#if have signet of command
			quest::say("So be it. There is a construct nearby that will bring you to the seat of the slayer himself. May Trushar's blessing infuse your swords with the strength to cleanse this place of the Muramite invaders!");
		#create tacvi instance
		#if have signet but not in raid/not have enough
			quest::say("I cannot in good conscience allow you into the upper temple as you are.  If you wish to have any chance against the forces of the Tunat'Muram, you will need the help of many friends.  Without them, I would just be sending you to be slaughtered.");
	}
}