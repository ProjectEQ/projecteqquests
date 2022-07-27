# items: 66616, 66602, 66603, 66601, 25805, 25833, 25814, 25807, 25825, 25838, 25831, 16880, 17966, 66614, 14521, 11631, 66613, 14402, 96454, 96456, 96465, 96453, 96455, 96459, 96458, 96462, 96457, 96463, 96451, 96461, 96464, 96452, 96460, 7466, 1139, 1152, 1140, 7479, 1138, 66615
sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to Shandeling's Casino! If you would like to try your luck at a game of chance, I can offer you a game of King's Court with prizes best suited for any warrior, monk, or rogue. To play, buy a token from any of the waitresses and hand it to me when ready."); 
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
elsif($itemcount{66616} && $random_result>601 && $random_result<1300){  
quest::summonitem(quest::ChooseRandom(66602,66603,66601)); # Item(s): Club Sandwich (66602), King's Court Sandwich (66603), Roasted Mammoth Sandwich (66601)

 }
#gems
elsif($itemcount{66616} && $random_result>1301 && $random_result<1900){  
quest::summonitem(quest::ChooseRandom(25805,25833,25814,25807,25825,25838,25831)); # Item(s): Black Marble (25805), Crushed Black Marble (25833), Flawless Diamond (25814), Pristine Emerald (25807), Flawed Sea Sapphire (25825), Crushed Flame Emerald (25838), Crushed Coral (25831)

 }
#fireworks
elsif($itemcount{66616} && $random_result>1901 && $random_result<2400){  
quest::summonitem(16880); # Item: Gnomish Firework

 }
 #potions
elsif($itemcount{66616} && $random_result>2401 && $random_result<2800){  
quest::summonitem(quest::ChooseRandom(17966,66614,14521,11631,66613,14402,96454,96456,96465,96453,96455,96459,96458,96462,96457,96463,96451,96461,96464,96452,96460)); # Item(s): Deluxe Sewing Kit (17966), Elixir (66614), Illusionists Stone (14521), Prayers of Life (11631), Vial of Ethereal Mist (66613), Vial of Swirling Smoke (14402), Essence of Troll (96454), Essence of Wood Elf (96456), Essence of Vah Shir (96465), Essence of Ogre (96453), Essence of Iksar (96455), Essence of Human (96459), Essence of High Elf (96458), Essence of Halfling (96462), Essence of Half Elf (96457), Essence of Gnome (96463), Essence of Froglok (96451), Essence of Erudite (96461), Essence of Dwarf (96464), Essence of Dark Elf (96452), Essence of Barbarian (96460)

 }
 #stat items
elsif($itemcount{66616} && $random_result>2801 && $random_result<3000){  
quest::summonitem(quest::ChooseRandom(7466,1139,1152,1140,7479,1138)); # Item(s): Beer Goggles (7466), Blue Resistance Stone (1139), Green Resistance Stone (1152), Red Resistance Stone (1140), Snakefingers (7479), White Resistance Stone (1138)

 }
 #golden ticket
elsif($itemcount{66616} && $random_result==3001){  
quest::summonitem(66615); # Item: Gold Ticket

 }
   }