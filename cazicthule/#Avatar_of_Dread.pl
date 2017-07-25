# RoF Event

# npcId = 48237
sub EVENT_SPAWN {
    
}

sub EVENT_SIGNAL {
    # signal 1 = Come to Life
    if ($signal == 1) {
        e.self.SetSpecialAbility(24, 0);
        e.self.SetSpecialAbility(25, 0);
        e.self.SetSpecialAbility(35, 0);
    }
}