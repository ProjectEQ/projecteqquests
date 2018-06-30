# RoF Event

my $tahia_felwah_id_2 = 48030;

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

my $avatar_of_fear_spell_id = 2128;

# npcId = 48238
sub EVENT_SPAWN {
    
    quest::shout("Minions of fear hear me now! The temple of the great Cazic Thule has been defiled. I summon you to assist me in its cleansing!");

    # TODO now the Avatar of Fear does a grid around the room
    # pretty sure its a quest::start(wp_id)

    # 2 minutes after he pops, the first wave spawns
    quest::settimer(1, 120);

}

sub EVENT_TIMER {
    if ($timer == 1) {
        quest::stoptimer(1);
        # Start Wave Event
        quest::shout("In the name of the faceless, I command you, the minions of fear, ARISE!");

        # spawn first wave immediatley
        SPAWN_RANDOM_WAVE();
        quest::settimer(2, 100);
    }
    elsif ($timer == 2) {
        quest::stoptimer(2);
        SPAWN_RANDOM_WAVE();
        quest::settimer(3, 100);
    }
    elsif ($timer == 3) {
        quest::stoptimer(3);
        SPAWN_RANDOM_WAVE();
        quest::settimer(4, 100);
    }
    elsif ($timer == 4) {
        quest::stoptimer(4);
        SPAWN_RANDOM_WAVE();
        quest::settimer(5, 100);
    }
    elsif ($timer == 5) {
        quest::stoptimer(5);
        # Wave 5 also spawns untargetable `Avatar of Dread`
        quest::shout("In the name of the fearful one, I call forth from the abyss... DREAD!");
        quest::pause(5);
        quest::shout("Lord Cazic, grant me the power to instill fear in our enemies!");
        
        quest::spawn2($avatar_of_dread_id, 0,0, 625, 1090, -94, 388);
        $npc->CastSpell($avatar_of_fear_spell_id, 48238);

        SPAWN_RANDOM_WAVE();
        quest::settimer(6, 100);
    }
    elsif ($timer == 6) {
        quest::stoptimer(6);
        SPAWN_RANDOM_WAVE();
        quest::settimer(7, 100);
    }
    elsif ($timer == 7) {
        quest::stoptimer(7);
        SPAWN_RANDOM_WAVE();
        quest::settimer(8, 100);
    }
    elsif ($timer == 8) {
        quest::stoptimer(8);
        SPAWN_RANDOM_WAVE();
        quest::settimer(9, 100);
    }
    elsif ($timer == 9) {
        quest::stoptimer(9);
        SPAWN_RANDOM_WAVE();
        quest::settimer(10, 100);
    }
    elsif ($timer == 10) {
        quest::stoptimer(10);
        # Wave 10 also spawns untargetable `Avatar of Fright`
        quest::shout("In the name of the fearful one, I call forth from the abyss... FRIGHT!");
        quest::pause(5);
        quest::shout("Lord Cazic, empower me with the might to destroy the unbelievers!");
        
        quest::spawn2($avatar_of_fright_id, 0,0, 587, 1128, -94, 254);
        $npc->CastSpell($avatar_of_fear_spell_id, 48238);
        
        SPAWN_RANDOM_WAVE();
        quest::settimer(11, 100);
    }
    elsif ($timer == 11) {
        quest::stoptimer(11);
        SPAWN_RANDOM_WAVE();
        quest::settimer(12, 100);
    }
    elsif ($timer == 12) {
        quest::stoptimer(12);
        SPAWN_RANDOM_WAVE();
        quest::settimer(13, 100);
    }
    elsif ($timer == 13) {
        quest::stoptimer(13);
        SPAWN_RANDOM_WAVE();
        quest::settimer(14, 100);
    }
    elsif ($timer == 14) {
        quest::stoptimer(14);
        SPAWN_RANDOM_WAVE();
        quest::settimer(15, 100);
    }
    elsif ($timer == 15) {
        quest::stoptimer(15);
        # Wave 15 also spawns untargetable `Avatar of Terror`
        quest::shout("In the name of the fearful one, I call forth from the abyss... Terror!");
        quest::pause(5);
        quest::shout("Lord Cazic,  may your temple run red with the blood of the infidels!");
        
        quest::spawn2($avatar_of_terror_id, 0,0, 550, 1090, -94, 126);
        $npc->CastSpell($avatar_of_fear_spell_id, 48238);
        
        SPAWN_RANDOM_WAVE();
        quest::settimer(16, 100);
    }
    elsif ($timer == 16) {
        quest::stoptimer(16);
        SPAWN_RANDOM_WAVE();
        quest::settimer(17, 100);
    }
    elsif ($timer == 17) {
        quest::stoptimer(17);
        SPAWN_RANDOM_WAVE();
        quest::settimer(18, 100);
    }
    elsif ($timer == 18) {
        quest::stoptimer(18);
        SPAWN_RANDOM_WAVE();
        quest::settimer(19, 100);
    }
    elsif ($timer == 19) {
        quest::stoptimer(19);
        SPAWN_RANDOM_WAVE();
        quest::settimer(20, 100);
    }
    elsif ($timer == 20) {
        quest::stoptimer(20);
        # Wave 20 `Avatar of Dread` comes to life
        quest::signalwith($avatar_of_dread_id, 1, 0);
        SPAWN_RANDOM_WAVE();
        quest::settimer(21, 100);
    }
    elsif ($timer == 21) {
        quest::stoptimer(21);
        # Wave 20 `Avatar of Fright` comes to life
        quest::signalwith($avatar_of_fright_id, 1, 0);
        SPAWN_RANDOM_WAVE();
        quest::settimer(22, 100);
    }
    elsif ($timer == 22) {
        quest::stoptimer(22);
        # Wave 20 `Avatar of Terror` comes to life
        quest::signalwith($avatar_of_terror_id, 1, 0);
        SPAWN_RANDOM_WAVE();
        quest::settimer(23, 100);
    }
    elsif ($timer == 23) {
        quest::stoptimer(23);
        # Wave 20 `Avatar of Fear` comes to life
            $npc->SetSpecialAbility(24,0);
            $npc->SetSpecialAbility(25,0);
            $npc->SetSpecialAbility(35,0);
    }
}


sub SPAWN_RANDOM_WAVE {
    my $which = int(rand(8));

    if ($which == 0) {
        # blank spawn
    }
    elsif ($which == 1) {
        # 3 shiverbacks
        quest::spawn2($a_shiverback_id, 0,0, 645, 1089, -94, 388);
        quest::spawn2($a_shiverback_id, 0,0, 587, 1145, -94, 256);
        quest::spawn2($a_shiverback_id, 0,0, 534, 1089, -94, 126);
    }
    elsif ($which == 2) {
        # 3 amygdalans
        quest::spawn2($amygdalan_knight_id, 0,0, 645, 1089, -94, 388);
        quest::spawn2($amygdalan_knight_id, 0,0, 587, 1145, -94, 256);
        quest::spawn2($amygdalan_knight_id, 0,0, 534, 1089, -94, 126);
    }
    elsif ($which == 3) {
        # 5 tentacle terror
        quest::spawn2($tentacle_terror_id, 0,0, 645, 1089, -94, 388);
        quest::spawn2($tentacle_terror_id, 0,0, 587, 1145, -94, 256);
        quest::spawn2($tentacle_terror_id, 0,0, 534, 1089, -94, 126);
        quest::spawn2($tentacle_terror_id, 0,0, 587, 1090, -94, 360);
        quest::spawn2($tentacle_terror_id, 0,0, 587, 1090, -94, 360);
    }
    elsif ($which == 4) {
        # 5 gorgon
        quest::spawn2($a_gorgon_id, 0,0, 645, 1089, -94, 388);
        quest::spawn2($a_gorgon_id, 0,0, 587, 1145, -94, 256);
        quest::spawn2($a_gorgon_id, 0,0, 534, 1089, -94, 126);
        quest::spawn2($a_gorgon_id, 0,0, 587, 1090, -94, 360);
        quest::spawn2($a_gorgon_id, 0,0, 587, 1090, -94, 360);
    }
    elsif ($which == 5) {
        # 5 shiverbacks
        quest::spawn2($a_shiverback_id, 0,0, 645, 1089, -94, 388);
        quest::spawn2($a_shiverback_id, 0,0, 587, 1145, -94, 256);
        quest::spawn2($a_shiverback_id, 0,0, 534, 1089, -94, 126);
        quest::spawn2($a_shiverback_id, 0,0, 587, 1090, -94, 360);
        quest::spawn2($a_shiverback_id, 0,0, 587, 1090, -94, 360);
    }
    elsif ($which == 6) {
        # 4 amygdalans
        quest::spawn2($amygdalan_knight_id, 0,0, 645, 1089, -94, 388);
        quest::spawn2($amygdalan_knight_id, 0,0, 587, 1145, -94, 256);
        quest::spawn2($amygdalan_knight_id, 0,0, 534, 1089, -94, 126);
        quest::spawn2($amygdalan_knight_id, 0,0, 587, 1090, -94, 360);
    }
    elsif ($which == 7) {
        # 8 spiders
        quest::spawn2($a_spinechill_spider_id, 0,0, 645, 1089, -94, 388);
        quest::spawn2($a_spinechill_spider_id, 0,0, 587, 1145, -94, 256);
        quest::spawn2($a_spinechill_spider_id, 0,0, 534, 1089, -94, 126);
        quest::spawn2($a_spinechill_spider_id, 0,0, 557, 1042, -94, 120);
        quest::spawn2($a_spinechill_spider_id, 0,0, 622, 1048, -94, 382);
        quest::spawn2($a_spinechill_spider_id, 0,0, 625, 1144, -94, 286);
        quest::spawn2($a_spinechill_spider_id, 0,0, 547, 1135, -94, 194);
        quest::spawn2($a_spinechill_spider_id, 0,0, 587, 1090, -94, 360);
    }

}

sub EVENT_DEATH {
    # signal victory
    quest::signalwith($tahia_felwah_id_2, 1, 0);
    quest::depopall($unstable_rift_id);
}
