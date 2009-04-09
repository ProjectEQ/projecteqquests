#Heirophant Zand starts and ends The Penance quest. This allows a young iksar to replace their guild's starting item if they've lost it. She is also for the 3rd and 5th shaman skullcap quests.

sub EVENT_SAY {
  if(($text=~/chosen saviour/i) && ($faction <= 5) && ($shmskullquest >= 3)){
    quest::say("I am honored to meet the one who shall pledge his life to the return of the Skulls of the Ancients. However, I must see proof of our prowess as of yet. Go to the outlands and retrieve one Froglok Hexdoll, and no, they are not found on Frogloks. They are shaman dolls made by the goblin tribe.");
  }
  elsif($text=~/hail/i){
    quest::say("Welcome to the Temple of Terror, young one. May the pain of the ancients guide you. Have you lost your Iron Cudgel of the Petitioner?"); #Could not find original text
  }
  elsif($text=~/no/i){
    quest::say("The Temple of Terror requires all young Scaled Mystics to wear the symbol of their station. Wear it with pride in these halls to display the rank you have attained. Go now, and serve The Faceless."); #Could not find original text
  }
  elsif($text=~/yes/i){ #The Penance quest
    quest::emote("shakes his head and growls. 'That is not good, broodling... Not good at all. You will need to take this note and seek out the Toilmaster immediately. Read it on the way and hope that your incompetence can be overcome. The Crusaders of Greenmist have a pit meant for you, should this prove to be impossible."); #Could not find original text
    quest::summonitem(18271); #A Ragged Book
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 18272 => 1, 24770 => 1)) { #The Penance quest
    quest::emote("takes the bag and tome from you and in return gives you the item that you have been thinking of all of this time.");
    quest::say("Lucky you. You have earned a second chance. Praise Cazic-Thule!");
    quest::summonitem(5140); #Iron Cudgel of the Petitioner
    quest::ding();
  }
  #Shaman Skull Quest No.3.1 turn in - Check for  A froglok hex doll
  elsif((plugin::check_handin(\%itemcount, 12734 => 1)) && ($faction <= 5) && ($shmskullquest >= 3)) {
    quest::say("You have proven your prowess to me, now take this note to Crusader Quarg outside the city and he will test you further.");
    quest::faction(282, 10); #Scaled Mystics
    quest::faction(193, 10); #Legion of Cabilis
    quest::summonitem(18054); #A note to take to crusader Quarg.
    quest::exp(80000); #give decent xp...
    quest::givecash (0,0,0,5);
    quest::setglobal("shmskullquest",4,5,"F"); #set a global flag so that user can do shm skull quest part 3.2
  }
  #Shaman Skull Quest No.5 turn in - Iksar Skull Helm and Iksar Skull and Cudgel of the Prophet
  elsif((plugin::check_handin(\%itemcount, 12741 => 1, 5144 => 1, 12740 => 1)) && ($faction <= 5) && ($shmskullquest >= 7)) {
    quest::say("You have done well in proving yourself to this council, but we have yet more tests for you before you will be a true clairvoyant. Speak with Hierophant Dexl for your next test.");
    quest::faction(282, 10); #Scaled Mystics
    quest::faction(193, 10); #Legion of Cabilis
    quest::summonitem(5145); #Give the player The Cudgel of the Channeler
    quest::exp(120000); #give decent xp...
    quest::givecash (0,0,0,10);
    quest::setglobal("shmskullquest",8,5,"F"); #set a global flag so that user can do shm skull quest part 6
  }
  else { 
    quest::say("This isn't what I asked for.");
    plugin::return_items(\%itemcount);
  }
}

#Submitted by Jim Mills