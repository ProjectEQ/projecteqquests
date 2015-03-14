
sub EVENT_SAY { 
	if((($text=~/hail/i) || ($text=~/seeking work/i)) && ($faction > 5)) {
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
	if(($text=~/hail/i) && ($faction <= 5)) {
		quest::emote("glances over at you with a sneer and says, 'I have much to do and organize. If you have anything of importance to say you had best speak up now or leave before I lose my patience.'");
	}
	if(($text=~/seeking work/i) && ($faction == 5)) {
		quest::say("You need to prove your dedication to our cause before I can discuss such matters with you.");
	}
	if(($text=~/seeking work/i) && ($faction < 5)) {
		quest::emote("stops looking over his papers and takes a moment to size you up. You fight the urge to run in fear as the collosal humanoid considers you. After a moment he says, 'Very well. Our campaign to conquer the so called Tunarean Court has need of reinforcements. The Kromrif are already spread to thinly in the Eastern Wastes so mercenaries will have to do. Take these orders to the commanding officer in the field and follow his orders. Payment will be discussed after you complete your assignment.'");
		quest::ding();
		quest::summonitem(1702);  # Mercenary Assignment
	}
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 1706 => 1)) { # Krofer's Requisition
		quest::emote("takes the note and begins reading. Seeing a certain passage, he squints and rereads, his brow furrowed. He glances over at you and says, 'Very well. I will assign you a squad lead by Corporal Hlash. They will rendezvous with you out in the field. Oh and take this back to Krofer.'");			
		quest::summonitem(1707); # Signed Requisition
	}
	if(plugin::check_handin(\%itemcount, 1709 => 1)) { # Report of Failure
		quest::emote("reads over the report, his face begins to turn red with anger. Drioc shouts, 'How can this be?! I sent you a squad of some of our best trained men and you had them destroyed!! This was supposed to be a routine raid and you return in FAILURE!! I would crush you under my boot right now if I wasn't so angry but I think I'll send you to my finacier. YOU can explain what happened and why his investments have been lost. Now take your carcass out of here!'");
		quest::summonitem(1709); # Report of Failure
	}
	plugin::return_items(\%itemcount);
}
