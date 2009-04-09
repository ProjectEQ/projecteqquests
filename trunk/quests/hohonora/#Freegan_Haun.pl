sub EVENT_SIGNAL {
$bossman=1;
quest::signalwith(211081,9,1);
}

sub EVENT_DEATH {

{
quest::signalwith(211081,8,0);
quest::signal(211079);
quest::signal(211078);
quest::signal(211077);
}

if($bossman == 1) {
quest::spawn2(202368,0,0,$x,$y,$z,$h);
$bossman=undef;
}}