sub EVENT_SPAWN {
quest::settimer(5,1200);
}

sub EVENT_TIMER {
if($timer == 5) {
quest::depop();
}
}

sub EVENT_SIGNAL { 
if($signal == 1) {
quest::say("'You fool!  You did not earn this prize on your own!  The contract that has been drawn is now invalid.  You will never leave my grasp, prepare your soul for eternal torment!");
}
if($signal == 2) {
quest::emote("laughs heartily and then vanishes in a swirl of incorporeal mist.");
quest::emote("begins to cast the gate spell.");
eq.depop();
}
}
