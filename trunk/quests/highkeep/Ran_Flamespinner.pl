#############
#Quest Name: Library Book
#Author: loglos
#NPCs Involved: Rarnan Lapice, Tol Nicelot, Illithi Nollith, Moodoro Finharn, Ran Flamspinner, Dyllin Starsine
#Items Involved: Testament of Vanear, Page 30 of a book, Page 34 of a book, Jester, 2 gold, 4 gold
#################

sub EVENT_SAY { 

  if($text=~/Hail/i)
  {

    quest::say("I am very sorry to have to inform you that the library is off limits to strangers."); 

  } 
  if($text=~/Testament of Vanear/i)
  {

    quest::say("So, you seek the page 30 I recently purchased from an Erudite named Moodoro? He also had page 34, but refused to sell it to me. If you seek page 34, you will first have to find Moodoro. I had page 30 for but a few days when a man swiped it from the library's shelves. I believe he wore the garb of a guard of Qeynos. He darted away so fast I did not have time to cast a single spell! I believe he is still in Highpass, I can feel it!!");
  }

}



#END of FILE Zone:highkeep  ID:6066 -- Ran_Flamespinner