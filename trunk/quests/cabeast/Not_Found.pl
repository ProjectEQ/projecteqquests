sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Hail. citizen. I hope that you are here to assist.  We are gathering Crusaders to make an assault on the Libraries of Chardok.  The slave creations have thrived in their sanctuary for too long.  The tomes and texts they have stolen to fill their library belong us.  They are even rumored to have a text on the Sacred Khukri of Rile. the Greenmist.  If you see such a tome. you must bring it to me immediately.  May Cazic-Thule guide you!"); }
}
#END of FILE Zone:cabeast  ID:Not_Found -- Librarian_Zimor 

sub EVENT_ITEM{
if($itemcount{"Klok's Seal"} == 1){#Nonexistent: Klok's Seal
quest::say("Oh! thank you! I did not expect to hear of my family ever again. This seal should grant me protection out of the city if I am careful. Please take this note to my father and let him know I am safe!");
quest::summonitem("26644"); #Nonexistent: 'a sealed letter', 'father, I am well, I will be living among the elves now, Love Tayla'
quest::exp("200"); }
}
#END of FILE Zone:cabeast  ID:Not_Found -- Half 

