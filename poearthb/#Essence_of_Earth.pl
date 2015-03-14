sub EVENT_SPAWN {
quest::settimer("essence",1200);
}

sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::setglobal("pop_earthb_rathe", 1, 5, "F");
	quest::summonitem(29146);
        $client->Message(4,"You receive a character flag!");
     }
}

sub EVENT_TIMER {
if($timer eq "essence") {
        quest::stoptimer("essence");
        quest::depop();

     }
}