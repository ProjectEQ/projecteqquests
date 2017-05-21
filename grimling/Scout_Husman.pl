sub EVENT_SPAWN {
  quest::settimer("husman",1);
}

sub EVENT_SAY {
  if($text=~/Hail/i){
	quest::say("Greetings, $name. Are you [" . quest::saylink("here to help") . "]? You've no doubt heard of the issues with the Grimlings throughout the forest. I fear we may not be able to push them back enough this time to keep our people safe from the dastardly deeds of those vile things. Reports have come in that they may be trying to come at us from the North. While it wouldn't be unheard of, such a move might prove to be a decoy for other attacks coming from the West."); 
  }
  if ($text=~/here to help/i) {
	quest::say("I'm glad to hear it. From our reports, they have a rather small group of soldiers North of here, comprising of two encampments not far from each other. We must begin pushing the Grimlings back to their mines so they cannot continue to have a stronghold in this area. For now, you must gather together a group of soldiers to venture with you to help us clear one of the camps out. When you are [" . quest::saylink("ready to go") . "], inform me of such and I will lead you to the camp where you can make preparations for battle.");
  }
  if ($text=~/ready to go/i) {
	quest::say("Right, then. We'll be making our way to their secondary camp, which we believe follows the first into battle and may be the back up lines for the first camp. Make sure you have everyone with you, we'll be making our way to the camp in just a minute.");
	quest::start(1);
  }
  if ($text=~/ready to begin/i) {
   if($x == -1234) {
	quest::say("To arms, now! Rush into the heart of the beast and emerge victorious, as we have discussed! Charge!");
	quest::unique_spawn(167663,0,0,-1228,200,37);  #counter spawn
	quest::unique_spawn(167662,0,0,-1247,535,40);   #untargetable Ukigit
	quest::settimer("return",600); #need to figure out return trip including pause
   }
  }
  if ($client->GetGlobal("beast_epic") ==17 && $text=~/end the threat in the Grimling Forest/i) {
	quest::say("Ah, I see you have come to help with the growing problem in the forest with the Grimlings. They were already a big enough problem, but some have changed and become ever more powerful and twisted. There are two in particular trying to amass a powerful following. You will mostly likely find them wandering in the forest from time to time as they recruit. Good luck to you friend.");    
 	quest::unique_spawn(167426,501017,0,-411,1188,52);  #Grimling_Colonel
	quest::unique_spawn(167726,501018,0,-411,1210,61);  #Grimling_General   
  } 
}

sub EVENT_TIMER {
if($timer eq "husman") {
  if($x == -1234) {
    quest::say("We have arrived at the second camp to the direct North of our outpost. It is up to you to clear the camp of these bothersome Grimlings so we can help to push them back into those desolate mines. Our reports suggest that they have powerful shaman who may try to stop you with spirits of the land. Do not let them consume you with their shamanistic ways, and instead focus on the rest of the Grimlings in the camp. When you are [ready to begin], let me know and I will let you loose to rid this camp of it's foul denizens.");
    quest::stoptimer("husman");
  }
 }
if($timer eq "return") {
    quest::stoptimer("return");
    quest::depop_withtimer(); #depop so he can reset the script more reliably
 }
} 
#END of FILE Zone:grimling  ID:167134 -- Scout_Husman 