# items: 29163
sub EVENT_SPAWN {

quest::settimer(55,1200);

 }

sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Well done.");
	quest::setglobal("pop_water_coirnav_projection", 1, 5, "F");
        quest::summonitem(29163); # Item: Sphere of Coalesced Water
	$client->Message(4,"You receive a character flag!");
	}
}

sub EVENT_TIMER {

if($timer == 55) {

	quest::stoptimer(55);

	quest::depop();

	}

}
