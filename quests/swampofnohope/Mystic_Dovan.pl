#Quests covered in this file:
#Shaman Skull Quest 4
#Shaman Skull Quest 5

sub EVENT_SAY
{
   #Shaman Skull Quest No.4 Event_Say
   if($text=~/I come to inquire about the Crusaders of Rok Nikol/i && $faction <= 5 && $shmskullquest >= 6)
   {
      quest::say("Mystic Dovan lowers his head in sorrow let us have a moment of peace. I cannot find the words to speak of the unspeakable act of the gods which took the lives of the legendary Crusaders of Rok Nolok. You must find the answers for yourself. All I can do is wait for their return. ");
   }
   if($text=~/Who is Galdon Vok Nir?/i && $faction <= 7 && $shmskullquest >= 6)
   {
      quest::say("He is a merchant hiding in The Overthere. He is greedy and will not give the skull up easily. Seek him out and ask him what he would [trade] for the skull.");
   }
}

sub EVENT_ITEM
{
   #Full C.O.R.N. Chest turn in and Cudgel of the Mystic
   if(plugin::check_handin(\%itemcount, 12736 => 1, 5143 => 1) && $faction <= 5 && $shmskullquest >= 6)
   {
      quest::say("I see that you have found your answers. Now I must ask you to to retrieve for the council the skulls of the Di Nozok.  The sarnak in Lake of Ill Omen hold one of the skulls, while [Galdon Vok Nir] holds the other. Once you have retrieved them, give them to Hierphant Zand.");
      quest::faction(282, 10); #Scaled Mystics
      quest::faction(193, 10); #Legion of Cabilis
      quest::summonitem(5144); #Give the player the Iron Cudgel of the Prophet
      quest::exp(100000); #give decent xp...
      quest::setglobal("shmskullquest", 7,5,"F"); #set a global flag so that user can do shm skull quest part 5
   }
   else {
      plugin::return_items(\%itemcount); #return items if not the ones required
   }
} 