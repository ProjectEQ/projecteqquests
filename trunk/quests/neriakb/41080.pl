sub EVENT_SPAWN {
if ($zonetime < 805 || $zonetime > 1999) {
	quest::moveto(-630,-71,-24.75,162);
}
	
else {
	quest::start(36);
	}

 }
 