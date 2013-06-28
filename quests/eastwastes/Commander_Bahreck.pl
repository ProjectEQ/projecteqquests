sub EVENT_SPAWN {
quest::shout("For the honor of Rallos Zek! Attack!");
quest::spawn2(116553, 0,0, ($x + 150), ($y + 15), $z, $h);
quest::spawn2(116553, 0,0, ($x + 100), ($y + 75), $z, $h);
quest::spawn2(116553, 0,0, ($x + 150) , ($y - 15), $z, $h);
quest::spawn2(116553, 0,0, ($x + 100) , ($y - 75), $z, $h);
quest::spawn2(116553, 0,0, ($x - 10), $y, $z, $h);
#quest::spawn2(KROMRIFF SOLIDER ID, 0,0, -2089, 98, 147, 29);
#quest::spawn2(KROMRIFF SOLIDER ID, 0,0, -2112, 98, 147, 29);

}

sub EVENT_DEATH_COMPLETE {

quest::signal(116119, 0);

}
