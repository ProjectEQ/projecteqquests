sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Greetings to you brother. Did [Keven] send you?");
}
if($text=~/keven sent me/i){
quest::say("Very well. then let us begin. We are at home in the wilderness and thus it is important that we learn all we can about our surroundings. Now is the time of your learning. You are to venture out. hunt and learn about Everfrost. Return to me with a White Wolf Skin as proof of your successful hunt. We will then continue your training."); }
}
#END of FILE Zone:halas  ID:Not_Found -- Hoyce_MacTaegan 

sub EVENT_ITEM{
if($itemcount{18847} == 1){
quest::summonitem("13574");
quest::faction("Not_Found","1");
quest::faction("Not_Found","-1");
quest::faction("10108","-1");
quest::faction("Not_Found","1");
quest::faction("Not_Found","-1"); }
}
#END of FILE Zone:halas  ID:Not_Found -- #Field_Priest_Keven 

