#Gearheart

sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("Hail, $name. I invite you to serve the mighty state of Ak'Anon by becoming a Gemchopper. We gnomes are not known for our warrior skills, but those few who endure and survive to become elite amongst our warriors soon find that the technology of the gnomes has found its way into our halls. You must be a [new recruit] or [an outsider], perhaps?");
}
if($text=~/i am a new recruit/i){
quest::say("Well, good to make your acquaintance, $name. Maybe someday you shall be a great Watchman. Until then, I have a task for you. Will you [serve the Crown] or has a yellow streak appeared upon your back?");
}
if($text=~/i am an outsider/i){
quest::say("I should have guessed as much. You look the part.");
   }
if($text=~/i will serve the crown/i){
   if($ulevel <=5){
quest::say("You are too inexperienced. Leave that business to someone more worldly.");
   }
else {
      quest::say("Go quickly then $name, hunt down a stolen clockwork named Gearheart who has been taken by the Faeries in Lesser Faydark and return to me his blackbox.");
      }
   }
}

sub EVENT_ITEM {
 if(plugin::check_handin(\%itemcount, 18770 => 1)){
   quest::summonitem("13520");
   quest::faction("Not_Found","1");
   quest::faction("Not_Found","1");
   quest::faction("Not_Found","1");
   quest::faction("303","-1");
   quest::faction("373","-1");
 }
 if(plugin::check_handin(\%itemcount, 13344 => 1)){
    quest::summonitem(quest::ChooseRandom(9002,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1010,1011)); #cloth armor or round shield
    quest::faction("115","10"); #+Gem Cutters
   quest::faction("210","10"); #+Merchants of Ak'anon
   quest::faction("176","10"); #+King Akanon
   quest::faction("71","-10"); #-Dark Reflection
   quest::faction("39","-10"); #-Clan Grikbar
}
 plugin::try_tome_handins(\%itemcount, $class, 'Warrior');
 plugin::return_items(\%itemcount);
}
#END of FILE Zone:akanon  ID:55173 -- Baxok_Curhunter


