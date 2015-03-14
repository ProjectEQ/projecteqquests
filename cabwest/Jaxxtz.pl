sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Greetings. $name. perhaps you've come to purchase some of my rare supplies? I have a special blend of eleven herbs and spices......oh wait.....I'm sold out of that......anyway. what can I do for you?"); 
}
   if($text=~/Who what where is Vagnar/i && $shmskullquest >= 8 && $faction <= 5)
   {
      quest::say("Vagnar? I don't recall.....Unless Vagnar was that shaman supposedly on some quest to save our entire race from total destruction..someone always on one of those. He bought some charms to ward of [Dragon kin]. He's most likely in the belly of some beast now.");
   }
   if($text=~/What Dragon kin/i && $shmskullquest >= 8 && $faction <= 5)
   {
      quest::say("Yes he said he needed to steal secrets from the hated Sarnaks to aid him in his true quest. He said the sarnak know ways to cleanse the mind from intrusion, he would say no more.");
   }
}
#END of FILE Zone:cabwest  ID:2815 -- Jaxxtz 

