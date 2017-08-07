# RoF Event

my $a_tae_ew_justicar_id = 48029;

my $tahia_felwah_2_id = 48030;

# npcId = 48057
sub EVENT_SPAWN {
    $npc->SetAppearance(3);
}

sub EVENT_SIGNAL {
    # signal 1 = Wake Tahia Up 
    if ($signal == 1) {
        quest::say("Brave adventurers, I am Tahia Felwah, and I owe you my life. I was to be a sacrifice to the faceless. Listen to my words carefully, there isn't much time now.");

        quest::pause(9);
        
        quest::SetRunning(0);
        quest::pathto(573, 1005, -94);
        quest::say("You have interrupted a complicated ritual and soon the rift to the Faceless will become unstable. I must collect three runes of the Faceless for my research. I have been appointed to uncover the source of these lizards' newfound power. If I fail, their kind will surely spread across the land and threaten the balance of Norrath.");

        quest::settimer(1, 12);

    }
    
}

sub EVENT_TIMER {
    if ($timer == 1) {
        quest::stoptimer(1);

        # Tahia has walked to waypoint 1 (start Justicars)

        quest::say("This failed ritual presents a unique opportunity to gather the runes I desperately need. Recover the runes from the fallen minions of the faceless. When your need is greatest, hand me a rune and I will replenish you and your companions.");

        quest::pause(14);

        quest::say("Prepare youselves! You must repel the denizens of Fear itself! Good luck brave souls, I will remain here until my task is fulfilled.");

        quest::pause(4);
        
        quest::ze(1, "The walls of the temple begin to crack as the ground beneath your feet shakes violently.");

        # signal Justicars
        quest::signalWith($a_tae_ew_justicar_id, 1, 0);


        # spawn the 2nd version of Tahia Felwah
        quest::spawn2($tahia_felwah_2_id, 0,0, 573, 1005, -94, 0);

        # depop version 1 of Tahia Felwah
        quest::depop();
    }
}
