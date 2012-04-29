#
#Quest: Adventurer's Stone
#
#Selephra Giztral, Barstre Songweaver, Vual Stoutest, Teria Grinntli, or Ruanya Windleaf

sub EVENT_SAY {
  if ($ulevel >= 15) {
    if (defined($qglobals{Wayfarer}) && ($qglobals{Wayfarer} == 1)) { #PC has spoken to home town Wayfarer recruiter but not received Adventurer's Stone
      if ($text=~/hail/i) {
        quest::say("Welcome stranger. I'm afraid you must answer some questions before I can consider opening our wealth of skill and knowledge to you. First, what does the Wayfarers Brotherhood call the tasks they will ask you to do for them?");
      }
      if ($text=~/adventures/i) {
        $client->Message(15, "You have completed a step toward becoming a great adventurer. Well done!");
        quest::say("We will reward based on your improving position with the Wayfarers Brotherhood. We keep a certain type of log that records how often and well you help us. What is it called?");
      }
      if ($text=~/favor journal/i) {
        $client->Message(15, "You have completed a step toward becoming a great adventurer. Well done!");
        quest::say("Who discovered that some treasures have strange magical properties by poking one with his dagger?");
      }
      if ($text=~/morden rasp/i) {
        $client->Message(15, "You have completed a step toward becoming a great adventurer. Well done!");
        quest::say("Our brilliant magi use a special kind of magic to help teleport us between camps. What is it called?");
      }
      if ($text=~/farstone/i) {
        $client->Message(15, "You have completed a step toward becoming a great adventurer. Well done!");
        quest::say("Congratulations! I believe now that you are trustworthy enough to take on some of the adventures the Wayfarers Brotherhood have to give. We will be able to continue with our discussions once you complete some adventures. We can also help you with travel between our camps. Be well, fair $name. I'm sure, someday, you will be a great addition to the Wayfarers Brotherhood.");
        quest::faction(356,50); #Wayfarers Brotherhood
        quest::setglobal("Wayfarer",2,5,"F");
        quest::say("Take this Adventurer Stone with you on your journeys into the dungeons. You will find it useful. Should you lose it somehow, come talk to me and I'll replace it.");
        quest::summonitem(41000); #Adventurer's Stone
        $client->KeyRingAdd(41000);
      }
    }
    elsif (defined($qglobals{Wayfarer}) && ($qglobals{Wayfarer} == 2)) { #PC is ready for Adventurer's Stone
      if (!plugin::check_hasitem($client,41000)) { #PC does not have an Adventurer's Stone
        quest::say("Take this Adventurer Stone with you on your journeys into the dungeons. You will find it useful. Should you lose it somehow, come talk to me and I'll replace it.");
        quest::summonitem(41000); #Adventurer's Stone
      }
      else { #PC has an Adventurer's Stone already
        my $mmc_wins = $client->GetLDoNWinsTheme(3);
        if (!defined($qglobals{MMCtalk})) {
          quest::setglobal("MMCtalk",0,5,"F");
        }
        if ($mmc_wins < 2) {
          quest::say("Hello, $name. How do you like the adventures?"); #Text made up
        }
        elsif ($mmc_wins >= 2 && $qglobals{MMCtalk} == 0) { #2 wins
          quest::setglobal("MMCtalk",1,5,"F");
          quest::say("Greetings. I've been sent here to keep watch over what transpires in Mistmoore's Catacombs. I'm sure you know already that the Wayfarers Brotherhood are spread far and wide across Norrath. Morden Rasp, our leader if you didn't know, asked me to be a bit wary of those we're not chums with. Sorry to say you don't familiar to me. If you manage to do a few jobw for us, though, I may be able to provide you with some information I ahve about Mistmoore's Catacombs. Xyzelauna Tu`Valzir may have some work you can do.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 4) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 4 && $qglobals{MMCtalk} == 1) { #4 wins
          quest::setglobal("MMCtalk",2,5,"F");
          quest::say("Well, we still have not seen hide nor hair of Mayong Mistmoore. Still, he remains elusive. Some fancy that he is biding his time in the Underfoot. I find it strange that he would not return to protect the catacombs we have now discovered. Our very presence there threatens all he has built there.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 6) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 6 && $qglobals{MMCtalk} == 2) { #6 wins
          quest::setglobal("MMCtalk",3,5,"F");
          quest::say("Remember when I told you that Mayong Mistmoore is nowhere to be found? There is a reason for it. He doesn't wish to be found. We have found journals and notes that indicate that Mayong, the first vampire of Norrath, is so consumed with achieving perfection that he cares for no one else. Those he has left behind in that dark place don't know this or refuse to accept it, because they all seek his favor. Strange way to live, or not live as is the case with the undead.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 8) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 8 && $qglobals{MMCtalk} == 3) { #8 wins
          quest::setglobal("MMCtalk",4,5,"F");
          quest::say("Hello $name. You may be interested in this . . . We found a journal written by one of Mayong's servants who has long since disappeared. The suggestion is that Mayong's children are left in such disarray because his children, castle, and the catacombs are simply a whim; an experiment. Mayong surrounded his castle with the much-feared Teir'Dal whom he feels are suitabe victims for what he feels is a gift. He felt that Norrathians would be more likely to keep their distance from the Teir'Dal. I can tell you after seeing the catacombs for myself that I too am fearful of the immortal blood which courses through him and his offspring.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 10) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 10 && $qglobals{MMCtalk} == 4) { #10 wins - Power Up
          quest::setglobal("MMCtalk",5,5,"F");
          quest::setglobal("MMCpower",1,5,"F");
          quest::say("I have to make this quick. So far, I've found out there are several different castes of vampires down there. I know there are Orphans, Sustainers, Loyals and Progeny. It also seems like those organizations of vampires are split. It's clear to me so far that the Orphans are the lowest and most filthy class of vampires in the catacombs. If you come back fairly soon, I will probably be able to learn more.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($mmc_wins >= 12) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 12 && $qglobals{MMCtalk} == 5) { #12 wins
          quest::setglobal("MMCtalk",6,5,"F");
          quest::say("You sure are a budding adventurer, my friend. While you are not equipped to tumble the great immortal powers that fester within Mistmoore's Catacombs, you are certainly skilled enough to cause a rift between the scrambling beasts. There is more information about those denizens in the dark. I've heard whisperings about the class of vampires known as the Orphans. I think you might find there is a growing conflict between the two sects within the Orphans, called the Nightrage and the Savagefang. That's about all I know right now, I'm afraid.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 14) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 14 && $qglobals{MMCtalk} == 6) { #14 wins
          quest::setglobal("MMCtalk",7,5,"F");
          quest::say("Well, greetings again! While you were hunting in the dark caverns of Mistmoore's Catacombs we have learned a bit more about what is transpiring in that evil place. It seems that the Savagefang are at odds with the Nightrage. We are trying to learn more about them. We hear that the Savagefang find themselves superior to the other tribe. As I understand the rumors, the Savagefang are looking to rise above their lowly station having been shunned by the pure-blooded vampires. I'm not certain how they plan to gain power, but if you are able to spend more time amongst them, you may be the key that grants us that answer. Best of luck to you in thwarting this evil!");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 16) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 16 && $qglobals{MMCtalk} == 7) { #16 wins
          quest::setglobal("MMCtalk",8,5,"F");
          quest::say("My how you have grown, fair $name. I have missed your visits. I have more to tell you about the Savagefang, finally. A traitor of Mistmoore came to us and squealed about the intentions of the Savagefang. It would seem that the  only way that clan can improve its power in the catacombs is to lure more vampires into their chambers. It seems the Savagefang are cannibals and will eat nothing but others like them! Because you and your fellow adventurers have been so thorough with your assistance, the Savagefang are running out of food. Now may be the best time to strike at them and upset their immortal blood flow. Beware the Nightrage too though. While the Savagefang won't be interested in taking a bit of you, the others will. Have no doubt.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 18) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 18 && $qglobals{MMCtalk} == 8) { #18 wins
          quest::setglobal("MMCtalk",9,5,"F");
          quest::say("Ah, the ways of the Nightrage is becoming more clear. They are a most savage ilk of vampire. After some observation, it's been confirmed that the Nightrage consume their victims whole. And, yes, as their name suggests, they most often feed at night. But it's always night in Mistmoore's Catacombs. Those varmints are always hungry. Ever on the hunt. Be on your guard of these creatures.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 20) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 20 && $qglobals{MMCtalk} == 9) { #20 wins - Power Up
          quest::setglobal("MMCtalk",10,5,"F");
          quest::setglobal("MMCpower",2,5,"F");
          quest::say("$name, it is indeed good to see you again! As you probably figured out for yourself, the Nightrage and Savagefang are caught in an eternal vicious cycle. Mayong Mistmoore continues to be absent and unconcerned with the ways of the catacombs. Consumed with his own importance, as long as his minions remains constant and in balance, it is likely Mayong won't appear here to solidify the pecking order. That means it's up to us to keep these foul creatures under control.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($mmc_wins >= 22) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 22 && $qglobals{MMCtalk} == 10) { #22 wins
          quest::setglobal("MMCtalk",11,5,"F");
          quest::say("It's been somewhat slow here the past while. We've had to venture deeper to get more information. Henai Silentwalker, one of the Wayfarers Brotherhood's best rogues, has been able to get more information about the catacombs. He hasn't been back this way in a while, so you can probably catch him in Dagnor's Cauldron.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 24) {
            $client->Message(13, "You have additional information to uncover! You must speak to Henai Silentwalker to find out more.");
          }
        }
        elsif ($mmc_wins >= 24 && $qglobals{MMCtalk} == 11) { #Send to other NPC
          $client->Message(13, "You have additional information to uncover! You must speak to Henai Silentwalker to find out more.");
        }
        elsif ($mmc_wins >= 38 && $qglobals{MMCtalk} == 18) { #38 wins
          quest::setglobal("MMCtalk",19,5,"F");
          quest::say("Well, $name. Welcome back! By the looks of you, I can tell you're ready to learn more about what is transpiring down in Mistmoore's Catacombs. Did you know that the horrid place is woven beneath all of the lands of Faydwer? We here, this group of coarse explorers, have uncovered secret entrances into Mistmoore's Catacombs. The labyrinth of tunnels and tombs extends outward from the Mistmoore Castle foundations like an evil claw. It's going to take a long time to explore the entire network of evil that has burrowed underground.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 40) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 40 && $qglobals{MMCtalk} == 19) { #40 wins - Power Up
          quest::setglobal("MMCtalk",20,5,"F");
          quest::setglobal("MMCpower",4,5,"F");
          quest::say("Ah, you again. I'm going to assume you've become aware of some of what lurks in those dead-ridden halls of Mistmoore's Catacombs. I've done some research on the Loyals class of the vampires. I've determined that the Loyals are those vampires that are in the service of the most powerful and elite vampires, the Trueborn. Some of the members of the Loyals are older than the elite, or Mistmoore-borne, vampires themselves!");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($mmc_wins >= 42) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 42 && $qglobals{MMCtalk} == 20) { #42 wins
          quest::setglobal("MMCtalk",21,5,"F");
          quest::say("So, $name, you wish to learn more? That is admirable! I've figured out that within the class of Loyals there are two sects. One is called the Bloodguard; the other, the Stewards. While the Bloodguard are tasked with protecting the catacombs an their own masters, they also ferociously guard the secrets and strength of the immortality granted by vampires. The Stewards are in the service of elite vampires. Their duties range from advisors to tailors, satisfying all of the narcissistic whims of their masters.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 44) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 44 && $qglobals{MMCtalk} == 21) { #44 wins
          quest::setglobal("MMCtalk",22,5,"F");
          quest::say("The Bloodguard and the Stewards have been turning their eyes to each other lately. It looks like the Bloodguard is preparing an offensive attack that will all but decimate the Stewards. Words came to me on the wings of a bat about the Stewards trying to convince the elite vampires that the Bloodguard were no longer necessary and tthat a political power struggle may be on the horizon. There was some mention of some strange ore deep within the caverns too.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 46) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 46 && $qglobals{MMCtalk} == 22) { #46 wins
          quest::setglobal("MMCtalk",23,5,"F");
          quest::say("The Stewards have been collecting some strange ore that carries a strong aura of magic. It's clear that even the wise Stewards are not sure what the ore is for. The Bloodguard have also begun too collect the ore. The lower classes of Mistmoore's Catacombs also have orders to find more of the mysterious fragments.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 48) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 48 && $qglobals{MMCtalk} == 23) { #48 wins
          quest::setglobal("MMCtalk",24,5,"F");
          quest::say("Morden Rasp has advised us to continue collecting the treasures and gems from Mistmoore's Catacombs for the time being. At the same time, we are keeping a healthy balance between the two sects of power among the Loyals. I don't believe those creatures can exist without conflict with one another. Over this time, we have learned this much. It is our job to keep them in check, from now until the end of time, or the end of them. The Progeny are certainly a bigger problem as they are more intelligent and a great deal more devious.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 50) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 50 && $qglobals{MMCtalk} == 24) { #50 wins - Power Up
          quest::setglobal("MMCtalk",25,5,"F");
          quest::setglobal("MMCpower",5,5,"F");
          quest::say("The adventure party from the Wayfarers Brotherhood has been lost to the undead in Mistmoore's Catacombs. This has been terrible for us. We haven't received any new information in days. However, I hear that Elwinn Prelliaen has got himself a vampire that escaped the catacombs. The vampire was young and yearned for his mortal life. Elwinn was able to convince him to talk in exchange for some protection. I'm sure he's got access to secrets that I don't. He's deep in the lesser Faydarks.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($mmc_wins >= 52) {
            $client->Message(13, "You have additional information to uncover! You must speak to Elwinn Prelliaen too find out more!");
          }
        }
        elsif ($mmc_wins >= 52 && $qglobals{MMCtalk} == 25) { #Send to other NPC
          $client->Message(13, "You have additional information to uncover! You must speak to Elwinn Prelliaen too find out more!");
        }
        elsif ($mmc_wins >= 62 && $qglobals{MMCtalk} == 30) { #62 wins
          quest::setglobal("MMCtalk",31,5,"F");
          quest::say("Welcome once again, $name. It's been some time since I've seen you. You are indeed more powerful, I can see it in your eyes. I'm sure you are one of the great adventurers responsible for keeping the undead in Mistmoore's Catacombs under some control. The bloo of the vampire is so foul, is it not? By the way, I've learned more. The pride and desire for power among the Trueborn and the Scions is keeping their numbers relatively even, though it shifts from time to time. It's remarkable really.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 64) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 64 && $qglobals{MMCtalk} == 31) { #64 wins
          quest::setglobal("MMCtalk",32,5,"F");
          quest::say("I think I'm beginning to understand those vampires better. I always wondered why they seemed to coexist quietly while their hated was so palpable it weighed on the air. And there was always death everywhere. During one excursion to the catacombs, I was observing from the inside of a coffin and I saw a silent assassin end the existence of one of the Trueborn. I surmised that assassinations among them must be frequent.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 66) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 66 && $qglobals{MMCtalk} == 32) { #66 wins
          quest::setglobal("MMCtalk",33,5,"F");
          quest::say("The more time we spend down there $name, the more dangerous it becomes for us all. It just never seems to end! Unfortunately, Norrath's less experienced adventurers and friends in the Wayfarers Brotherhood have lost their mortal lives and ow walk with the vampires and undead. If only there was a way to resuce them?");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 68) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 68 && $qglobals{MMCtalk} == 33) { #68 wins
          quest::setglobal("MMCtalk",34,5,"F");
          quest::say("Back again, eh $name? Thankfully, many of the Wayfarers Brotherhood's adventurers have fed us information. Have you noticed that the Scions are restless? It turns out that memories of their mortal lives still haunt them. Did you know that some of the Scions havenot fully succumbed to the life of a vampire? We just recently learned that ourselves! For some time, they are able to resist the full descent into one of Mayong's children. They also keep the company of the living at times. Very strange indeed.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 70) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 70 && $qglobals{MMCtalk} == 34) { #70 wins - Power Up
          quest::setglobal("MMCtalk",35,5,"F");
          quest::setglobal("MMCpower",7,5,"F");
          quest::say("The Trueborn and Scions spend so much time focusing on getting attention and praise they will never receive. Mayong Mistmoore has not been back here since the Wayfarers Brotherhood found his catacombs. We are fairly certain Mayong has no interest here other than keeping a sufficient force of vampires and undead. Some think that Mayong aims to start a war. I do not. I simply believe he's trying to maintain the power of the numbers of his children and servants so that if he need to war, he can. My view? I think he aims to become a deity of his own making.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($mmc_wins >= 72) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 72 && $qglobals{MMCtalk} == 35) { #72 wins
          quest::setglobal("MMCtalk",36,5,"F");
          quest::say("Both of the Progeny sects, the Trueborn and the Scions, have been collecting a strange ore from the lower classes in the catacombs. A deal was struck between the Progeny and the Orphans. The Orphans, the lowest rung on the ladder down there, have been supplying ore to the elites to learn what it is for. There are some among us who have made many educated guesses that I can't share with you unfortunately. We may have more for you a ways down the road of time.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 74) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 74 && $qglobals{MMCtalk} == 36) { #74 wins
          quest::setglobal("MMCtalk",37,5,"F");
          quest::say("Gracious me, $name! Just when I believed you couldn't gain more experience and skill you show up here even more powerful than before. By the way, even more intrigue haunts the halls of Mistmoore's Catacombs. The Trueborn and Scions are back at their petty and useless attempts to be acknowledged by Mayong. The assassinations in their ranks are now rampant. And, with the intervention of the Wayfarers Brotherhood, the vampires never seem to achieve strong organization. Oh, and that ore they are storing away is starting to hum with unnatural energy. Very peculiar.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($mmc_wins >= 76) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($mmc_wins >= 76 && $qglobals{MMCtalk} == 37) { #76 wins - Power Up
          quest::setglobal("MMCtalk",38,5,"F");
          quest::setglobal("MMCpower",8,5,"F");
          quest::say("My good friend, $name! I've been contemplating the constant replenishment of the vampires in Mistmoore's Catacombs. It has occurred to me that many fallen comrades and curious Norrathians have succumbed to the vampires' tainted blood. Who can say if the vampires lust for more than only power. Or, has Mayong been visiting his catacombs? I'm not sure, but I'm suspicious. Still, the vampires seek to steal the best and brightest from the mortal realm. For so long as they have depended on secrecy to hide their existence and actions, and now they must not just fight themselves, but us as well. Who is to say what will happen in the future?");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($qglobals{RUJtalk} == 37 && $qglobals{MIRtalk} == 34 && $qglobals{TAKtalk} == 39 && $qglobals{GUKtalk} == 35) { #player has just maxed their stone
            $client->Message(13, "It's time to acknowledge you as a Wayfarer. Give Chaenz Abella in East Commonlands your Adventurer Stone and he'll replace it with your very own Wayfarers Emblem. Or, if it's being used in a charm, you must remove it to get your new one. And, if you simply destroy the stone, he will replace it with your much-deserved emblem. Just tell him you want your [emblem].");
            quest::setglobal("Wayfarer",3,5,"F");
          }
        }
        elsif ($qglobals{MMCtalk} == 38) { #Theme finished
          quest::say("Well, I must say I'm impressed! You know as much as the Wayfarers Brotherhood about these dungeons that have been uncovered. Nicely done, $name!");
        }
        else {
          $client->Message(9, "You need to do some more adventuring."); #Text made up
        }
      }
    }
    elsif (defined($qglobals{Wayfarer}) && ($qglobals{Wayfarer} == 3)) {
      quest::say("Well, I must say I'm impressed! You know as much as the Wayfarers Brotherhood about these dungeons that have been uncovered. Nicely done, $name!"); #text copied from Vual's completed MMC line until we know what it should be
    }
    elsif (defined($qglobals{Wayfarer}) && ($qglobals{Wayfarer} == 4) && !plugin::check_hasitem($client, 40999)) { #PC has earned Wayfarers Brotherhood Emblem
      quest::say("I see you may have lost or misplaced your emblem. Here, take this replacement."); #Text made up
      quest::summonitem(40999); #Wayfarers Brotherhood Emblem
    }
    else { #PC has not talked to hometown Wayfarer recruiter yet
      quest::say("You will have to excuse me, I am quite busy. Maybe you can talk to a Wayfarer in your home town?"); #Text made up
    }
  }
  else {
    quest::say("You will have to excuse me, I am quite busy."); #Text made up
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}