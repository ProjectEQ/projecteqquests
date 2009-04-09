#Arch Duke Xog is a shadow knight guildmaster. We turn our newbie note in to him, and he also gives us the seventh Greenmist quest once we've grown up and gotten that far in the quest series.

sub EVENT_SAY {
 if($text=~/hail/i){
  quest::say("These are the sacred unholy grounds of the Crusaders of Greenmist and the Scaled Mystics.  If you do not belong to us, you must leave this temple at once or learn great suffering in the name of Cazic-Thule.");
  }
 elsif($text=~/greenmist/i){ #Test of the Hero (Greenmist Quest 7/8)
  quest::emote("appears surprised at your words. 'You know of Greenmist? The Unholy Khukri of Rile? We once had knowledge of this weapon, but when our great cities were destroyed in 1056 A.G., so, too, were all the great libraries. We lost all records. An explorer named [Argest] claimed to have found one library still intact. Pure babble.'");
  }
 elsif($text=~/argest/i){ #Test of the Hero (Greenmist Quest 7/8)
  quest::say("Once a Lord of Pain, Argest is now a great explorer. No lizard has seen more of Kunark than he. He returned one season ago to tell tales of an [ancient library]. He said that he believed that there he would find a tome which would reveal the location of the ancient crusader weapon, Greenmist.");
  }
 elsif($text=~/ancient library/i){ #Test of the Hero (Greenmist Quest 7/8)
  quest::say("There are many ancient libraries yet to be discovered. Our once great cities have been decimated, if not by our foes, then by nature itself. Within the outlands are many ruins which have yet to reveal themselves. We look forward to the discovery of these ruins by such explorers as Lord Argest the Great. If only we knew [where] he was...");
  }
 elsif($text=~/where/i){ #Test of the Hero (Greenmist Quest 7/8)
  quest::emote("becomes despondent at your question. 'Alas, our chance of locating Greenmist is lost as long as Argest remains missing. Reports have come in from the Legion's deep range patrols that he may be in the Frontier Mountain range. At least, that is where the patrol captain found Argest's walking staff. He might have been captured, killed or even digested!!'");
  }
  if ($text=~/strange iksar/i) {
    quest::say("Yes, he was dressed in rags and hadn't eaten in days. He rambled on about seemingly nothing, obviously he had lost his mind at some point. The guards brought him in because he told them he had valuable information concerning a captured Crusader. According to the mad man, our missing knight was captured by a group of cultists that follow a false god. The cultists intend on converting him apparently. Your [test] will concern Geanik.");
  }
  if ($text=~/test/i) {
    quest::say("Learning Righteousness is learning to listen to one's own heart. At all times our Lord of Fear speaks to us. Our heart is through which he speaks. If we are pure in action and undistracted in mind we can hear the very words of our Father. Your test will be to find our lost Crusader. When you find him you must listen, and act based on what you hear. If your actions are Righteous, I will give you my reference. Bring me proof of your action and two sapphires.");
  }
}

sub EVENT_ITEM {
  if(($itemcount{18205} == 1)){ #Test of the Newbie (Greenmist Quest 0/8)
  quest::say("Welcome into our brotherhood. Know you that our way is the way of pain. Do as we say and you shall climb the rungs of knighthood. Listen well to the Lords of Pain within this temple and follow the words of the hierophants, for Cazic-Thule speaks to us through them. Take this khukri. It is the chosen weapon of the Crusaders and can deliver great pain unto our foes. Go now and learn our ways. Seek out Lord Gikzic.");
  quest::summonitem(5120);
  quest::exp(100);
  quest::ding();
  quest::faction(62,20);
  quest::faction(193,10);
 }
 elsif(($itemcount{18051} == 1) && ($itemcount{5126} == 1)){ #Test of the Hero (Greenmist Quest 7/8)
  quest::say("A legible tome of the scrolls of Vok Na Zov! What a find this is!! May the unholy curses of Cazic flow through you. Please accept the weapon of a Lord of Pain. To abandon it is to abandon our ways and earn yourself the hatred of our order.");
  quest::summonitem(5128);
  quest::givecash("0","0","0","4"); 
  quest::exp(4000);
  quest::ding();
  quest::faction(62,20);
  quest::faction(193,10);
 }
 if (plugin::check_handin(\%itemcount, 14808 =>1 )) {
   quest::emote("takes the note and glances at it briefly then lets out a heavy sigh and stares out over the city for several minutes. Finally he says quietly,");
   quest::say("Several months ago we lost contact with one of our crusaders. His name is, or was, Geanik. The last we heard from him he was furthering our cause against the loathsome Goblins that reside in Warsliks Wood. Just recently we were visited by a [strange Iksar].");
 }
 if (plugin::check_handin(\%itemcount, 14807 =>1, 10034 =>2)) {
   quest::say("Thanks for resolving this issue.  Here is your reward");
   quest::summonitem(4980);
   quest::exp(10000);
   quest::ding();
 }
 else{ 
 plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
 plugin::return_items(\%itemcount);
 }
}

#Submitted by Jim Mills