# a_protector_of_growth #127003 

sub ScanForKOS() {
    # Find visible non-GM enemies
    my @cenemies;
    foreach $pc (@clist) {
        next if $pc->Admin() || $pc->GetFeigned() || $pc->IsInvisible($npc);

        $pcfaction = $pc->GetCharacterFactionLevel(226); # Clerics of Tunare
        push(@cenemies, $pc) if ($pcfaction < -750);
    }

    # Wait until there are at least 3 enemies in zone
    return if (scalar(@cenemies) < 3);
    
    # Aggro a random enemy PC
    my $pctarget = $cenemies[rand @cenemies];
    if ($pctarget) {
        quest::ze(15, "You hear a horn sound in the distance.");
        quest::attack($pctarget->GetName());
        quest::stoptimer("scanforkos");
    }
}

sub EVENT_SPAWN {
    quest::settimer("scanforkos", 120);
}

sub EVENT_TIMER {
    if ($timer eq "scanforkos") {
        ScanForKOS();
    } 
}

sub EVENT_COMBAT {
    if ($combat_state == 0) {
        quest::settimer("scanforkos", 120);
        ScanForKOS();
    }
}

# END a_protector_of_growth #127003 
