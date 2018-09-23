sub EVENT_DEATH_COMPLETE {
	quest::signalwith(162255,1,0);
	quest::setglobal("glyphed_dead",1,3,"D3");
}

sub EVENT_SPAWN {
	quest::ze(0, "A roar fills the lower temple halls! The smell of burning ozone and decay fills the air!");
}
