sub EVENT_SAY { 
  if($text=~/hail/i){
    quest::say("Greetings. stranger! Are you the [bounty hunter I requested]?");
  }
  if($text=~/bounty hunter you requested/i){
    quest::say("It is about time.  I have been waiting for you for ages!  Your [reputation] precedes you.");
  }
  if($text=~/reputation/i){
    quest::say("You humor me. Slaythe!  I would have guessed someone like yourself would have little time for humor.  Nevertheless. would you [like to hear about the job] I have for you?");
  }
  if((($text=~/like to hear about the job/i) || ($text=~/like to know more/i)) && ($faction > 5)){
    quest::say("Your name is as respected as the name of the Karana bandits.  Leave my presence while you still have legs to run with.");
  }
  if((($text=~/like to hear about the job/i) || ($text=~/like to know more/i)) && ($faction == 5)){
    quest::say("You must be new to Highhold. We will trust you when we hear your blade has cut down many Karana bandits or assisted our gatehouse guards with their tasks.");
  }
  if(($text=~/like to hear about the job/i) && ($faction < 5)){
    quest::say("A prisoner named Bronin Higginsbot. a halfling. recently escaped.  He was a small time thief and I would care less if it were not for the fact that in the process of obtaining the cell key. he disemboweled my finest guard.  We found the bloodied shank still stuck in my guard's gutted corpse.  Would you [like to know more]?");
  }
  if(($text=~/like to know more/i) && ($faction < 5)){
    quest::say("That little man has now made it to Rivervale.  He has ties with the halfling rogues. obviously. I want you to find him.  When you find him. take this shank he used to kill my guard and hand it to him.  I want him to know why he is about to die.  No one escapes my prison!!  Bring me his head and I shall pay the bounty.");
    quest::summonitem(13110); 
  }
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 13111 => 1 )) {
      quest::say("Good work, bounty hunter! You have served your legend well. I hope a few plat is good enough and, please, take this item we confiscated from one of our guests now serving time in our dungeon.");
	  quest::ding();
      quest::faction(149, 25);
      quest::faction(31, 25);
      quest::faction(214, 25);
      quest::faction(53, 25);
      quest::faction(105, 25);
      quest::exp(250);
      quest::givecash(0, 0, 0, 4);
      quest::summonitem(quest::ChooseRandom(2314,2314,2314,7321));
   }
   plugin::return_items(\%itemcount);
}

#END of FILE Zone:highkeep  ID:6042 -- Captain_Boshinko 

