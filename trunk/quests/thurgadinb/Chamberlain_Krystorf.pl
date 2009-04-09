sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings and welcome to Thurgadin, $name. I am Chamberlain Krystorf and it is my duty to assist the Dain in the management of Icewell Keep and the Royal Court. One could say that Seneschal Aldikar is the Sword of the Dain while I am the Shield, protecting all of his interests and those of the kingdom."); 
}
 }
sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 29062 => 4)){
  quest::say("Well done, $name, the Dain is pleased with your efforts. With a few more brave allies like you, we'll soon be tearing down the halls of Kael Drakkel.");
  quest::summonitem(quest::ChooseRandom(30215,30219,30212,30263));
  quest::faction(49, 10);
  quest::faction(67, 10);
  quest::faction(179, -30);
  quest::exp(64000);
  quest::ding();
  quest::givecash(0,0,0,20);
 }
  else {
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:thurgadinb  ID:129027 -- Chamberlain_Krystorf 

