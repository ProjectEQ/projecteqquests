sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to intelligence. young $name! Did you think all ogres were inept? Ha!! I hope you show the glimmer. we shamans need more within our ranks. Our race needs to evolve!! So. are you one of the smart ogres or have I spoken too many syllables?");
}
if($text=~/I am a smart ogre/i){
quest::say("Well. I suppose your intelligence shall grow. You will have to do. I have a mission for you. First. go and speak with Grevak of the Greenblood Knights. He will have a job for you. After you have performed some manner of service and advanced at least 5 ranks. return to me and ask me about my secret mission.");
}
if($text=~/what secret mission/i){
quest::say("I have heard of your advancements. You are a fine addition to Oggok. I require your skill in handling a delicate matter. I want you to run out to the Bouncer's keep near the entrance to Oggok. There. you shall find a froglok named Glib. He will pose no threat to you. He has come on business and I have promised him protection. Tell him the Greenblood shaman sent you. He shall fill you in. Go at once."); }
}
#END of FILE Zone:oggok  ID:49038 -- Marda 

