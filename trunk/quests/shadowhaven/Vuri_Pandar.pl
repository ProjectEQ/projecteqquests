sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to Shandeling's Casino! If you would like to try your luck at a game of chance, I can offer you a game of King's Court with prizes best suited for any druid, shaman, or cleric. To play, buy a token from any of the waitresses and hand it to me when ready."); 
}
 }
 
sub EVENT_ITEM {
$random_result = 0;
my $random_result = int(rand(5000));
#tokens
if($itemcount{66616} && $random_result<600 ){  
quest::summonitem(66616,quest::ChooseRandom(1,1,1,2,2,5,10,15,20));

 }
#stat food
elsif($itemcount{66616} && $random_result>601 && $random_result<1300){  quest::summonitem(quest::ChooseRandom(66610,66611,66612));

 }
#gems
elsif($itemcount{66616} && $random_result>1301 && $random_result<1900){  
quest::summonitem(quest::ChooseRandom(25805,25833,25814,25807,25825,25838,25831));

 }
#fireworks
elsif($itemcount{66616} && $random_result>1901 && $random_result<2400){  
quest::summonitem(16880);

 }
 #potions
elsif($itemcount{66616} && $random_result>2401 && $random_result<2800){  
quest::summonitem(quest::ChooseRandom(17966,66614,14521,66613,14402,96454,96456,96465,96453,96455,96459,96458,96462,96457,96463,96451,96461,96464,96452,96460));

 }
 #stat items
elsif($itemcount{66616} && $random_result>2801 && $random_result<3000){  
quest::summonitem(quest::ChooseRandom(7466,1139,1152,1140,7479,1138));

 }
 #golden ticket
elsif($itemcount{66616} && $random_result==3001){  
quest::summonitem(66615);

 }
   }