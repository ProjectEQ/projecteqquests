#############
#Quest Name: Library Book
#Author: loglos
#NPCs Involved: Rarnan Lapice, Tol Nicelot, Illithi Nollith, Moodoro Finharn, Ran Flamspinner, Dyllin Starsine
#Items Involved: Testament of Vanear, Page 30 of a book, Page 34 of a book, Jester, 2 gold, 4 gold
#################

sub EVENT_SAY { 

if($text=~/Hail/i)
  {

    quest::say("I have no time to waste with strangers!"); 
  }


if($text=~/Moodoro/i)
  {

    quest::say("Yes, I knew Moodoro Finharn. He used to be a good friend until he started visiting Qeynos and indulging in human vices. He was executed for crimes against the state. Not even his sister Nolusia could get the charge dropped. There have been some who say he escaped execution and lives in Qeynos. That is insane babbling."); 
  }
if ($text=~/Nolusia/i) {
  quest::say("Nolusia is a member of the Craftkeepers. She lives as a guildmaster in Erudin Palace.");
}

}

#END of FILE Zone:erudnext  ID:98035 -- Tol_Nicelot