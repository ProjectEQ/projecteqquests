sub EVENT_COMBAT {
    if($combat_state == 0) {
        $npc->SaveGuardSpot($x, $y, $z, $h);
    }
}
