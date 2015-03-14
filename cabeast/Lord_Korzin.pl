#Lord Korzin is for the Greenmist quest and administers the third quest in the line.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("What is it you seek? [Eternal suffering]?");
  }
 elsif($text=~/eternal suffering/i){ #Test of Suffering (Greenmist Quest 3/8)
  quest::say("Then follow the words of Cazic-Thule and may his blessed curses rain upon your soul as they shall on all of his faithful servants. Were you [sent] to me by Gikzic?");
  }
 elsif($text=~/sent/i){ #Test of Suffering (Greenmist Quest 3/8)
  quest::say("Then you must be the squire who found the ancient tome, 'The Origins of Pain'. I can use a talented crusader such as yourself. In my dreams, Cazic-Thule has spoken to me. He instructed me to seek out the 'Skull of Torture' which was last reported to be within the torture tower of the ancient Lord of Pain, Kurn. Will you [accept the calling]?");
  }
 elsif($text=~/accept the calling/i){ #Test of Suffering (Greenmist Quest 3/8)
  quest::say("As if you had a choice. Seek out the tower of Kurn and find the Skull of Torture. You should be able to easily recognize this skull as it glows with the power of Cazic Thule. Return it to me with your squire's khukri and I shall reward you with the knight's khukri. Go at once.");
  }
}

sub EVENT_ITEM {
  if(($itemcount{12401} == 1) && ($itemcount{5122} == 1)){ #Test of Suffering (Greenmist Quest 3/8)
  quest::say("Excellent work! You are no squire. You are now a knight of the crusaders. Your next step shall be zealot. And every zealot wields a magical khukri.");
  quest::summonitem(5123);
  quest::givecash("0","0","15","0"); 
  quest::exp(1500);
  quest::ding();
  quest::faction(62,20);
  quest::faction(193,10);
 }
 plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
 plugin::return_items(\%itemcount);
}

#Submitted by: Jim Mills