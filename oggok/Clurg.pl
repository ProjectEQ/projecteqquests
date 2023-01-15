# items: 13740, 13379, 13380, 13378
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello, friend. Have a drink. I have some [unique drinks]. Try one. And remember. You get rowdy, the [Bouncers] crush you.");
  }
  if($text=~/bouncers/i) {
    quest::say("The Bouncers were organized by me. As I traveled to many of the world's taverns I encountered great enforcers called bouncers. It was their duty to keep order amongst chaos. When I returned and rose to greatness after the creation of the [Flaming Clurg]. I organized the Oggok Bouncers to keep order amongst the [rival guilds].");
  }
  if($text=~/flaming clurg/i) {
    quest::say("The Flaming Clurg was my greatest creation. It brought me great respect in Oggok. Unfortunately, I have heard tales of an [imposter drink].");
  }
  if($text=~/imposter drink/i) {
    quest::say("Bah! Dat damned Pungla! She be imitatin me drinks! I want som'on to [deal] with dat damned witch! If som'on wud jus bring me her head, I wud pay em!");
    quest::say("Find ways to help all in Oggok. Then we will have conversation.");
  }
  if($text=~/rival guilds/i) {
    quest::say("Oggok has been the battleground for the feud between the Greenblood knights and shamans and the Craknek warriors. It is fueled by the superior intellect of the Greenbloods. Few remember that I, Clurg, was once dim, but now I speak with great words.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 13740 => 1)) {
    quest::say("Ahahaha! Dat witch sur did get wat was commin ta her!");
    quest::givecash(0,0,1,5);
  }
  elsif(plugin::check_handin(\%itemcount, 13379 => 1)) {
    quest::summonitem(13380); # Item: Stein of Moggok
    quest::faction(228,10);   #Clurg
    quest::faction(274,-30); #Kazon Stormhammer
    quest::faction(261,10);  #Green Blood Knights
    quest::faction(232,10);   #Craknek Warriors
    quest::faction(337,10);  #Oggok Guards
  }
  elsif (plugin::check_handin(\%itemcount, 13378 => 1)) {
   quest::say("Ahahaha! Dat witch sur did get wat was commin ta her!");
   quest::givecash(0,0,1,5);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:oggok  ID:49046 -- Clurg
