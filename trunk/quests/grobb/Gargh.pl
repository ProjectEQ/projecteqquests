sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("You [friend of Gardunk]? Meez friend of Gardunk.");
}
if($text=~/i am a friend of gardunk/i){
quest::say("Dat good. He tell meez you was comin'. Meez learn you to fight like alligator. Dominate through fear. Dat is what we do. Strike fear into heart of enemies. You [ready to start]?");
}
if($text=~/i am ready to start/i){
quest::say("Good. We start easy. You go and kill snakes. Skin da snake and bring me da Snake Scales and a Fang. Dat your first task."); 
}
if ($text=~/learn about da animals/i) {
  quest::say("We start with da wolf. You go to da forest and kill wolfies. Bring back to me four of da Ruined Wolf Pelts to prove what yooz done.");
}
if ($text=~/fight like da alligator/i) {
  quest::say("Best way to do dat is to fight alligators. But dere no alligators around, so we improvise. Hunt down da spiders in the forest and tear dere little legs off. Bring back two of those to Gargh");
}
if ($text=~/What next part of my training/i) {
  quest::say("For da next part of your training you go and strike terror into da snakes again. Only not the little ones. You go and you skin the scales from a garter snake. You bring meez back one large snake skin. Meez be waiting for you here if you make it back alive.");
}
if ($text=~/one more task/i) {
  quest::say("You is getting stronger. It time for you to spread fear to da little halflings. Scour the forest until you find dem. You go and spread fear to them. Fight them. You peel off dere hides. Bring me four Matted Halfling Hides.");
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13070 => 1, 13067 => 1)) {
    quest::say("You done good. You begin to know fear by causing fear. Next you learn about da animals. You learn about da animals by fighting dem and tearing them apart. You ready to [learn about da animals]?");
    quest::summonitem(7380);
    quest::faction( 70, 10);
    quest::faction( 292, 10);
    quest::faction( 106, -10);
  }
  if (plugin::check_handin(\%itemcount, 13782 => 4)) {
    quest::say("So you know all about da wolf now. Dat is good. Next step is important. You need to learn to [fight like da alligator].");
    quest::summonitem(7381);
    quest::faction( 70, 10);
    quest::faction( 292, 10);
    quest::faction( 106, -10);
  }
  if (plugin::check_handin(\%itemcount, 13417 => 2)) {
    quest::say("Ok meez believe you. Here your reward. Meez think you just about ready for [next part of your training].");
    quest::summonitem(7382);
    quest::faction( 70, 10);
    quest::faction( 292, 10);
    quest::faction( 106, -10);    
  }
  if (plugin::check_handin(\%itemcount, 13060 => 1)) {
    quest::say("You did it! You cause lots of fear for them. Dat good. Even da spirits are starting to tremble. Soon you will be able to make dem do
what you want. But there is [one more task] meez want you to do.");
    quest::summonitem(7383);
    quest::faction( 70, 10);
    quest::faction( 292, 10);
    quest::faction( 106, -10);   
  }
  if (plugin::check_handin(\%itemcount, 22572 => 4)) {
    quest::say("You did it! You cause lots of fear for them. Dat good. Even da spirits are starting to tremble. Soon you will be able to make dem do
what you want. You have passed your final test.");
    quest::summonitem(7384);
    quest::faction( 70, 10);
    quest::faction( 292, 10);
    quest::faction( 106, -10);      
  }
}
#END of FILE Zone:grobb  ID:40011 -- Gargh 

