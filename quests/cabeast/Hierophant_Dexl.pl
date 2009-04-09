#Quests covered in this file:
#Shaman Skull Quest 6

sub EVENT_SAY
{
   if($text=~/Hail/i)
   {
      quest::say("What?!! Who has [sent] you to me? Bah!! Away with you.");
   }
   if($text=~/Hierophant Zand sent me/i && $shmskullquest >= 8 && $faction <= 5)
   {
      quest::say("I await you, Cradossk . My sisters and I yearn for the return of our skulls. We are the [Sisters of Scale]. Find us and bring to this hierophant our skulls and your iron cudgel of the Channeler. Go.");
   }
   if($text=~/Who are the Sisters of Scale/i && $shmskullquest >= 8 && $faction <= 5)
   {
      quest::say("My, what a mess!! Hmmph!! What did you say? Sisters of Scale? They were a legendary trio of mystics. We once had their skulls sealed within this temple, but now they are lost. I sent a channeler to retrieve them. His name was Vagnar. I am sure he shall find them.");
   }
   if($text=~/who is vagnar/i && $shmskullquest >= 8 && $faction <= 5)
   {
      quest::say("'He's a capable channeler, I trust he knows where to look and will prepare himself. Any competent servant of our Lord would prepare potions and supplies before going on such a quest. If he doesn't come back, it's no great loss, he wasn't Hierophant material anyway.");
   }
}

sub EVENT_ITEM
{
   #Turn in the skulls of the sisters of scale and your cudgel of the channeler
   if(plugin::check_handin(\%itemcount, 5145 => 1, 12748 => 1, 12750 => 1, 12749 => 1) && $faction <= 5 && $shmskullquest >= 8)
   {
      quest::say("You have returned the skulls of the Sisters of Scale. For this you shall be rewarded. Take this hierophant's weapon. May you use it to smite the foes of our people.' Dexl comes out of the trance. 'What?!! Whew. Hey!! Where is my cudgel?");
      quest::faction(282, 10); #Scaled Mystics
      quest::faction(193, 10); #Legion of Cabilis
      quest::summonitem(5146); #Give the player The Cudgel of the Hierophant
      quest::exp(140000); #give decent xp...
      quest::givecash (0,0,0,10);
      quest::setglobal("shmskullquest", 9,5,"F"); #set a global flag so that user can do shm skull quest part 7
   }
   else {
      plugin::return_items(\%itemcount); #return items if not the ones required
   }
}