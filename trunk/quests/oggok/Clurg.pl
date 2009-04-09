sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hello. friend. Have a drink. I have some [unique drinks]. Try one. And remember. You get rowdy. the [Bouncers] crush you.");
}
if($text=~/what bouncers/i){
quest::say("The Bouncers were organized by me. As I traveled to many of the world's taverns I encountered great enforcers called bouncers. It was their duty to keep order amongst chaos. When I returned and rose to greatness after the creation of the [Flaming Clurg]. I organized the Oggok Bouncers to keep order amongst the [rival guilds].");
}
if($text=~/what flaming clurg/i){
quest::say("The Flaming Clurg was my greatest creation. It brought me great respect in Oggok. Unfortunately. I have heard tales of an [imposter drink].");
}
if($text=~/what imposter drink/i){
	quest::say("Bah! Dat damned Pungla! She be imitatin me drinks! I want som'on to [deal] with dat damned witch! If som'on wud jus bring me her head, I wud pay em!");
	quest::say("Find ways to help all in Oggok. Then we will have conversation.");
}
if($text=~/what rival guilds/i){
quest::say("Oggok has been the battleground for the feud between the Greenblood knights and shamans and the Craknek warriors. It is fueled by the superior intellect of the Greenbloods. Few remember that I. Clurg. was once dim. but now I speak with great words.");
}
}


sub EVENT_ITEM
{
 if(plugin::check_handin(\%itemcount, 13740 => 1))
  {
   quest::say("Ahahaha! Dat witch sur did get wat was commin ta her!");
   quest::givecash(0,0,0,5);
  }
if(plugin::check_handin(\%itemcount, 13379 => 1)){
   quest::summonitem(13380);
   quest::faction(46, 10);
   quest::faction(39, -30);
   quest::faction(169, -30);
 }
plugin::return_items(\%itemcount);
}

#END of FILE Zone:oggok  ID:49046 -- Clurg 

