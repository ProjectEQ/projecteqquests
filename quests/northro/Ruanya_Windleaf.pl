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
        my $tak_wins = $client->GetLDoNWinsTheme(5);
        if (!defined $qglobals{TAKtalk}) {
          quest::setglobal("TAKtalk",0,5,"F");
        }
        if ($tak_wins < 2) {
          quest::say("My ancestors have been trapped under the sands for many, many years, so many I believe they've forgotten where they came from. I would tell you more, but you would need to do a few favors for the Wayfarers Brotherhood.");
        }
        elsif ($tak_wins >= 2 && $qglobals{TAKtalk} == 0) { #2 wins
          quest::setglobal("TAKtalk",1,5,"F");
          quest::say("I must tell you, I'm a little saddened by the fate of the elves in Takish-Hiz. By all accounts, that city once held such great splendor and beauty. Now it is a such a menacing place. It does torment me some that I cannot walk amongst the echoes of my ancestors without fear. I'm so glad that you've come to hear the story though. I'm feeling somewhat morose at the moment, but I'd be glad to start this long tale another time.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 4) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 4 && $qglobals{TAKtalk} == 1) { #4 wins
          quest::setglobal("TAKtalk",2,5,"F");
          quest::say("I apologize for my depressed mood the last time we spoke $name. I am ready to begin the story of my ancestors now. The tale begins soon after the planet of Norrath began its journey around the sun, called Sol. Our fair mother of the Plane of Growth, Tunare, put the first intelligent beings on Norrath, the elves. About the same time, Brell Serilis of the Plane of Underfoot created the dwarves who dwelled inside the very crust of Norrath. Then, Prexus, the Ocean Lord, created the Kedge to rule the oceanic depths of the world. Around that time, Veeshan claimed the skies, Tunare the surface lands, Brell the underground and Prexus the seas. It wasn't that simple really, but it will have to wait. I must practice my archery now, friend. I need to be prepared for exploration and battle at all times.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 6) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 6 && $qglobals{TAKtalk} == 2) { #6 wins
          quest::setglobal("TAKtalk",3,5,"F");
          quest::say("You have returned in good time, $name. I am between tasks at the moment, but I will need to do more scouting of Takish-Hiz shortly. I wanted to tell you about a critical turning point earlier in our history. There was a time when the lands of Norrath were split amongst the gods so they would have true homes for their creations. Tunare and Solusek Ro, the Prince of Flame, both wanted to claim the Elddar Forest as their own. There was no settlement though, Tunare simply acted more quickly. As I will tell you soon, Solusek Ro took exception to Tunare's hasty creation of the elves. I must continue with my scouting now.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 8) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 8 && $qglobals{TAKtalk} == 3) { #8 wins
          quest::setglobal("TAKtalk",4,5,"F");
          quest::emote("beams with pride, her upturned eyes brightly greeting you. 'Ha, I beat my companion Escon Quickbow in an archery competition. Grand day! Yes, I have more information for you about Solusek Ro. The Prince of Flame watched the elves quietly build and live without conflict for thousands of years. Takish-Hiz was built out of wood and marble with much skill and beauty. It was so striking and bright the gods could see it glow from a great distance. Solusek Ro became envious and angry at Tunare and her creations. In fact, his vengeful acts brought ruin to the elves of Takish-Hiz.'");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 10) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 10 && $qglobals{TAKtalk} == 4) { #10 wins - Power Up
          quest::setglobal("TAKtalk",5,5,"F");
          quest::setglobal("TAKpower",1,5,"F");
          quest::say("Quickly now, $name. I have spotted some tracks nearby I do not want to lose. I just came back to the camp for supplies. Solusek Ro reached down to Antonica with his fiery touch and arched the spine of the world. The geographical act would be slow and not draw attention to his actions. He then called upon the power of the Ro, the sun. The sun began to dry the forest. Now, I really must go. I don't want to lose the tracks I found.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($tak_wins >= 12) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 12 && $qglobals{TAKtalk} == 5) { #12 wins
          quest::setglobal("TAKtalk",6,5,"F");
          quest::say("The tale gets somewhat sad at this juncture. The elves watched the outer edges of the Elddar Forest wither and die and it was progressing faster. The druids of Takish-Hiz used their most powerful magic to try to stop the advance of the drought. They would call for rain and protection from Tunare. They received neither. Solusek Ro's grip was too strong. That's all I know about that part of the story. I think you should go talk to Farwein Windrun in the south deserts of Ro. He can tell you more.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 14) {
            $client->Message(13, "You have additional information to uncover! You must speak to Farwein Windrun to find out more.");
          }
        }
        elsif ($tak_wins >= 14 && $qglobals{TAKtalk} == 6) {
          $client->Message(13, "You have additional information to uncover! You must speak to Farwein Windrun to find out more.");
        }
        elsif ($tak_wins >= 24 && $qglobals{TAKtalk} == 11) { #24 wins
          quest::setglobal("TAKtalk",12,5,"F");
          quest::emote("looks over a strange piece of blue ore and hides it when she sees you approach. 'Hail $name. These are certainly interesting times. We are seeing all sorts of new things these days. I do need to tell you what happened in Takish-Hiz that led to the demise of many of my elven ancestors. I must ask you to remember that Solusek Ro called upon the power of sun we call Ro that would ultimately be the end of the first elven city. I must continue my fletching right now, but when you return, I can tell you more.'");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 26) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 26 && $qglobals{TAKtalk} == 12) { #26 wins
          quest::setglobal("TAKtalk",13,5,"F");
          quest::say("How nice to set eyes upon you again $name. Like I had said, the destructive heat of the sun called upon by Solusek Ro brought the Elddar Forest to its end. As the trees withered and became petrified and the soil lost all of its nourishment, sands began to close in on Takish-Hiz. King and Queen Tak'Yaliz, who replaced the first King and Queen Tak'Hiz that were stolen by Innoruuk, commanded all of the elves to protect their city from the encroaching sands. Can we talk another time? Patchka Ceorvra needs my assistance with gathering some shrubs for her alchemy practice.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 28) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 28 && $qglobals{TAKtalk} == 13) { #28 wins
          quest::setglobal("TAKtalk",14,5,"F");
          quest::say("Let's begin again, $name! All of the elves of Takish-Hiz brought their strongest magic outside the city to protect it from the heat of sun. They fashioned aqueducts and resurrected trees and planted new ones to try to force the sands backward. As the natural resources needed to perform their magic dwindled, the elves had to look elsewhere. King and Queen Tak'Yaliz and their advisors called a grand assembly with the druids to propose an alternative that would be a massive undertaking. That's all I have time for right now. So much to do!");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 30) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 30 && $qglobals{TAKtalk} == 14) { #30 wins - Power Up
          quest::setglobal("TAKtalk",15,5,"F");
          quest::setglobal("TAKpower",3,5,"F");
          quest::say("Lend me your ear again, $name and we'll continue where we left off. During the assembly of the druids of Takish-Hiz, the king and queen pointed their faithful citizens toward a new magic art . . . geomancy. All of the citizens of Takish-Hiz were then given specific duties that would save the city. Some citizens were sent out to maintain the forest with shovels and seeds, and others were sent to the great libraries to learn and improve upon geomantic arts. I have to meet a fellow wood elf for more information on the story, but I'll be back soon.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($tak_wins >= 32) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 32 && $qglobals{TAKtalk} == 15) { #32 wins
          quest::setglobal("TAKtalk",16,5,"F");
          quest::say("I have more detail to give you $name. As the sands continued to pour in around the elves of Takish-Hiz like a merciless sea, parts of the city began to fall to the pressure of the failing earth. But the elves did not falter in their resolve and desire to save their home. The geomancers used the sands to form new walls where the stone crumbled. All the wood that cracked and split under the advancing sands were also replaced by reformed earth. Soon, large parts of the city were replaced with sandy architecture. Each day the elves fought to maintain their city, but it would be a battle that would seemingly never end. I must make an entry in my journal now, friend. Return soon!");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 34) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 34 && $qglobals{TAKtalk} == 16) { #34 wins
          quest::setglobal("TAKtalk",17,5,"F");
          quest::say("That Calliav certainly is an interesting sort. From time to time, he has visions about Takish-Hiz and tells me what he sees. Lucky for us, I suppose! Anyway, let us continue with the story. The king and queen of Takish-Hiz came to accept that much of their city was buried under the scorching sands and what remained was fast becoming unlivable. They saw some of their most faithful and powerful geomancers trapped in ruins of the city as some of the structures failed. It was time to make a decision. I'll tell you more about that later. I have to do some foraging. We're running low on supplies.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 36) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 36 && $qglobals{TAKtalk} == 17) { #36 wins
          quest::setglobal("TAKtalk",18,5,"F");
          quest::say("More about the elves? Good! King and Queen Tak'Yaliz used a great horn to signal to all of their citizens that it was time to flee their failing city. They decided it could not be saved. The elves, weary and worn, left the scorched earth that came to be known as the deserts of Ro and made their way across the Ocean of Tears to a new and fertile land. They began to settle in a forest named the Faydarks that was much like the Elddar Forest once was. What they did not know is that some of their ancestors did survive deep beneath the sands in Takish-Hiz. We must discuss this another time, friend. I have a guest coming soon and I need to prepare.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 38) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 38 && $qglobals{TAKtalk} == 18) { #38 wins
          quest::setglobal("TAKtalk",19,5,"F");
          quest::say("Hail, $name. I would recommend you go inquire about the decrepit state of Takish-Hiz and the elves with Niflel Faliwae in the Greater Faydarks. She has been doing a lot of research on the elves of Takish-Hiz and has quite a tale to tell. She can provide you with more insight than me. Safe journey!");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 40) {
            $client->Message(13, "You have additional information to uncover! You must speak to Niflel Faliwae to find out more.");
          }
        }
        elsif ($tak_wins >= 40 && $qglobals{TAKtalk} == 19) { #Send to other NPC
          $client->Message(13, "You have additional information to uncover! You must speak to Niflel Faliwae to find out more.");
        }
        elsif ($tak_wins >= 68 && $qglobals{TAKtalk} == 33) { #68 wins
          quest::setglobal("TAKtalk",34,5,"F");
          quest::say("The story of the sand elves is sad, is it not? While you were away, we were able to learn more about the sand elves as they move about Takish-Hiz now. The elves do retain a faint memory of what their professions used to be. The Flowkeepers oversee the movement of the sands in the city. They are somewhat like advisors to the elves and indicate when the tides of the sands are in the best position to perform summoning ceremonies. They patrol the city looking for impending damage. With a bit more time, I can tell you more, dear $name.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 70) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 70 && $qglobals{TAKtalk} == 34) { #70 wins - Power Up
          quest::setglobal("TAKtalk",35,5,"F");
          quest::setglobal("TAKpower",7,5,"F");
          quest::say("We've just returned from another expedition into Takish-Hiz. We discovered that the Geomantic Compact compliments the Flowkeepers. The compact is comprised of priests that are the primary force behind the summoning ceremonies. The Geomantic Compact is also responsible for making sure the hourglass that remains in the city is constantly turned, so the sands still indicate time. The Geomantic Compact holds the masters of geomancy. There is more study required before we continue, my friend.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($tak_wins >= 72) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 72 && $qglobals{TAKtalk} == 35) { #72 wins
          quest::setglobal("TAKtalk",36,5,"F");
          quest::say("Greetings $name! While we were exploring, we came upon the Royal attendants. They are all that is remaining of the advisors and guards of King and Queen Tak'Yaliz who had long-since abandoned the city. They became quiet workers, but they are very skilled with weapons due to their former professions. They were the warriors of the realm. Now they are just faint semblances of their former heroics. Extremely sad that there were so many survivors left behind, isn't it?");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 74) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 74 && $qglobals{TAKtalk} == 36) { #74 wins
          quest::setglobal("TAKtalk",37,5,"F");
          quest::say("It is indeed unfortunate that we lost one of our best during a jaunt to Takish-Hiz. The Jeweled Guard, remnants of the most fearsome of the elves, were the warriors and masters of battle in the city. Even in their spirit-drained state, they continue to train and behave with great discipline as they play out the habits they used to have when their spirits lived within them. While they are only shades of their former selves, they are still ferocious in a fight. In fact, I got a few scars myself from them that need attention. See you soon, $name.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 76) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 76 && $qglobals{TAKtalk} == 37) { #76 wins
          quest::setglobal("TAKtalk",38,5,"F");
          quest::say("I've discovered a bit of madness in Takish-Hiz, dear $name. The Cave Dwellers in the city are the outcasts of Takish-Hiz. Many are frail and appear crazy and unable to function. These are the most faded of the sand elves that had the weakest spirits to begin with. It's very upsetting to see the glow completely gone from their eyes, though. No matter, they are just shades of their former splendor. I must go visit with Nedaria Debeian and tell her what I've learned too.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($tak_wins >= 78) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($tak_wins >= 78 && $qglobals{TAKtalk} == 38) { #78 wins - Power Up
          quest::setglobal("TAKtalk",39,5,"F");
          quest::setglobal("TAKpower",8,5,"F");
          quest::say("I was hoping you had come to tell me something $name! I am out of information to relay to you. I suppose this means we're on equal footing! I'm fairly sure the Wayfarers Brotherhood considers you an ally by now! I've much enjoyed bending your ear with my story. I hope maybe someday you will do the same for me!");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($qglobals{MMCtalk} == 38 && $qglobals{RUJtalk} == 37 && $qglobals{MIRtalk} == 34 && $qglobals{GUKtalk} == 35) { #player has just maxed their stone
            $client->Message(13, "It's time to acknowledge you as a Wayfarer. Give Chaenz Abella in East Commonlands your Adventurer Stone and he'll replace it with your very own Wayfarers Emblem. Or, if it's being used in a charm, you must remove it to get your new one. And, if you simply destroy the stone, he will replace it with your much-deserved emblem. Just tell him you want your [emblem].");
            quest::setglobal("Wayfarer",3,5,"F");
          }
        }
        elsif ($qglobals{TAKtalk} == 39) { #Theme Complete
          quest::say("Hello again, $name! Have you gained experience in the other dungeons yet? You should talk with some of the other Wayfarers Brotherhood members."); #text made up
        }
        else {
          $client->Message(9, "You need to adventure some more in Takish-Hiz."); #text made up
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
  plugin::return_items(\%itemcount);
}