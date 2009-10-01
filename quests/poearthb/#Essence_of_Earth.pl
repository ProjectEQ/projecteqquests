sub EVENT_SPAWN {
quest::settimer("essence",1200);
}

sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Well done.");
	quest::summonitem(29146);
     }
}

sub EVENT_TIMER {
if($timer eq "essence") {
        quest::stoptimer("essence");
        quest::depop();

     }
}