#Spawn Tallon Zek
sub EVENT_DEATH {
        quest::signalwith(214112, 214057, 0);
}

sub EVENT_SIGNAL {
        quest::depop();
}

# End of File  Zone: PoTactics  ID: 214057 -- Decorin_Grunhork