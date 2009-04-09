sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("How's it going. scrub? Correct me if I'm wrong. but you appear to be a rogue. If you're a [new rogue]. it's my job to test your skill.  If you are not. then by speaking with me. I see you show interest in [joining this house of rogues].");
}
if($text=~/i am a new rogue/i){
quest::say("We of the Ebon Mask must first be sure you are skilled with a blade. At the same time. we are attempting to create a new type of armor for our rogues. So it is the test of each young rogue to take this bag into Nektulos and fill it with three moss snake skins and three snake fangs. then combine them. We get the bag and you earn a little respect as well as the [Dark Shield of Ebon].");
quest::summonitem(17943);
}
if($text=~/what dark shield of ebon/i){
quest::say("The Dark Shield of Ebon was made for the use of this house by the finest craftsmen of Neriak.  It can be carried in the hand as well as slung upon one's back.  Besides this advantage. it is much lighter than most other shields.");
}
if($text=~/i am joining this house of rogues/i){
quest::say("We of the Ebon Mask must first be sure you are skilled with a blade. At the same time. we are attempting to create a new type of armor for our rogues. So it is the test of each young rogue to take this bag into Nektulos and fill it with three moss snake skins and three snake fangs. then combine them. We get the bag and you earn a little respect as well as the [Dark Shield of Ebon].");
quest::summonitem(17943);
 }
}
sub EVENT_ITEM { 
 if (plugin::check_handin(\%itemcount, 13889 =>1 )) {
   	quest::say("Fine work for a scrub. Maybe one day you will be able to test this new snakescale armor out. For the moment you shall take the [Dark Shield of Ebon] if you do not own one already.");
	quest::summonitem("12258");
	quest::givecash("0","4","0","0");
	quest::faction(361,-1);
        quest::faction(135, -1);
        quest::faction(90, 2);
        quest::faction(133,-1);
        quest::faction(31,-1);
        
 } else {
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
  plugin::return_items(\%itemcount);
 }
}
#END of FILE Zone:neriakc  ID:42046 -- Hekzin_G`Zule 

