#spawn Vallon Zek
sub EVENT_DEATH {
        quest::signalwith(214112, 214056, 0);
}

sub EVENT_SIGNAL {
        quest::depop();
}

# End of File  Zone: PoTactics  ID: 214056 -- Decorin_Berik