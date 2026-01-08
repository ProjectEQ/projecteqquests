sub EVENT_SPAWN {
    quest::say("All to me!");
    quest::settimer(1, 1800); # 30-minute despawn
}

sub EVENT_TIMER {
    if ($timer eq "1") {
        quest::stoptimer(1);
        quest::depop();
    }
}

sub EVENT_SAY {
    if ($text =~ /hail/i) {
        $client->Message(9, "Kill the stormlord!");
        # Move within the SAME instance (no zoning)
        # Original movepc was: bothunder (209) to -727, -1662, 1728
        $client->GMMove(-727, -1662, 1728, 0);  # heading 0 (adjust if needed)
    }
}
