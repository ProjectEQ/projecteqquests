# items: 62097, 62096, 62204
sub EVENT_SAY {
if($text=~/hail/i){
quest::say("The feeling of freedom is good indeed, greetings wanderer. Having escaped the clutches of the drogan goblins I desire for them to know the true meaning of fear. Will you help teach them the meaning of [fear]?");
}
if($text=~/fear/i){
quest::say("Very well head to the Temple of Droga and seek out the so called goblin bone depredators. Slaughter them until you have three Blades of the Depredator and bring those back. Also seek out the Jailor Maufan and bring back the Mark of Imprisonment. Do this and I shall reward you well.");
}
 }
sub EVENT_ITEM {
if (plugin::check_handin(\%itemcount, 62097=> 1, 62096=> 3)){
quest::summonitem(62204); # Item: Aged Earring of Aptitude
quest::exp("1000");
quest::givecash(2,1,5,2); 
}
plugin::return_items(\%itemcount); # return unused items
 }
#END of FILE Zone:lakeofillomen ID:85 - Pagik_Tsissun (Pagik_Tsissun.pl) 