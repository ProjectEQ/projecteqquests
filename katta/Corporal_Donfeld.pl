# items: 18332, 17515
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Oh yes. hello there. I am sorry to be so short, but Governor Erikal had asked me to investigate the [Recuso] and... well, the going has been slow as of yet.");
  }
  if($text=~/recuso/i) {
    quest::say("The Recuso are a delitescent people that wander the lands outside Sanctus Seru. They do not have the most open society, so gathering information on them has been tricky. We have reason to believe that they are quite hostile towards Seru and therefore our potential allies- the enemy of my enemy is my friend and all of that. To learn more about them, it was decided we send someone in to try to blend into their society, but he is more than a week past due checking in and we can spare no one to [go after him].");
  }
  if(($text=~/go after him/i) && ($faction <= 2)) {
    quest::say("It is quite the journey, are you sure that you are up for it? Your best bet would be to start the search in Marus Seru where the Recuso can be found. Legionnaire Marais had a lead in Shadowhaven as well, but I do not believe it had gotten him anywhere yet. You will need to give him this, he has the other half and will recognize it as a signal that you were sent directly by me. Oh, and let me give you a file to hold your evidence in, do you have [room] for it, my friend?");
    quest::summonitem(18332); #Torn Half of a Note
  } 
  if($text=~/room/i) {
    quest::say("Here, this should do, there may be some extra space in there when you are done. Just put all the evidence you find in it and get it back to me as soon as you can. Best of luck to you, and my thanks as well.");
    quest::summonitem(17515); #Recuso Case File
  } 
  if($text=~/seru/i) {
    quest::say("I know that to most it seems as though we do not even pay attention to each other anymore, but the silent war between Seru and Katta has never really subsided.");
  }
} 
#END of FILE Zone:katta  ID:160211 -- Corporal_Donfeld