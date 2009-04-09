my $varone = 0;
my $vartwo = 0;
my $varthree = 0;
my $roomone = 0;
my $roomtwo = 0;
my $roomthree = 0;
my $boss = 0;

sub EVENT_SPAWN {
quest::settimer(1,1);
}

sub EVENT_TIMER {
{
quest::stoptimer(1);
quest::settimer(1,1);
}


if($timer == 1 && ($varone == 3 || $vartwo == 3 || $varthree == 3)) {
quest::signal(211077);
quest::signal(211078);
quest::signal(211079);
quest::signal(211080);
quest::signal(211083);
quest::signal(211082);
}

if($timer == 1 && $roomone == 5) {
quest::spawn2(211085,0,0,-2349,-1894,-113,233);
$roomone=undef;
}
if($timer == 1 && $roomtwo == 5) {
quest::spawn2(211084,0,0,-3337,-1617,-113,76.2);
$roomtwo=undef;
}
if($timer == 1 && $roomthree == 5) {
quest::spawn2(211086,0,0,-2996,-991,-113,153);
$roomthree=undef;
}
if($timer == 1 && $boss == 2) {
quest::signalwith(211085,1,1);
quest::signalwith(211084,1,1);
quest::signalwith(211086,1,1);
}

if($timer == 2) {
quest::signal(211085,1);
quest::signal(211084,1);
quest::signal(211086,1);
quest::signal(211080,1);
quest::signal(211082,1);
quest::signal(211083,1);
quest::signal(211087,1);
quest::signal(211088,1);
quest::signal(211089,1);
$roomone=undef;
$roomtwo=undef;
$roomthree=undef;
$varone=undef;
$vartwo=undef;
$varthree=undef;
}

}

sub EVENT_SIGNAL {
   if($signal == 1) {
       $varone=$varone+1;
       }

   if($signal == 2) {
       $vartwo=$vartwo+1;
       }

   if($signal == 3) {
       $varthree=$varthree+1;
        }
   if($signal == 4) {
       $eventstart=1;
       quest::settimer(2,7200);
       }
if($signal == 5) {
       $roomone=$roomone+1;
       quest::settimer(2,7200);
       }
if($signal == 6) {
       $roomtwo=$roomtwo+1;
       quest::settimer(2,7200);
       }
if($signal == 7) {
       $roomthree=$roomthree+1;
       quest::settimer(2,7200);
       }
if($signal == 8) {
       $boss=$boss+1;
       quest::settimer(2,7200);
       }
if($signal == 9) {

       $boss=undef;
}
}