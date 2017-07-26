# RoF Event

# npcId = 48240
sub EVENT_SPAWN {
    
}

sub EVENT_SIGNAL {
    # signal 1 = Come to Life
    if ($signal == 1) {
        $npc->SetSpecialAbility(24,0);
        $npc->SetSpecialAbility(25,0);
        $npc->SetSpecialAbility(35,0);
    }
}
