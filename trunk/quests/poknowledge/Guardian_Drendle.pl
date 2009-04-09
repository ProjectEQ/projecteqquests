sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to [New Tanaan]. friend!  Enjoy your visit and may your quest for enlightenment be a pleasant one!");
}
if($text=~/what is New Tanaan?/i){
quest::say("New Tanaan is a haven for knowledge and those who seek it. and exists outside of all normal physical and political boundaries.  If you are [looking] for something. you've come to the right place.  A magically enforced peace exists throughout the city.  No one is able to wield a weapon or cast harmful magic here. making crime almost non-existent.  The city is divided into several sections -- [Kartis]. the dark district; [Tanaan]. the neutral district; [Selia]. the light district; [Jeral] Abbey. the trade plaza; and of course [Myrist]. the Great Library."); }
}
#END of FILE Zone:poknowledge  ID:202114 -- Guardian_Drendle 

