#Spawn Tallon Zek
sub EVENT_DEATH {
        quest::signalwith(214112, 214057, 0);
}

sub EVENT_SIGNAL {
        quest::depop();
}

sub EVENT_SPAWN {
        if (defined $qglobals{pop_rallos_respawn_flag}) {
                quest::depop();
        }
}

# End of File  Zone: PoTactics  ID: 214057 -- Decorin_Grunhork