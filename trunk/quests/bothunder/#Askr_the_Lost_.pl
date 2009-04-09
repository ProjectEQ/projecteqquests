sub EVENT_SPAWN {
quest::say("All to me!");
quest::settimer(1,600);
}

sub EVENT_TIMER  {
if($timer == 1) {
quest::depop();
}
}

sub EVENT_SAY {
if($text=~/hail/i) {
$client->Message(9,"You are doing well... The Storm Lord does not stand a chance!");
quest::movepc(209,-371,-1680,2356);
}
}