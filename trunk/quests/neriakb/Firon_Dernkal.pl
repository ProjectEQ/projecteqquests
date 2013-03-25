#Firon_Dernkal.pl
#Charm of the Brotherhood


sub EVENT_SAY{
  if($text=~/Hail/i) {
    quest::say("Well met $name. What exactly is it I can do for you? You must excuse me if there are no pressing matters, I have a very important [lieutenant] to track down. He has been missing for quite some time now.");
  }
  if($text=~/lieutenant/i) {
    quest::say("Ah yes of course the one I speak of is none other than Gerod Yalronsan, he is one of the finest warriors to ever serve the brotherhood. He was recently promoted to official courier of the brotherhood. He has most recently been tasked with the responsibility to take documents to and from Mistmoore. Most notably our battle strategies that are very dangerous if they end up in the wrong hands. I do not know what has become of him and I have grown worried. Would you be [willing to help me locate Gerod].");
  }
  if($text=~/willing to help you locate Gerod/i) {
    quest::say("Very well then. Allow me to gather my thoughts about what he was to pick up and drop off this trip. Ah yes of course, he was to report to Eirod Haerod with our latest plans for the attack on Kelethin with the help of Clan Crushbone. If you wished to find his whereabouts visiting her would probably be a good place to start. Bring this symbol, so that she will know we have sent you.");
    quest::summonitem(21972);#Symbol of the Brotherhood
  }
  if($text=~/keepsake/i) {
    quest::say("Well those would be his be his war medals of course. He was presented with a 4 of them for his service to the Brotherhood. I sure hope you do not find them because if you do, he is surely dead. I hope to hear good news from you soon Vatglut. Please return to me should you find his medallions so I can bring the news to the brotherhood.");
  }
	
}
sub EVENT_ITEM{
	if(plugin::check_handin(\%itemcount, 21974 => 1)) {#Sealed War Documents
		quest::say("It is good to see you back $name. I am glad that you could turn up some information on Gerod. Now let me have a look at these. There seems to be some kind of an encrypted message in these documents and it appears to be written by Gerod. I cannot make it out completely but I believe it says something about a Rok. Please take this to whomever you can to try and make some sense of Gerods scribbling. As always, if you find anything that might belong to Gerod please return it to me. I do know of one specific [keepsake] he carries.");
		quest::summonitem(21974);#Sealed War Documents...he hands them right back, to no purpose currently known.
	}
	if(plugin::check_handin(\%itemcount, 21975 => 1, 21976 => 1, 21977 => 1, 21978 => 1)) {#Bronze Medallion of Service, Silver Medallion of Service, Golden Medallion of Service, Platinum Medallion of Service
		quest::say("This is terrible news most definitely. I do not know how this could have happened. Gerod was one of the most skilled weapon masters that the Brotherhood has ever seen. I do certainly appreciate your work and dedication to this matter, please take this charm as a token of my appreciation.");
		quest::summonitem(61002);#Charm of the Brotherhood
	}	
    plugin::return_items(\%itemcount);
}#Done