# RoF Event

my $guard_khataruss_id = 48250;
my $guard_scithiss_id = 48251;
my $guard_thrasciss_id = 48249;

my $tahia_felwah_1_id = 48057;
my $tahia_felwah_2_id = 48030;

my $a_tae_ew_justicar_id = 48029;

my $unstable_rift_id = 48253;

# NPCs that can spawn during RoF
my $a_shiverback_id = 48247;
my $amygdalan_knight_id = 48248;
my $tentacle_terror_id = 48252;
my $a_gorgon_id = 48246;
my $a_spinechill_spider_id = 48245;
my $avatar_of_dread_id = 48237;
my $avatar_of_fright_id = 48239;
my $avatar_of_terror_id = 48240;

my $avatar_of_fear_id = 48238;

# npcId = 48041
sub EVENT_SPAWN {
    CLEANUP_OLD_EVENT();

    quest::spawn2($a_tae_ew_justicar_id, 0, 0, 587, 1055, -94, 0);
    quest::spawn2($a_tae_ew_justicar_id, 0, 0, 550, 1090, -94, 130);
    quest::spawn2($a_tae_ew_justicar_id, 0, 0, 587, 1128, -94, 254);
    quest::spawn2($a_tae_ew_justicar_id, 0, 0, 625, 1090, -94, 388);
    quest::spawn2($tahia_felwah_1_id, 0, 0, 590, 1070, -94, 180);
}

sub EVENT_COMBAT {
    quest::say("Fools! It isss dangerouss to interrupt the sssacrifice! Guards, assssissst me!");

    quest::spawn2($guard_khataruss_id, 0,0, 579, 996, -94, 0);
    quest::spawn2($guard_khataruss_id, 0,0, 590, 996, -94, 0);
    quest::spawn2($guard_thrasciss_id, 0,0, 601, 996, -94, 0);
}

sub EVENT_DEATH {
    quest::say("Oh facelesss one, I have fallen! Pleasse avenge the death of your faithful ssservant!");

    # Send signal to Tahia Felwah to Wake up and start event
    quest::signalwith($tahia_felwah_1_id, 1, 5);
}


sub CLEANUP_OLD_EVENT() {
    # What if HP was killed but the event was never completed
    quest::depopall($guard_khataruss_id);
    quest::depopall($guard_scithiss_id);
    quest::depopall($guard_thrasciss_id);

    quest::depopall($tahia_felwah_1_id);
    quest::depopall($tahia_felwah_2_id);

    quest::depopall($a_tae_ew_justicar_id);

    quest::depopall($unstable_rift_id);

    quest::depopall($a_shiverback_id);
    quest::depopall($amygdalan_knight_id);
    quest::depopall($tentacle_terror_id);
    quest::depopall($a_gorgon_id);
    quest::depopall($a_spinechill_spider_id);

    quest::depopall($avatar_of_dread_id);
    quest::depopall($avatar_of_fright_id);
    quest::depopall($avatar_of_terror_id);

    quest::depopall($avatar_of_fear_id);
}
