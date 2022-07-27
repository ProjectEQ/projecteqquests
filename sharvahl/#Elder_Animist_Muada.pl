# items: 57008, 57996, 52909, 57011, 52930, 52913, 57051, 57059, 57001, 57002, 57003, 57004, 57005, 57006, 57009, 57995, 52900, 52905, 52914, 52911, 57013, 57052, 47100, 57027, 57053
sub EVENT_SAY {
	if ($text=~/hail/i) {
	 if ($client->GetGlobal("beast_epic") ==17) {
		quest::say("I am honored to have had the opportunity to observe you -- a feral champion for the ills that have befallen our kind. You have certainly made your name known among us. While the spirit world is not freed from danger, it is much more promising with all that you've done. Take this token of our appreciation. It may not appear to be too much right now, but it will be very important should you [" . quest::saylink("wish to continue to walk among the elders") . "] of the lords of beasts.");
	 }
	 elsif(plugin::check_hasitem($client, 8495) && plugin::check_hasitem($client, 8496)){
		if($client->GetGlobal("beast_epic") ==undef) {
			quest::setglobal("beast_epic", "1", 5, "F"); 
		}
		 quest::say("I will say 'tis very good to see you again. Shall I assume we have some [" . quest::saylink("business") . "] to tend to?");
	 }	 
	 else {
	  quest::say("Hm, you appear to have the makings of a great master of beasts, but I do believe you must prove yourself. You can perhaps help with some tasks should you [" . quest::saylink("feel able") . "] to.");
	 }
	}
	if ($text=~/feel able/i) {
		quest::say("We have had many requests for weapons lately with this new threat from another realm. Weapons Master Rahoul has been running out of supplies rather quickly and has made a request of our townsfolk. Whether or not you care for this fair city is not my worry -- I simply want to see if you're [" . quest::saylink("dedication") . "] to our kind is true.");
	}
	if ($text=~/dedication/i) {
		quest::say("Very well then $name. You must collect fungal padding, a rare piece of acrylia ore, and two gems of the void. Many of you have completed this task with little difficulty if you should need further direction. Give these items to Weapons Master Rahoul when you are done.");
	}

	if ($client->GetGlobal("beast_epic") ==1 && $text=~/business/i) { # epic route
		quest::say("We can only talk in generalities for now as we are still investigating the strange disturbance with the feral spirits. I can tell you that the opening of a way to Discord and that dark realm itself have something to do with all of this. The spirit world has been [" . quest::saylink("infected") . "] by Discord somehow -- we are certain of that.");
	}

	if ($client->GetGlobal("beast_epic") ==1 && $text=~/wild/i) { # prequest route
		quest::say("We can only talk in generalities for now as we are still investigating the strange disturbance with the feral spirits. I can tell you that the opening of a way to Discord and that dark realm itself have something to do with all of this. The spirit world has been [" . quest::saylink("infected") . "] by Discord somehow -- we are certain of that.");
	}
	  
	if ($client->GetGlobal("beast_epic") ==1 && $text=~/infected/i) {
		quest::say("Some fear we are losing some of our spirits as they sadly seep into that realm that seems to live and breathe. We can only employ the best of beastlords to help us with this task. You will, in fact, very much be acting as an elder for a time, becoming one with the wisest of us all. Your body and beast will be strained to the fullest limits. Are you [" . quest::saylink("ready") . "] to work among us, master of the feral?");
	}
	if ($client->GetGlobal("beast_epic") ==1 && $text=~/ready/i) {
		quest::say("Very well then. We, the elders, all carry and often wear a [" . quest::saylink("Helm") . "] of the Feral. It is a cap that each of us creates to channel the essence of the wild through our minds and bodies. If you are planning to attempt to walk with us in our battle against the chaos of the dark realm, then you will need to fashion your own.");
	}
	if ($text=~/helm/i) {
		quest::say("In order to create the helm, you will need to collect several items that may prove a challenge -- one that I feel you can overcome. If you're willing, I will share the [" . quest::saylink("requirements") . "] with you, feral lord.");
	}
	if ($client->GetGlobal("beast_epic") ==1 && $text=~/requirements/i) {
		quest::say("These tasks fall to you and you only as a beastlord. In order to create a helm that is truly your own that is tied to your essence, you must gather some rare items to create it. And, you must be a master with your tailoring if you wish to succeed in making this item. In part, you will need to use your instincts to discover where these [" . quest::saylink("items") . "] are.");
	}
	if ($text=~/items/i) {
		quest::say("You will need to [" . quest::saylink("find") . "] a wild grass pushing through the stones of a dark corner in a place built on foul earth. It bears a magic that we will use as the thread that will help focus your thoughts. We will also require an elusive shrub that rarely shows itself that we recently discovered. It is also magic and we will use it for the tanning. Its essence shields your mind from invasion.");
	}
	if ($text=~/find/i) {
		quest::say("You will also need to release the tortured essence of a bloated, wild, tusked creature that suffers and collect a tear. Finally, a kindred spirit and tailor has found a magic that creates a good leather for this helm. Seek him out. Now go and return all of these precious goods and I will further instruct you.");
	}
	if(plugin::check_hasitem($client, 57007)) {
	  if ($text=~/i am done/i) {
		quest::say("Ah, I see you were successful! You become more like one of the elders each day -- elders which may now become known to you. I would like you to become familiar with some of the greater animists of Norrath, so I will have you make some deliveries on my behalf. These elder animists are very busy and you must find them on your own in our lands. Show this letter to the elders as you find them.");
		quest::summonitem(57008); # Item: Letter from Muada
	  }
	}
	if ($client->GetGlobal("beast_epic") ==6) {
	 if ($text=~/believe/i) {
	   quest::say("At the eye of the storm in the sky, there are rumors of a hungry beast. It was once an surmountable spirit, but it has learned and aged and grown too powerful for anyone to tame. Its spirit is imbued with a feral force that must be reclaimed by a beastlord. You must release the savage energy it has absorbed and return it to me. We will return it to the spirit world at once. You must also find and bring me the remains of a disturbed spirit in a realm of night terrors. I need to understand what has infected those ethereal beasts of late. Bring both to me.");
	   
	 }
	}
	if ($client->GetGlobal("beast_epic") ==7) {
	  if ($text=~/tortured/i) {
		quest::say("We are hearing of more of our respected spirits that are becoming prey to the chaotic magic from Discord. Should you continue, it will be a step on the walk to a [" . quest::saylink("greater calling") . "] -- to walk with the Elders in the name of beasts of every ilk, to rescue there spirits from eternal pain and corruption.");
	  }
	}
	if ($client->GetGlobal("beast_epic") ==7) {
	  if ($text=~/greater calling/i) {
	  quest::say("Irionu Bastun has discovered another spirit that suffers. I understand she has already told you about the ways of the Rhinoceros. This is yet another creature than was once easily tamed that is endangering the lives of many. More importantly, its spirit has become plagued witht he chaotic magic of discord. Irionu believes that its spirit may have been traded or confused with one from the dark realm. I need you to learn more and tell me what you know. Go find Irionu as soon as you are able to and give her this letter.");
	  quest::summonitem(57996); # Item: Note to Irionu
	  }
	}
	if ($client->GetGlobal("beast_epic") ==9) {
	  if ($text=~/letter/i) {
		  quest::emote("reads the note and his whiskers twitch, his often bright eyes become dull. ");
		  quest::say("Oh, no. What a terrible turn. How can this be? Two of our most [" . quest::saylink("majestic and unique creatures") . "] -- with such wisdom and magic. Of all, I thought these would not be touched or affected.");
	}
	}
	if ($client->GetGlobal("beast_epic") ==9) {
	  if ($text=~/majestic/i) {
	  quest::say("You would know them as two halves of a whole, I suppose. I cannot speak their names for fear. There is so much we don't know and so many suspicions. The corruption of our precious beasts feels more than coincidence now. These creatures that stand so proud and regal know what is happening to them and we need to help them, but that path is a difficult one. I cannot tell you more as we can trust very few and there are prying eyes and ears. Go to Marrey McGrannel and ask her about the danger to our majestic creatures.");
	  }
	}
	if ($client->GetGlobal("beast_epic") ==15) {
	  if ($text=~/does not end/i) {  
	  quest::say("There is still much to do as the sickly magic of Discord trickles through time and space to Norrath and Luclin. It appears that we may need to go to its source. You must go to Rashara. She will have a tale to tell you that will help you on your way to ending this threat to the wild.");
	  }
	}
	if ($client->GetGlobal("beast_epic") ==16) {
	  if ($text=~/Rashara sent me/i) {  
	  quest::say("It seems that as soon as we overcome one problem, another makes itself known. This time, though, we have found a [" . quest::saylink("beast") . "] in Discord that truly means to abuse the strength of the wild spirits");
	}
	}
	if ($client->GetGlobal("beast_epic") ==16) {
	  if ($text=~/beast/i) {  
	  quest::say("There is a foul creature that is borne of Discord itself. We believe it has discovered a way to abuse the ways of the beastlord for its own gains. It has invaded the ethereal world of the wild and is trapping the magic and power we consider sacred. It must be [" . quest::saylink("stopped") . "] before it grows ever powerful and erodes the ability of all beastlords to be at one with our feral companions.");
	  }
	}
	if ($client->GetGlobal("beast_epic") ==16) {
	  if ($text=~/stopped/i) {  
		quest::say("Go speak to Erana Farrel. She is in the city of the dragorn and will most likely be in hiding while she investigates. She was the first to discover this evil plot and has the most information to help you. Give her this cloak. She had asked for some protection while she was out in that volatile realm.");
		quest::summonitem(52909); # Item: Elder Cloak of Resilience
	  } 
	}
	if ($client->GetGlobal("beast_epic") ==17) { 
	  if($text=~/walk among the elders/i) {
		quest::say("So eager to improve yourself, hm? This is encouraging indeed. You must understand that the path from here on out is full of brambles and you will need to acquire great knowledge of the spirit of the warder that you control. There is still much that you do not [" . quest::saylink("know") . "].");
	  }
	  if($text=~/know/i) {
		quest::say("The terrible fate of the spirits in Discord is not over it seems. While we set back the efforts of that dark animist of that realm, it has simply recreated itself and once again threatens the spirits of our warders. We are [" . quest::saylink("learning") . "] more, however.");
	  }
	  if($text=~/learning/i) {
		quest::say("I'm sure you recall the totem you found on that animist. Well, we have studied it in great detail and we need to create a counterpart to it. This requires a great deal of skill and may take some time to complete. This is not a [" . quest::saylink("task") . "] you will be able to fulfill on your own, so you may consider amassing a group of Norrathians that might be willing to help the conservation of the beastlords.");
	  }
	  if($text=~/task/i) {
		quest::say("You must create a totem that is bound to the wild spirits as well as your own. At one time in their lives, each elder has had one. We used it to focus the power of our warders to make them stronger and to bond them to our own spirits. It is time for you to take on this labor of life, now that you are well on the path to becoming one with the elders. Are you [" . quest::saylink("prepared") . "] to do this?");
		quest::summonitem(57011); #Peculiar Unshapen Piece of Wood
	  }
	  if($text=~/prepared/i) {
		quest::say("This is good news. I had no doubt you were ready. First, take this piece of wood. It is the first item you will need in creating your totem. It is a unique piece of wood and one of few that has been collected by the elders. Keep it with you. Now, there are several other [" . quest::saylink("things") . "] you will need to find as part of this journey.");
	  }
	  if($text=~/things/i) {
		quest::say("There is a creature of dark repute in a realm of winds that holds clay made malleable with magic. Once the shape of a beast is made with it, it can aid us to summon those forms from the wild. We have found a way to refine it to help us summon the strongest and most loyal warders. [" . quest::saylink("There is more") . "] too.");
	  }
	  if($text=~/there is more/i) {
		quest::say("A somewhat peaceful, if not fickle sort, nearby one of our dearest elders in a forest has been touched by the seeping of Discord into Norrath. It has become quite sickly with a dark magic and it has caused it to become extremely violent and seeking blood. Our elder, someone you know, escaped its power and wrath once, but you must help. This creature carries a magical blood which we will use for your totem to honor the lost wild spirits this creature consumed. I understand this creature was strengthened by taking the life of a noble and ancient wolf of our [" . quest::saylink("world") . "].");
	  }
	  if($text=~/world/i) {
		quest::say("I suppose many worlds have strife, but Norrath is in grave danger and folk all over argue and bicker like never before. To this day, the Vah Shir have been battling with the grimlings. Many beastlords have helped Scout Husman in the past, but something has changed and not just any beastlord can overcome this new [" . quest::saylink("problem") . "].");
	  }
	  if($text=~/problem/i) {
		quest::say("You may need companions to aid you, which will test your strengths as a leader and a true lord of beasts. Tell Scout Husman you wish to end the great threat in the Grimling Forest and he will brief you. There are two pieces worn about the necks of as many grimlings. We need those trinkets and they will be difficult to obtain. The two brother grimlings have strengthened beyond our control and are powerful with the help of magic of the wilds. We need the precious metal and magic held in their trinkets and to end their threat. When you have these items, you must return to me at once and tell me that you wish to [" . quest::saylink("make the totem") . "]. Good luck, fair feral one.");
	  }
	  if($text=~/make the totem/i) {
		if(plugin::check_hasitem($client, 57025) && plugin::check_hasitem($client, 57058) && plugin::check_hasitem($client, 57020)) {
		  quest::say("Very well. You must now fashion the shape of the totem and imbue it with what you have collected, but not without this bit of beastlord magic. The elders fashion this essence rarely, so treat it with care. You must find a way to blend the magic items taken from the earth and blood together to make the magical base for this totem. Then, use the result to surround a solid frame you find and bathe it with our essence with heat to form the magical basis for this treasured item. Then, you must use fires to mold it. I trush your knowledge and willingness to learn will guid you through this phase of your trials as a beastlord. Return to me and tell me that you are finished with this important duty. Be careful.");
		  quest::summonitem(52930); #Elders' Totem Mold
		  quest::summonitem(52913); #Combined Essence
		}
	  }
	  if(plugin::check_hasitem($client, 57027)) {  
		if($text=~/finished/i) {
		  quest::say("Now you have a fine instrument which is a reminder of your ascendance as a beastlord. Keep it close to your heart as you need that item of your very essence if you choose to advance further as an animist. Now...to continue your journey. First you must once again help to rescue the tortured spirits of our kin. The seething darkness in Discord has once again [" . quest::saylink("trapped spirits") . "] of the wild that we implore you to retrieve.");
		}
		if($text=~/trapped spirits/i) {
		  quest::say("There are discordant beasts that have become twisted through no fault of their own. You may think of it as a spiritual plage, which has us mystified, but we need these creatures stopped. As they grow more infected with spirits, their strength is growing out of contol. We need you to go to that realm and find the source of the problem. They are incredibly large beasts, so beware and do not go alone. Go seek the scout.");
		  quest::setglobal("beast_epic",18,5,"F");
		}	
	  }
	}
	if ($client->GetGlobal("beast_epic") ==19 && $text=~/agree to take on this charge/i) {
		quest::say("I had no doubts, $name... Messenger, you may return to our scouts and tell them that our friend here will take on the hunt for the lost scout. Give Jillaa this elixir. I'm sure she is in need of it and it will alert her to your acceptance of the task.");
		quest::summonitem(57051); #Blended Elixir of Fortitude
	}
	if ($client->GetGlobal("beast_epic") ==21 && $text=~/lost/i) {
		quest::say("dummy...");
	}	
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 57059 =>1 )) { # prequest turn-in
    quest::say("You seem to have created a reputation for yourself. I have heard of you from Dumul himself as he keeps a watch on most beastlords in the lands. I trained him when he was much younger and look how magnificent he has become. Like some others, I do see that you also have used your knowledge and skills well. The command of wild spirits is very strong with you. If you are truly in tune with the airs of spirits, you will likely know that all is not right with the [" . quest::saylink("wild") . "], no matter which path of the beastlord you follow.");
		if($client->GetGlobal("beast_epic") ==undef) { 
			quest::setglobal("beast_epic", "1", 5, "F"); # set to 1 to allow player to continue 1.5
		}
  }
  
  if (plugin::check_handin(\%itemcount, 57001 =>1, 57002 =>1, 57003 =>1, 57004 =>1 )) {
   quest::summonitem(57005); # Item: Plain Animist Helm
   quest::summonitem(57006); # Item: Shiny Sewing Needle
  }
  if ($client->GetGlobal("beast_epic") ==6) {
   if (plugin::check_handin(\%itemcount, 57008 =>1 )) {
    quest::say("Greetings once again, $name. I am satisfied that you may now take on the greater challenges facing our kind. The problem within the spirit world is far more serious than we had first thought and needs to be addressed. It is time for you to take on your first task. Do you [" . quest::saylink("believe") . "] you are ready to continue?");
   }
  }
  if ($client->GetGlobal("beast_epic") ==6) {
   if (plugin::check_handin(\%itemcount, 57009 =>1, 57995 =>1 )) {
    quest::say("Ah, that troubled wolf harbored a strange mix of spirits that were too volatile to control. I think we are beginning to understand the problem more. The energy from the Realm of Discord is tainting some wild creatures. From what we've learned, creatures with some age and wisdom behind them are most susceptible. It seems we cannot save them all, but we must release their spirits into the ethreal wilds of Norrath so they can be free and no longer [" . quest::saylink("tortured and ruined") . "]");
    quest::setglobal("beast_epic",7,5,"F");
   }
  }
  if (plugin::check_handin(\%itemcount, 52900 =>1 )) {
    quest::say("I understand you had to end the life of that poor old drogmor. He was prized stock, you know. He was one of the oldest and most revered by those who raised the mounts. Where there was trouble with the wilds, there is now some peace. Someday you will learn to feel it too. Let me read this [" . quest::saylink("letter") . "].");
    quest::setglobal("beast_epic",9,5,"F");
  }  
 if ($client->GetGlobal("beast_epic") ==14) {
  if (plugin::check_handin(\%itemcount, 52905 =>1 )) {
    quest::say("Gracious, that is indeed a precious gift. I will present it to the elders when we next gather as a council. They will be overjoyed at the rescue. You may keep that Feral Lord's Brooch to yourself as a reminder of what you learned. All [" . quest::saylink("does not end") . "] here though.");
    quest::setglobal("beast_epic",15,5,"F");
  }
 }
 if ($client->GetGlobal("beast_epic") ==16) {
  if (plugin::check_handin(\%itemcount, 52914 =>1 )) {
   quest::say("I am honored to have had the opportunity to observe you -- a feral champion for the ills that have befallen our kind. You have certainly made your name known among us. While the spirit world is not freed from danger, it is much more promising with all that you've done. Take this token of our appreciation. It may not appear to be too much right now, but it will be very important should you [" . quest::saylink("wish to continue to walk among the elders") . "] of the lords of beasts.");
   quest::summonitem(52911); # Item: Savage Lord's Totem
   $client->AddAAPoints(5);
   $client->Message(15,"You have gained 5 ability points!");	
   quest::ding();
   quest::setglobal("beast_epic",17,5,"F");
  }
 }
  if (plugin::check_handin(\%itemcount, 57013 =>1 )) {
    quest::say("Yes, yes, this is what we need. It's unfortunate you had to get it by the means you did. It seems that the command of the spirits is getting difficult to master with all the trouble coming about from that portal to that foul realm. Wait a moment, $name . . . a messenger is coming.");
    quest::unique_spawn(155345,0,0,509.7,-170,-102,380); #Messenger_Yuashar
	quest::settimer("respond",10);	
  }
  if (plugin::check_handin(\%itemcount, 57052 =>1 )) {
    quest::say("Well, this indeed explains why we were never rid of the dark animist. I do believe you have overcome that despicable fiend. I feel the wild spirits are safe now. But that doesn't mean we're done with you. What I must ask you will be the most difficult task yet. The dark animist has been using a magical item of great power. It holds within it the very essence of Discord that drives much of the dark animist's energy. You must bring one to me so we may study it and prevent any further abuse of our most beloved creatures. If you complete this task, you must also give me your Spiritbound Totem when you return, for it will indeed be time for you to transcend. If you have [" . quest::saylink("lost") . "] it, please tell. We may be able to help you.");
    quest::setglobal("beast_epic",21,5,"F");
  }  
  if ($client->GetGlobal("beast_epic") ==21 && plugin::check_handin(\%itemcount, 47100 =>1, 57027 =>1 )) {
    quest::emote("appears overwhelmed. 'There is no limit to your greatness, is there? You have done more than any other to save us -- the masters of the wild. Your time has come, savage lord. You are about to meet one of the very first beastlords of Luclin. Her name is Alladnu Eshiara. She is often found in the wild, studying nature and the ways of feral creatures. Find her, give her this letter and your Savage Lord Totem and she will complete your journey. I will be there in spirit friend.");
	quest::summonitem(57053); #Sealed Letter from Muada
  }  
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
 if($timer eq "respond") {
    quest::emote("eyes the messenger and then his feline eyes look over your face. 'We will send our esteemed beastlord, here. This master of beasts knows much and is more familiar with this issue than most. Will you [" . quest::saylink("agree to take on this charge") . "] of seeking out our lost scout?");
    quest::stoptimer("respond");
 }
} 
