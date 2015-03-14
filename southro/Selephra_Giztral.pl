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
        my $guk_wins = $client->GetLDoNWinsTheme(1);
        if (!defined($qglobals{GUKtalk})) {
          quest::setglobal("GUKtalk",0,5,"F");
        }
        if ($guk_wins < 2) {
          quest::say("The curse in Deepest Guk is incredibly strong. It's interesting how Deepest Guk came to be ike it is today. If you manage to do some work for us, I will share the story with you!");
        }
        elsif ($guk_wins >= 2 && $qglobals{GUKtalk} == 0) { #2 wins
          quest::setglobal("GUKtalk",1,5,"F");
          quest::say("Ahem, sorry. I had a fly stuck in my throat. By the looks of you, I'd say you're an adventurous spirit. Unfortunately, many similar spirits have been lost in that slimy place we now call Deepest Guk. In fact, those who have been overcome by the curse that creeps in there have lost their very souls. I'm hoping the next time we talk I'll have more information for you. Take care, most-promising hero.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($guk_wins >= 4) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 4 && $qglobals{GUKtalk} == 1) { #4 wins
          quest::setglobal("GUKtalk",2,5,"F");
          quest::emote("looks at you with one eye while the other surveys the surroundings. 'Well, I can smell the stench of that curse on you. That is the curse that was set upon the frogloks after they had driven the trolls out of their city. I hesitate to say too much more, because it sounds like a bit of fancy at the moment. Come back soon.'");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($guk_wins >= 6) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 6 && $qglobals{GUKtalk} == 2) { #6 wins
          quest::setglobal("GUKtalk",3,5,"F");
          quest::say("It's good to see that you remain healthy, my friend. As time passes, I see more fair Norrathians fall to the curse down there. I do know that the curse was brought upon the frogloks through a troll, but we're hoping to learn more about the nature of it. The curse itself is like a living, breathing monstrosity that feeds on the souls of the living, twisting them into hateful pawns. The curse does have an epicenter too -- and it is most difficult to resist surrender to the curse there. Awful thing, it is. See you soon.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($guk_wins >= 8) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 8 && $qglobals{GUKtalk} == 3) { #8 wins
          quest::setglobal("GUKtalk",4,5,"F");
          quest::say("It's no wonder the trolls are so put off by my people. After all, we did rob them of their cities, both Guk and Grobb. I'm thankful that Mithaniel Marr sent down a blessing to the frogloks to help us overcome those foul trolls. You know, since the beginning, frogloks and trolls have warred with one another. I can tell you more later.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($guk_wins >= 10) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 10 && $qglobals{GUKtalk} == 4) { #10 wins - Power Up
          quest::setglobal("GUKtalk",5,5,"F");
          quest::setglobal("GUKpower",1,5,"F");
          quest::say("Ah, yes, I didn't quite explain how Mithaniel Marr blessed my people last time we talked. In fact, we have been blessed twice! I'm so glad you inquired. It's a very intriguing tale. I think you should go talk to a friend of mine - Bealya Tanilsuia in the West Commonlands. She is somewhat of a historian and can tell you more about how the frogloks of Gukta came to be. It's well worth knowing.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($guk_wins >= 12) {
            $client->Message(13, "You have additional information to uncover! You must speak to Bealya Tanilsuia to find out more.");
          }
        }
        elsif ($guk_wins >= 12 && $qglobals{GUKtalk} == 5) { #Send to other NPC
          $client->Message(13, "You have additional information to uncover! You must speak to Bealya Tanilsuia to find out more.");
        }
        elsif ($guk_wins >= 32 && $qglobals{GUKtalk} == 15) { #32 wins
          quest::setglobal("GUKtalk",16,5,"F");
          quest::say("Welcome back $name. Bealya Tanilsuia told you some of the history behind my people and the trolls, hm? Now, getting to Mithaniel Marr, my creator. When Mithaniel Marr walked the lands of Norrath before man was created, Cazic-Thule, the god of Fear, wished to seduce Mithaniel to his side. Many of Cazic-Thule's mortal minions were sent to assault Mithaniel Marr's mind and spirit. Mithaniel was strong and the minions could not instill within him the fear of their dark lord. However, they did succeed in luring the brave Mithaniel to the swamps of Norrath. An army of trolls, lizards, and other creatures of unspeakable horror plagued Mithaniel Marr and he became a captive to the minions of Fear.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($guk_wins >= 34) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 34 && $qglobals{GUKtalk} == 16) { #34 wins
          quest::setglobal("GUKtalk",17,5,"F");
          quest::say("Now, Mithaniel Marr, trapped in his prison in the swamps, prayed to his father, Tarew Marr the Water Lord, for salvation until he was so exhausted he fell into slumber. While he slept, Terris-Thule, Queen of Nightmares, attempted to steal Mithaniel Marr's Gift of Life at the behest of Cazic-Thule.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($guk_wins >= 36) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 36 && $qglobals{GUKtalk} == 17) { #36 wins
          quest::setglobal("GUKtalk",18,5,"F");
          quest::say("Hm, where were we? Oh yes, Terris-Thule attempted to capture Mithaniel's Gift of Life while he slept. It wasn't long before Morell-Thule, the forsaken son of Cazic-Thule, wanted to thwart his sister's efforts and intervened. Morell-Thule managed to harness Mithaniel's Gift of Life before his sister could and he split it in two. One half he spread across the swamps of Norrath and the sacred lands of his father, Cazic-Thule. The other half he gave to Mithaniel Marr's sister, Erollisi Marr, the goddess of Love. Oh, I must stop here. I need to get something else done. I'll have more for you soon. Be well, $name.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($guk_wins >= 38) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 38 && $qglobals{GUKtalk} == 18) { #38 wins
          quest::setglobal("GUKtalk",19,5,"F");
          quest::say("Right, well, when Mithaniel Marr's Gift of Life fell upon the swamps of Norrath, the first blessed froglok tads were born. Those first tads faced the greatest challenges because the swamps were overrun with the destructive minions of the gods of Fear and Hate. Fortunately, the Gift of Life empowered the frogloks with the bravery and valor of Mithaniel. They survived and flourished. And, that is how my frogloks ancestors came to be, but that's not the end of the tale.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($guk_wins >= 40) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 40 && $qglobals{GUKtalk} == 19) { #40 wins - Power Up
          quest::setglobal("GUKtalk",20,5,"F");
          quest::setglobal("GUKpower",4,5,"F");
          quest::say("So, let's begin again, shall we $name? The lord of Dreams, Morell-Thule, still had a part to play. He gifted the frogloks with dreams of the imprisoned Mithaniel Marr and offered them visions that would help free him from his prison. In time, the first adult frogloks rose in arms against the minions of Cazic-Thule, fighting valiantly to the site of Mithaniel Marr's imprisonment. They failed many times, sadly.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($guk_wins >= 42) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 42 && $qglobals{GUKtalk} == 20) { #42 wins
          quest::setglobal("GUKtalk",21,5,"F");
          quest::say("One moment. Oh yes, now I remember where we left off $name. The frogloks continued to fight the hordes of Fear and Hate to reach Mithaniel Marr's prison, but were not able to overcome the strength and experience of the dark gods' minions. In time, a small army arrived on the borders of the swamp to aid them. I've run off at the mouth again! I have other things to tend to. I'll talk with you soon, friend.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($guk_wins >= 44) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 44 && $qglobals{GUKtalk} == 21) { #44 wins
          quest::setglobal("GUKtalk",22,5,"F");
          quest::say("The army, right. An army of barbarians, Erollisi Marr's children, arrived in the swamp to assist the frogloks. They were drawn to the site of Mithaniel's prison through visions, much like the frogloks. Seeking justice for the imprisonment of Mithaniel, the brother of Erollisi, the barbarians joined with the froglok armies and freed Mithaniel Marr. Interesting, isn't it? Well, $name, that's all I can tell you for now.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($guk_wins >= 46) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 46 && $qglobals{GUKtalk} == 22) { #46 wins
          quest::setglobal("GUKtalk",23,5,"F");
          quest::say("Now, while my people advanced and became organized, the troll clans still warred with each other and the Grozmok Stone was being tossed back and forth like a hot potato. A time came when most of the protectors of Grobb ignorantly left for Broken Skull Rock to retrieve the Grozmok Stone for Grobb. That was when we gathered our forces and prayed to Mithaniel Marr to bless us. And he did. He infused many of us with much-improved strength and purity of heart. With ferocious loyalty and purpose, we took Grobb from the trolls. That is how Gukta, Outpost of Marr, was created. I'll tell you more soon, I promise you, $name. Time is precious these days.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($guk_wins >= 48) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 48 && $qglobals{GUKtalk} == 23) { #48 wins
          quest::setglobal("GUKtalk",24,5,"F");
          quest::say("Greetings once again, $name. I told you that we ran the trolls out of what was once Grobb, did I not? Well, the remaining trolls fled to make their home with the dark elves in Neriak. The dark elves wished to get more information about the Grozmok Stone and the Broken Skull clan of trolls, so they allowed them to stay. The Grozmok Stone never returned to Grobb. I believe it is in safekeeping though. I cannot say anymore about that, for now.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($guk_wins >= 50) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 50 && $qglobals{GUKtalk} == 24) { #50 wins - Power Up
          quest::setglobal("GUKtalk",25,5,"F");
          quest::setglobal("GUKpower",5,5,"F");
          quest::say("So, on to where we are now. As my people gained strength and wisdom, we aimed to recapture the lands that belonged to us. Those lands included the swamp, Grobb, and now we turn our eyes to the old ruins of Guk, particularly Deepest Guk. To that end, we sent our most noble and valorous paladins to abolish the curse that tore through our froglok ancestors and anything that got close to it. It would seem you would do well to learn more about the origins of the curse. Please go to the Innothule Swamp and look for Deblik Grumblok, a troll friend of mine in the Wayfarers Brotherhood. He has a unique insight into the tale.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($guk_wins >= 52) {
            $client->Message(13, "You have additional information to uncover! You must speak to Deblik Grumblok to find out more.");
          }
        }
        elsif ($guk_wins >= 52 && $qglobals{GUKtalk} == 25) { #Send to other NPC
          $client->Message(13, "You have additional information to uncover! You must speak to Deblik Grumblok to find out more.");
        }
        elsif ($guk_wins >= 68 && $qglobals{GUKtalk} == 33) { #68 wins
          quest::setglobal("GUKtalk",34,5,"F");
          quest::say("Ah, back again I see. I'm glad that Deblik was able to fill in some gaps about what's going on here. It is certainly true that the curse in Deepest Guk is stronger than anywhere else. Our greatest conundrum now is how to stop it. As the curse comes from a portal that touches Innoruuk's powerful Cauldron of Hate, we have a formidable task ahead.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($guk_wins >= 70) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($guk_wins >= 70 && $qglobals{GUKtalk} == 34) { #70 wins - Power Up
          quest::setglobal("GUKtalk",35,5,"F");
          quest::setglobal("GUKpower",7,5,"F");
          quest::say("Stay alert, $name. You have been a good ear and just as much an expert on Deepest Guk as any one of us. Be well in your travels friend. You are fast becoming one of us. Bless you and the Wayfarers Brotherhood.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($qglobals{MMCtalk} == 38 && $qglobals{RUJtalk} == 37 && $qglobals{MIRtalk} == 34 && $qglobals{TAKtalk} == 39) { #player has just maxed their stone
            $client->Message(13, "It's time to acknowledge you as a Wayfarer. Give Chaenz Abella in East Commonlands your Adventurer Stone and he'll replace it with your very own Wayfarers Emblem. Or, if it's being used in a charm, you must remove it to get your new one. And, if you simply destroy the stone, he will replace it with your much-deserved emblem. Just tell him you want your [emblem].");
            quest::setglobal("Wayfarer",3,5,"F");
          }
        }
        elsif ($qglobals{GUKtalk} == 35) { #Theme Complete
          quest::say("Hello again, $name! Have you gained experience in the other dungeons yet? You should talk with some of the other Wayfarers Brotherhood members."); #text made up
        }
        else {
          $client->Message(9, "You need to adventure some more in Deepest Guk."); #text made up
        }
      }
    }
    elsif (defined($qglobals{Wayfarer}) && ($qglobals{Wayfarer} == 3)) { #All Themes Complete
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
  plugin::return_items(\%itemcount);
}