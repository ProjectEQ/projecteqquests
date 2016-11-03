#banish random PC every 60 seconds

sub EVENT_AGGRO {
    quest::settimer("banish_random_client", 60);
}

sub EVENT_DEATH_COMPLETE {
    quest::stoptimer("banish_random_client");
}

sub EVENT_TIMER {
    if($timer eq "banish_random_client") {
        my @hatelist = $npc->GetHateList();
        $n = 0;
        foreach $ent (@hatelist) {
            my $h_ent = $ent->GetEnt();
            if($h_ent & $h_ent->IsClient()) {
                $n++;
            }
        }
        $random_client = rand($n);
        $n = 0;
        foreach $ent (@hatelist) {
            my $h_ent = $ent->GetEnt();
            if($h_ent & $h_ent->IsClient()) {
                if($random_client == $n){
                    $h_ent->GMMove(1864.94, 941.05, -254.0, 0);
                    quest::debug($h_ent->GetCleanName() . " has been randomly selected to be banished");
                }
                $n++;
            }
        }
        quest::stoptimer($timer);
    }
}
