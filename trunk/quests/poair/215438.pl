sub EVENT_SPAWN {
quest::settimer(55,1200);
 }

sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Well done.");
	quest::summonitem(29164);
 }
}
sub EVENT_TIMER {
if($timer == 55) {
	quest::stoptimer(55);
	quest::depop;
	}
}
