# RoF Event

my $a_tae_ew_justicar_id = 48029;

my $tahia_felwah_2_id = 48030;

# npcId = 48057
sub EVENT_SPAWN {
    quest::settimer("FD", 1);
}

sub EVENT_SIGNAL {
    # signal 1 = Wake Tahia Up 
    if ($signal == 1) {
        quest::settimer(1, 15);
        
        quest::say("Brave adventurers, I am Tahia Felwah, and I owe you my life. I was to be a sacrifice to the faceless. Listen to my words carefully, there isn't much time now.");
        
        quest::say("You have interrupted a complicated ritual and soon the rift to the Faceless will become unstable. I must collect three runes of the Faceless for my research. I have been appointed to uncover the source of these lizards' newfound power. If I fail, their kind will surely spread across the land and threaten the balance of Norrath.");
        
        plugin::SetAnim(stand);
        
        quest::moveto(573, 1005, -94, 0, 1);
    }
}

sub EVENT_TIMER {
    if ($timer == 1) {
        # signal Justicar
        quest::signalwith($a_tae_ew_justicar_id, 1, 0);

        quest::say("This failed ritual presents a unique opportunity to gather the runes I desperately need. Recover the runes from the fallen minions of the faceless. When your need is greatest, hand me a rune and I will replenish you and your companions.");

        quest::say("Prepare youselves! You must repel the denizens of Fear itself! Good luck brave souls, I will remain here until my task is fulfilled.");

        quest::ze(1, "The walls of the temple begin to crack as the ground beneath your feet shakes violently.");

        # spawn the 2nd version of Tahia Felwah
        quest::spawn2($tahia_felwah_2_id, 0,0, 573, 1005, -94, 0);
        quest::stoptimer(1);
        # Tahia has walked to waypoint 1 (start Justicars)
        # depop version 1 of Tahia Felwah
        quest::depop();
    }
    elsif ($timer eq "FD") {
        quest::stoptimer("FD");
        
        plugin::SetAnim(dead);
    }
}
