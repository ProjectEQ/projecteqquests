sub EVENT_SAY {

if ($text=~/hail/i) {
    quest::say("Hm, you appear to have the makings of a great master of beasts, but I do believe you must prove yourself. You can perhaps help with some tasks should you [feel able] to.");
  }
  if ($text=~/feel able/i) {
    quest::say("We have had many requests for weapons lately with this new threat from another realm. Weapons Master Rahoul has been running out of supplies rather quickly and has made a request of our townsfolk. Whether or not you care for this fair city is not my worry -- I simply want to see if you're [dedication] to our kind is true.");
  }
  if ($text=~/dedication is true/i) {
    quest::say("Very well then $name. You must collect fungal padding, a rare piece of acrylia ore, and two gems of the void. Many of you have completed this task with little difficulty if you should need further direction. Give these items to Weapons Master Rahoul when you are done.");
  }

if(plugin::check_hasitem($client, 8495) && plugin::check_hasitem($client, 8496)){
 if($text=~/hail/i) {
    quest::say("I will say 'tis very good to see you again. Shall I assume we have some business to tend to?");
  }
 }

if ($text=~/business to tend to/i) {
  quest::say("We can only talk in generalities for now as we are still investigating the strange disturbance with the feral spirits. I can tell you that the opening of a way to Discord and that dark realm itself have something to do with all of this. The spirit world has been [infected] by Discord somehow -- we are certain of that.");
}

if ($text=~/wild/i) {
  quest::say("We can only talk in generalities for now as we are still investigating the strange disturbance with the feral spirits. I can tell you that the opening of a way to Discord and that dark realm itself have something to do with all of this. The spirit world has been [infected] by Discord somehow -- we are certain of that.");
}
  
 if ($text=~/infected/i) {
     quest::say("Some fear we are losing some of our spirits as they sadly seep into that realm that seems to live and breathe. We can only employ the best of beastlords to help us with this task. You will, in fact, very much be acting as an elder for a time, becoming one with the wisest of us all. Your body and beast will be strained to the fullest limits. Are you [ready] to work among us, master of the feral?");
  }
  if ($text=~/ready/i) {
    quest::say("Very well then. We, the elders, all carry and often wear a [Helm] of the Feral. It is a cap that each of us creates to channel the essence of the wild through our minds and bodies. If you are planning to attempt to walk with us in our battle against the chaos of the dark realm, then you will need to fashion your own.");
  }
  if ($text=~/helm/i) {
    quest::say("In order to create the helm, you will need to collect several items that may prove a challenge -- one that I feel you can overcome. If you're willing, I will share the [requirements] with you, feral lord.");
  }
  if ($text=~/requirements/i) {
    quest::say("These tasks fall to you and you only as a beastlord. In order to create a helm that is truly your own that is tied to your essence, you must gather some rare items to create it. And, you must be a master with your tailoring if you wish to succeed in making this item. In part, you will need to use your instincts to discover where these [items] are.");
  }
  if ($text=~/items/i) {
    quest::say("You will need to [find] a wild grass pushing through the stones of a dark corner in a place built on foul earth. It bears a magic that we will use as the thread that will help focus your thoughts. We will also require an elusive shrub that rarely shows itself that we recently discovered. It is also magic and we will use it for the tanning. Its essence shields your mind from invasion.");
  }
  if ($text=~/find/i) {
    quest::say("You will also need to release the tortured essence of a bloated, wild, tusked creature that suffers and collect a tear. Finally, a kindred spirit and tailor has found a magic that creates a good leather for this helm. Seek him out. Now go and return all of these precious goods and I will further instruct you.");
  }
  if(plugin::check_hasitem($client, 57007)) {
  if ($text=~/i am done/i) {
    quest::say("Ah, I see you were successful! You become more like one of the elders each day -- elders which may now become known to you. I would like you to become familiar with some of the greater animists of Norrath, so I will have you make some deliveries on my behalf. These elder animists are very busy and you must find them on your own in our lands. Show this letter to the elders as you find them.");
    quest::summonitem(57008);  
  }
}
 if (defined $qglobals{muadalet} && $qglobals{muadalet} == 5) {
 if ($text=~/believe/i) {
   quest::say("At the eye of the storm in the sky, there are rumors of a hungry beast. It was once an surmountable spirit, but it has learned and aged and grown too powerful for anyone to tame. Its spirit is imbued with a feral force that must be reclaimed by a beastlord. You must release the savage energy it has absorbed and return it to me. We will return it to the spirit world at once. You must also find and bring me the remains of a disturbed spirit in a realm of night terrors. I need to understand what has infected those ethereal beasts of late. Bring both to me.");
   
 }
 }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 6) {
  if ($text=~/tortured/i) {
    quest::say("We are hearing of more of our respected spirits that are becoming prey to the chaotic magic from Discord. Should you continue, it will be a step on the walk to a [greater calling] -- to walk with the Elders in the name of beasts of every ilk, to rescue there spirits from eternal pain and corruption.");
  }
  }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 6) {
  if ($text=~/greater calling/i) {
  quest::say("Irionu Bastun has discovered another spirit that suffers. I understand she has already told you about the ways of the Rhinoceros. This is yet another creature than was once easily tamed that is endangering the lives of many. More importantly, its spirit has become plagued witht he chaotic magic of discord. Irionu believes that its spirit may have been traded or confused with one from the dark realm. I need you to learn more and tell me what you know. Go find Irionu as soon as you are able to and give her this letter.");
  quest::summonitem(57996);
  }
  }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 7) {
  if ($text=~/letter/i) {
      quest::emote("reads the note and his whiskers twitch, his often bright eyes become dull. ");
      quest::say("Oh, no. What a terrible turn. How can this be? Two of our most [majestic and unique creatures] -- with such wisdom and magic. Of all, I thought these would not be touched or affected.");
}
}
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 7) {
  if ($text=~/majestic/i) {
  quest::say("You would know them as two halves of a whole, I suppose. I cannot speak their names for fear. There is so much we don't know and so many suspicions. The corruption of our precious beasts feels more than coincidence now. These creatures that stand so proud and regal know what is happening to them and we need to help them, but that path is a difficult one. I cannot tell you more as we can trust very few and there are prying eyes and ears. Go to Marrey McGrannel and ask her about the danger to our majestic creatures.");
  }
  }
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 10) {
  if ($text=~/does not end/i) {  
  quest::say("There is still much to do as the sickly magic of Discord trickles through time and space to Norrath and Luclin. It appears that we may need to go to its source. You must go to Rashara. She will have a tale to tell you that will help you on your way to ending this threat to the wild.");
  }
}
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 11) {
  if ($text=~/Rashara sent me/i) {  
  quest::say("It seems that as soon as we overcome one problem, another makes itself known. This time, though, we have found a [beast] in Discord that truly means to abuse the strength of the wild spirits");
}
}
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 11) {
  if ($text=~/beast/i) {  
  quest::say("There is a foul creature that is borne of Discord itself. We believe it has discovered a way to abuse the ways of the beastlord for its own gains. It has invaded the ethereal world of the wild and is trapping the magic and power we consider sacred. It must be [stopped] before it grows ever powerful and erodes the ability of all beastlords to be at one with our feral companions.");
}
}
if (defined $qglobals{muadalet} && $qglobals{muadalet} == 11) {
  if ($text=~/stopped/i) {  
  quest::say("Go speak to Erana Farrel. She is in the city of the dragorn and will most likely be in hiding while she investigates. She was the first to discover this evil plot and has the most information to help you. Give her this cloak. She had asked for some protection while she was out in that volatile realm.");
  quest::summonitem(52909);
}
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 57059 =>1 )) {
    quest::say("You seem to have created a reputation for yourself. I have heard of you from Dumul himself as he keeps a watch on most beastlords in the lands. I trained him when he was much younger and look how magnificent he has become. Like some others, I do see that you also have used your knowledge and skills well. The command of wild spirits is very strong with you. If you are truly in tune with the airs of spirits, you will likely know that all is not right with the [wild], no matter which path of the beastlord you follow.");
  }
  
  if (plugin::check_handin(\%itemcount, 57001 =>1, 57002 =>1, 57003 =>1, 57004 =>1 )) {
   quest::summonitem(57005); 
   quest::summonitem(57006);
  }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 5) {
  if (plugin::check_handin(\%itemcount, 57008 =>1 )) {
  quest::say("Greetings once again, $name. I am satisfied that you may now take on the greater challenges facing our kind. The problem within the spirit world is far more serious than we had first thought and needs to be addressed. It is time for you to take on your first task. Do you [believe] you are ready to continue?");
    }
  }
  if (defined $qglobals{muadalet} && $qglobals{muadalet} == 5) {
  if (plugin::check_handin(\%itemcount, 57009 =>1, 57995 =>1 )) {
    quest::say("Ah, that troubled wolf harbored a strange mix of spirits that were too volatile to control. I think we are beginning to understand the problem more. The energy from the Realm of Discord is tainting some wild creatures. From what we've learned, creatures with some age and wisdom behind them are most susceptible. It seems we cannot save them all, but we must release their spirits into the ethreal wilds of Norrath so they can be free and no longer [tortured and ruined.]");
    quest::setglobal("muadalet",6,5,"F");
  }
}
  if (plugin::check_handin(\%itemcount, 52900 =>1 )) {
    quest::say("I understand you had to end the life of that poor old drogmor. He was prized stock, you know. He was one of the oldest and most revered by those who raised the mounts. Where there was trouble with the wilds, there is now some peace. Someday you will learn to feel it too. Let me read this [letter].");
    quest::setglobal("muadalet",7,5,"F");
  }  
  if (plugin::check_handin(\%itemcount, 52905 =>1 )) {
    quest::say("Gracious, that is indeed a precious gift. I will present it to the elders when we next gather as a council. They will be overjoyed at the rescue. You may keep that Feral Lord's Brooch to yourself as a reminder of what you learned. All [does not end] here though.");
        quest::setglobal("muadalet",10,5,"F");
  }
if (plugin::check_handin(\%itemcount, 52914 =>1 )) {
  quest::say("I am honored to have had the opportunity to observe you -- a feral champion for the ills that have befallen our kind. You have certainly made your name known among us. While the spirit world is not freed from danger, it is much more promising with all that you've done. Take this token of our appreciation. It may not appear to be too much right now, but it will be very important should you [wish to continue to walk among the elders] of the lords of beasts.");
  quest::summonitem(52911);
  quest::delglobal("muadalet");
  quest::ding();
  quest::exp(100000);
}
  plugin::return_items(\%itemcount);
  $qglobals{muadalet}=undef;
}