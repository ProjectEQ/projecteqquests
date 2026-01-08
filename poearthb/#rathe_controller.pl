###############################################
# Plane of Earth B - Rathe / Avatar Controller
# Version: No global lockout + Quest debug lines
###############################################

sub EVENT_SPAWN {
    # Ensure Rathe preload is off
    quest::spawn_condition($zonesn, 1, 0);

    # Log to server that the controller initialized
    quest::ze(15, "Quest: Earth event controller initialized. Preparing Rathe Council...");

    # Start 1-second timer to bring up Rathe
    quest::settimer("rathe", 1);
}

sub EVENT_SIGNAL {
    # Someone signaled a reset or re-check
    quest::ze(15, "Quest: Received event signal. Resetting Rathe Council sequence...");

    quest::settimer("rathe", 1);
}

sub EVENT_TIMER {

    ##################################
    # TIMER: "rathe"
    ##################################
    if ($timer eq "rathe") {
        quest::stoptimer("rathe");

        # Activate Rathe Council spawn condition
        quest::spawn_condition($zonesn, 1, 1);
        quest::ze(15, "Quest: Rathe Council has manifested in the battlefield.");

        # Start avatar watcher
        quest::settimer("avatar", 1);
        quest::ze(15, "Quest: Watching for the fall of the Rathe Council...");
    }

    ##################################
    # TIMER: "avatar"
    ##################################
    if ($timer eq "avatar") {

        my $boss_alive = 0;

        # Check boss #1
        my $check = $entity_list->GetMobByNpcTypeID(222008);
        if ($check) {
            $boss_alive = 1;
        }

        # Check boss #2
        $check = $entity_list->GetMobByNpcTypeID(222013);
        if ($check) {
            $boss_alive = 1;
        }

        # If no bosses remain...
        if ($boss_alive == 0) {
            quest::stoptimer("avatar");

            # Depop Rathe Council
            quest::spawn_condition($zonesn, 1, 0);
            quest::ze(15, "Quest: The Rathe Council has been defeated. Their power fades...");

            # Spawn Avatar of Earth
            quest::spawn2(222014, 0, 0, 2051.1, 407.7, -219.2, 0);
            quest::ze(15, "Quest: The Avatar of Earth rises in response to the shifting balance!");
        }
    }
}
