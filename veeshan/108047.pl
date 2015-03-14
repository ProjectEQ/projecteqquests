#Nexona NPCID 108047

sub EVENT_SAY {
	if ($text=~/Hail/i) {
		quest::say("Well, what have we here? How dare you enter my lair! I do not take kindly to your kind disturbing me. Are you here for the same reason all other adventurers are? To plunder and destroy the serenity of a place such as this for money and power? You are an affront to us and the Ring of Scale. You don't even look fit enough to eat, but perhaps I could make some use of you. I could have you [" . quest::saylink("assist") . "] me and the Ring of Scale in something we have been planning for a while now.");
	} elsif ($text=~/assist/i && $faction == 1) {
		quest::say("Wise decision. I prefer this to picking your bones from betwixt my teeth. Now, as you may know, we have a cannibalistic dragon amongst our kind in Dragon Necropolis, the final resting spot for many of our kin. It's a foul creature, indeed. This dragon, Zlandicar, feasts on the dying flesh of our ancestors and disgusts us with his hunger for them. There is a clan of rising rats in Dragon Necropolis who oppose the dragon-eater. We have decided to aid them in their efforts to combat this disgrace to our kind. There is where you fit in. This is a special vial filled with a necrotic magic, but it is missing a few key components. This list will show what else you need to make this deadly concoction. Once created, go to Dragon Necropolis and seek out the leader of the rat creatures and give him the vial. Be sure to bring me back proof of the delivery. We hope this will help stop Zlandicar and his followers from devouring more of our kind. Go now, mortal.");
		quest::summonitem(69340);
		quest::summonitem(69348);
	}
}

sub EVENT_ITEM {
	if ($faction == 1) {
		if (plugin::check_handin(\%itemcount, 69344 => 1)) {
			quest::say("If I understand this writing correctly, you have delivered. I am pleased, but I still do not trust you. However, in fairness, I shall reward you for your effort. If this reward is unsatisfactory, return it and I will find something more applicable. Now leave my lair before my hate overwhelms me!");
			if ($class eq "Warrior") { quest::summonitem(69387);
			} elsif ($class eq "Berserker") { quest::summonitem(69387);
			} elsif ($class eq "Ranger") { quest::summonitem(69387);
			} elsif ($class eq "Bard") { quest::summonitem(69387);
			} elsif ($class eq "Rogue") { quest::summonitem(69387);
			} elsif ($class eq "Paladin") { quest::summonitem(69387);
			} elsif ($class eq "Shadowknight") { quest::summonitem(69387);
			} elsif ($class eq "Monk") { quest::summonitem(69387);
			} elsif ($class eq "Beastlord") { quest::summonitem(69387);
			} else { quest::summonitem(69388);
			}
			quest::exp(10000);
		}  elsif (plugin::check_handin(\%itemcount, 69388 => 1)) {
			quest::say("How utterly obtuse and arrogant. How about this one then?");
			quest::summonitem(69387);
		} elsif (plugin::check_handin(\%itemcount, 69387 => 1)) {
			quest::say("How utterly obtuse and arrogant. How about this one then?");
			quest::summonitem(69388);      
		}
	}
	plugin::return_items(\%itemcount);
}