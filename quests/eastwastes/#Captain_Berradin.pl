sub EVENT_SPAWN {
quest::doanim(16);
quest::say("uuugghh I dont feel so good...");
}

sub EVENT_AGRO {
quest::shout("Yer messin with the wrong Coldain, prepare ta meet yer ancestors!");
}