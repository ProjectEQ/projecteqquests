sub EVENT_SPAWN {
if ($zonetime < 800 || $zonetime > 1999) {
	quest::moveto(-639,-85,-24.75,16.5);
}
else {
	quest::start(35);
}
 }
 