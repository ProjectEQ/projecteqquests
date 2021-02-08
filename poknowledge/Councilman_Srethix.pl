#Councilman_Srethix.pl
#Tome of Dark Power
# items: 28741, 28742, 17182, 28746, 15790


sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::emote("regards you with narrow eyes, then smiles. 'Greetings. I am Councilman Srethix of Kartis. It is good to see some new visitors to our little corner of the cosmos. I certainly hope you can find what you are looking for here in the Myrist library. Unfortunately, I'm sorry to say that I am quite busy seeking some rare books at the moment, and I do not have much time for light conversation. Otherwise, I believe my aid Garuuk may have some chores he could use help with. That is, if you feel up to it.'");
  }
  
  if ($text=~/rare books/i) {
  	quest::emote("glares at Garuuk and turns back to you. 'You are interested in a job seeking knowledge, yes? Very well, I think I may have something suitable for you. I happen to be seeking an ancient tome containing some valuable information about artifacts of power. I have learned this book is somewhere in our very own library but so far Garuuk has been unable to locate it. Find me the Tome of Dark Power and I may see what other jobs I can pass along to you.' ");  	
  }  
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28741 => 1)){#Locked Tome of Dark Power
    quest::say("Very impressive, this little tome has eluded my aid for quite some time now. How good of you to discover its whereabouts and bring it to me. But from the looks of it, this book has a strong, magically-sealed lock upon its cover. I wonder if Elder Tal Almad would know how to break it? Take this to him in the Plane of Tranquility and let him have a look at it. If he can open it, bring it back to me.");
    quest::summonitem(28741); #Locked Tome of Dark Power...yes, he hands it right back.
  }
  
  elsif (plugin::check_handin(\%itemcount, 28742 => 1)){#Unlocked Tome of Dark Power
   quest::say("It's good to see my instincts about the Elder were correct.' He opens the book, begins thumbing through the pages, and frowns. 'What's this? Some pages are missing, eight of them to be exact. I'm afraid this book will be of no use to me without those pages. You can have it. I wonder what happened to them, whomever had this book before must have removed them for some reason. If you find the missing pages somewhere, be sure to close them up inside the book and return it to me.");
   quest::summonitem(17182); #Unfinished Tome of Dark Power
  }
  
  elsif (plugin::check_handin(\%itemcount, 28746 => 1)){#Tome of Dark Power
   quest::say("You have done excellently. The tome will now serve my purposes. You may take this as a reward.' He pauses for a moment and continues, 'This task you have performed shows your confidence, patience, and the best of all, determination. Perhaps someday you would consider applying yourself to serve as an aid by my side? I can clearly see you have quite a broad spectrum of usefulness. Much more so than some other attendants I know...");
   quest::summonitem(15790); #Cloak of the Wise
   quest::exp(1000000);
  }
    
}
#END of FILE Zone:poknowledge  ID:202127 -- Councilman_Srethix 

