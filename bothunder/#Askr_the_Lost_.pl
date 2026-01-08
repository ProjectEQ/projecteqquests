sub EVENT_SPAWN {
    quest::say("All to me!");
    quest::settimer(1,1800);
}

sub EVENT_TIMER {
    if ($timer eq "1") {
        quest::depop();
    }
}

sub EVENT_SAY {
    if ($text=~/hail/i) {
        $client->Message(9, "You are doing well... The Storm Lord does not stand a chance!");
        # Move player within the same instance instead of zoning them out
        $client->GMMove(-663, -1738, 2254, 0); # Same coords, no zone change
    }
}
