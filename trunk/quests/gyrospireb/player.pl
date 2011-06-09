#
# quests/gyrospireb/player.pl
#
# Script for opening all parts of the four part doors when a player clicks on any part.
#
sub EVENT_CLICKDOOR
{
        @multipartdoors = ([58, 59, 60, 61], [62, 63, 64, 65], [66, 67, 68, 69], [70, 71, 72, 73], [78, 79, 80, 81],
                           [82, 83, 84, 85], [86, 87, 88, 89], [90, 91, 92, 93], [94, 95, 96, 97], [98, 99, 100, 101],
                           [102, 103, 104, 105], [106, 107, 108, 109], [110, 111, 112, 113], [120, 121, 122, 123],
                           [125, 126, 127, 128], [129, 130, 131, 132], [133, 134, 135, 136], [137, 138, 139, 140],
                           [141, 142, 143, 144]);

        for $row ( @multipartdoors )
        {
                if(($doorid >= @$row[0]) && ($doorid <= @$row[3]))
                {
                        for $d ( @$row)
                        {
                                if($d != $doorid)
                                {
                                        quest::forcedooropen($d);
                                }
                        }
                        return;
                }
        }
}
sub EVENT_ENTERZONE {
if (defined $qglobals{whimsy}) {
quest::delglobal("whimsy");
}
if($hasitem{69059}) { 
  quest::settimer(1,72);
  }
}
sub EVENT_TIMER  {
$whimsy_count++;
if($whimsy_count == 1) {
 quest::setglobal("whimsy",1,5,"F");
 }
if($whimsy_count == 2) {
 quest::setglobal("whimsy",2,5,"F");
 }
if($whimsy_count == 3) {
 quest::setglobal("whimsy",3,5,"F");
 }
if($whimsy_count == 4) {
 quest::setglobal("whimsy",4,5,"F");
 }
if($whimsy_count == 5) {
 quest::setglobal("whimsy",5,5,"F");
 }
if($whimsy_count == 6) {
 quest::setglobal("whimsy",6,5,"F");
 }
if($whimsy_count == 7) {
 quest::setglobal("whimsy",7,5,"F");
 }
if($whimsy_count == 8) {
 quest::setglobal("whimsy",8,5,"F");
 }
if($whimsy_count == 9) {
 quest::setglobal("whimsy",9,5,"F");
 }
if($whimsy_count == 10) {
 quest::setglobal("whimsy",10,5,"F");
 quest::stoptimer(1);
 }
}
