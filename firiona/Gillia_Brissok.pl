# items: 62093, 62092, 62202
sub EVENT_SAY {
if($text=~/hail/i){
quest::say("Greetings friend, it is good to be freed from the clutches of those evil creatures. Tell me are you willing to help me bring some [justice] to them?");
}
if($text=~/justice/i){
quest::say("For justice to be brought to them you will need to strike at some of the most powerful goblins found there. Seek out the goblin cave lords deep within the Temple of Droga and bring me back three Sashes of the Cave Lords. Also I will need the Earring of King Dronan. Do this and you will be well rewarded.");
}
 }
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 62093=> 1, 62092=> 3)){
quest::summonitem(62202); # Item: Copper Medal of Rapture
}
plugin::return_items(\%itemcount); # return unused items
 }
#END of FILE Zone: Firiona ID:84 - Gillia_Brissok (Gillia_Brissok.pl) 
