#############
#Quest Name: Library Book
#Author: loglos
#NPCs Involved: Rarnan Lapice, Tol Nicelot, Illithi Nollith, Moodoro Finharn, Ran Flamspinner, Dyllin Starsine
#Items Involved: Testament of Vanear, Page 30 of a book, Page 34 of a book, Jester, 2 gold, 4 gold
#################

sub EVENT_AGGRO {
	quest::say("How dare you attack a member of the Qeynos Guard!!");
}

sub EVENT_DEATH {
	quest::say("Fool!!  I was sent by the Commander of the Qeynos Guard.  You will surely be punished..unggh!!");
}

sub EVENT_SAY { 

  if($text=~/Hail/i){

    quest::say("Hey!! I don't have any spare change, okay?!"); 

  }

  if($text =~/Testament of Vanear/i) {

    quest::say("So you heard Guard Dyllin has page 30 of the Testament of Vanear, eh?! Well, get lost!! Over my dead body will you get page 30!");

    quest::attack($name);
  }

}



sub EVENT_ITEM {

  plugin::return_items(\%itemcount);

}


 sub EVENT_DEATH
{
 quest::say("How dare you attack a member of the Qeynos Guard!!");
 quest::summonitem(13832);
}

#END of FILE Zone:highpass  ID:5045 -- Dyllin_Starsine