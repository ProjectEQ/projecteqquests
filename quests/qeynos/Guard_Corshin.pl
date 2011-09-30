sub EVENT_SIGNAL {
  if($signal == 1) {
    quest::say("Yes, sir!");
	}
  if($signal == 2) {
	quest::say("Shhhhh. What are you, crazy?! I saw Kane talking to him yesterday. I sure don't want to find you washed up under the docks because of that little gnoll dropping.");
	}
}



sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail, $name!  Guard Corshin Kiniss, at your service. You should be careful in Qeynos after dark. We have had several [bodies] wash up under the docks over the past few weeks. We wouldn't want anything to happen to you.");
}
if($text=~/what bodies/i){
quest::say("We think the bodies are washing out of the aqueducts beneath Qeynos. It is a dangerous place to go and Commander Bayle refuses to send regular patrols down there."); }
}
#END of FILE Zone:qeynos  ID:2160 -- Guard_Corshin 

