sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("It is good to see you. $name!! Do not forget that the clerics of Mithaniel Marr are here to help those who pay tribute to Him. Should you require me to [cure disease]. just mention it.");
}
if($text=~/what cure disease/i){
quest::say("If you require me to cure disease. it will cost you 10 gold coins."); }
}
#END of FILE Zone:freportn  ID:8035 -- Palious_Jarten 

