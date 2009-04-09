sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings, young one! There are many tasks to be performed aside from your studies to truly harness the powers passed down to us by our ancestor [Miragul]. The most basic of these tasks is the gathering of bat wings and snake fangs from the yard outside our city. I will reward you for every two bat wings and two snake fangs you bring to me.");
}
if($text=~/what miragul/i){
quest::say("You do not know of Miragul?!! You have more to learn of the heritage of the Dark Truth than at first I thought. Miragul was the first High Man to unlock the secrets of necromancy and is the founder of our city as well as the creator of the treacherous Hole.");
}
if($text=~/who is miragul/i){
quest::say("You do not know of Miragul?!! You have more to learn of the heritage of the Dark Truth than at first I thought. Miragul was the first High Man to unlock the secrets of necromancy and is the founder of our city as well as the creator of the treacherous Hole.");
}
if($text=~/what about miragul?/i){
quest::say("You do not know of Miragul?!! You have more to learn of the heritage of the Dark Truth than at first I thought. Miragul was the first High Man to unlock the secrets of necromancy and is the founder of our city as well as the creator of the treacherous Hole.");
}
if($text=~/tell me about miraguls/i){
quest::say("You do not know of Miragul?!! You have more to learn of the heritage of the Dark Truth than at first I thought. Miragul was the first High Man to unlock the secrets of necromancy and is the founder of our city as well as the creator of the treacherous Hole.");
}
if($text=~/tell me about miragul/i){
quest::say("You do not know of Miragul?!! You have more to learn of the heritage of the Dark Truth than at first I thought. Miragul was the first High Man to unlock the secrets of necromancy and is the founder of our city as well as the creator of the treacherous Hole."); }
}
sub EVENT_ITEM { 
if($itemcount{18018} == 1){
quest::say("You are welcomed into the fold.  Now go out, and prove yourself, young one.  You have much to learn about the Dark Truth.");
quest::summonitem("13551");
quest::faction("302","1");
quest::faction("Not_Found","-1");
quest::faction("Not_Found","-1");
quest::faction("Not_Found","-1");
quest::faction("Not_Found","-1");
}
if($itemcount{13069} == 4 && $itemcount{13068} == 1 && $itemcount{13067} == 2){
quest::say("Very good, young acolyte. Maintain your diligence in your duties and you will quickly learn the secrets of the Dark Truth.");
quest::summonitem("15338","1");
quest::faction("302","1");
quest::faction("Not_Found","-1");
quest::faction("Not_Found","-1");
quest::faction("Not_Found","-1");
quest::faction("Not_Found","-1");
}
if($itemcount{13069} != 4 && $itemcount{13068} != 1 && $itemcount{13067} != 2){
quest::say("You must gather all four of the required items in order to receive your reward. I expect more reliability from you in the future."); }
}
#END of FILE Zone:paineel  ID:75091 -- Coriante_Verisue 

