#############
#Quest Name: Library Book
#Author: loglos
#NPCs Involved: Rarnan Lapice, Tol Nicelot, Illithi Nollith, Moodoro Finharn, Ran Flamspinner, Dyllin Starsine
#Items Involved: Testament of Vanear, Page 30 of a book, Page 34 of a book, Jester, 2 gold, 4 gold
#################

sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("It is good to meet you. $name.  To enter the Temple of Divine Light is to invite Quellious into your body and soul.  Tranquility is our way and. as such. we do all we can to uphold it.  Are you a [cleric of Quellious]. or am I mistaken?");

}

if($text=~/cleric of Quellious/i){

  if ($faction <= 5) {
    quest::say("I have a small task for you then. Go to the city library and ask the librarian for the book 'The Testament of Vanear'. I shall require it for further studies. Do not return empty-handed or you shall know my rage.");
   }
   else
   {    
     quest::say("You have not done much to upset the Peacekeepers of this temple. but we must ask you to prove yourself to us before we may discuss things such as this."); 
   }
  }
}

sub EVENT_ITEM {
    if(plugin::check_handin(\%itemcount,13991 => 1)) {
        quest::say("I sent you after that book ages ago! What took you so long? I have already completed my studies. Luckily I found the original manuscript under my bedroll. I forgot I had kept it there. Take this as a token of my apology. Maybe it will aid you in your next book hunt. I know how cunning those books can be.");
        my $a = quest::ChooseRandom(15302,6351,89036,16647);
        quest::summonitem($a);
        quest::givecash(0,0,20,3);
        quest::exp(12500);
        quest::faction(145, -25);
        quest::faction(247, 25);
        quest::faction(143, 25);
    }
  else {

    quest::emote("will not accept this item.");

    plugin::return_items(\%itemcount);

  }
}

#End of FILE Zone:erudnext  ID:98046 -- Rarnan_Lapice