sub EVENT_COMBAT {
  if ($combat_state == 1) {
    quest::settimer("banish", 60);
  }
  else {
    quest::stoptimer("banish");
  }
}

sub EVENT_TIMER {
    if ($timer eq "banish") {
        my @nlist = $entity_list->GetNPCList();
        foreach my $n (@nlist) {
            if ($n->GetCleanName()=~/A_Rathe_Councilman/i) {
                $n->Say("Found me");
                if (!$n->IsMezzed()) {
                    $n->Say("I am not mezzed.");
                }
                else {
                    $n->Say("I am mezzed.");
                }
            }
        }
    }
}
