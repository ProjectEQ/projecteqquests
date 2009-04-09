#Quests covered in this file:
#Shaman Skull Quest 7

sub EVENT_SAY
{
   if($text=~/Hail/i){
      quest::say("Leave me in peace $name, I have little desire for company now. The Faceless sends visions to me that may hold the fate of our race in sway.");
   }
   if($text=~/What Visions?/i && $shmskullquest >= 9 && $faction <= 5)
   {
      quest::say("The spirits tell me of strange happenings around the ancient city of Charasis. None of the mystics that have been sent to investigate have returned. Something is surely happening in the ancient tombs of that city. I pray to our lord for some way to calm the tortured spirits of our fallen brothers that haunt the Howling Stones.");
   }
   if($text=~/What dreams cloud your mind?/i && $shmskullquest >= 12 && $faction <= 5)
   {
      quest::say("I see much darkness...darkness and death. A void of life...the cold grip of death. An Ancient pact...with forces too terrible to describe...A great Leader...a fall, and a second coming. I see...a symbol of...an ancient city...Kaesora. I would begin there young Mystic. The spirits of that fallen city may hold a key to our future.");
   }
}

sub EVENT_ITEM
{
   #Turn in the a dusty iksar skull
   if(plugin::check_handin(\%itemcount, 30984 => 1) && $faction <= 5 && $shmskullquest >= 9)
   {
      quest::say("There is strange magic in this skull $name, whatever necromancer animated this skeleton was a powerful warlock indeed. I sense the power of several ancients in this relic. Take this skull to Oracle Qulin in the field of bone, he may be able to perform the ritual which will free this ancient's spirit from the mortal realm.");
      quest::setglobal("shmskullquest", 10,5,"F"); #set a global flag so that user can do shm skull quest part 7.2
      quest::summonitem(30984); #give back the skull
   }

   #Turn in the note Oracle Qulin gave you
   if(plugin::check_handin(\%itemcount, 30986 => 1) && $faction <= 5 && $shmskullquest >= 11)
   {
      quest::say("It is as I feared, the mark of the warlock has surely driven these ancient spirits mad. We can not allow these spirits to roam free in our world $name. Take this case and place the glowing skulls of other ancients inside of it. Return it to me with your Cudgel of the Heirophant so that we may remove these cursed spirits from our world forcefully.");
      quest::setglobal("shmskullquest", 12,5,"F"); #set a global flag so that user can do shm skull quest part 7.2
      quest::summonitem(17134); #give ornate skull case for 4 glowing skulls
   }

   
   #Turn in full ornate skull case and cudgle of the heirphant
   if(plugin::check_handin(\%itemcount, 30988 => 1, 5146 => 1) && $faction <= 5 && $shmskullquest >= 12)
   {
      quest::say("You have done well $name. Perhaps you can help clear these troubling dreams from my tired aging mind. Commune with the spirits of our Ancestors and learn from them. Never forget that the ultimate power comes from knowledge. The ancients are privy to much knowledge that mortals will never see. Should you be granted enlightenment from our ancestors, share your knowledge with me so that we may use this knowledge for the benefit of our brethren. I will continue to study the [dreams] that [cloud] my mind.");
      quest::setglobal("shmskullquest", 13,5,"F"); #set a global flag so that user can do shm skull quest part 8
      quest::summonitem(5148); #SkyIron Cudgel of the Arisen
   }
   else {
      plugin::return_items(\%itemcount); #return items if not the ones required
   }
}
#END of FILE Zone:cabeast  ID:5761 -- Hierophant_Granix 

