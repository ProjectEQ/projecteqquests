#############
#Quest Name: Library Book
#Author: loglos
#NPCs Involved: Rarnan Lapice, Tol Nicelot, Illithi Nollith, Moodoro Finharn, Ran Flamspinner, Dyllin Starsine
#Items Involved: Testament of Vanear, Page 30 of a book, Page 34 of a book, Jester, 2 gold, 4 gold
#################

sub EVENT_SAY { 

if ($text=~/Hail/i)
  {
    quest::say("Shhhh... Greetings, $name. Welcome to the Library of Erudin. Please respect the other patrons and speak softly."); 
  }


if ($text=~/Testament of vanear/i)
  {
    quest::say("Oh my!! You have not heard?! The Testament of Vanear was stolen from the library! It was checked out by a man named Moodoro. He is an Erudite, but I believe he was executed for some crime. Now the book is lost forever. You should speak with Tol Nicelot. He used to know Moodoro. Tol is most likely upstairs."); 
  }

}

#End of FILE Zone:erudnext  ID:98061 -- Illithi_Nollith