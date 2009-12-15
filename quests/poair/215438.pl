sub EVENT_SPAWN {
quest::settimer(55,1200);
 }

sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::setglobal("pop_wind_xegony_projection", 1, 5, "F");
	$client->Message(4,"You receive a character flag!");
	quest::summonitem(29164);
 }
}
sub EVENT_TIMER {
if($timer == 55) {
	quest::stoptimer(55);
	quest::depop();
	}
}
