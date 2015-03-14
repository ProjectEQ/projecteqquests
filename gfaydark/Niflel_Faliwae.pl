# NPC: Niflel Faliwae (54183)
# Zone: gfaydark (Greater Faydark)
# Quest:
#   Adventure in Takish-Hiz (LDoN charm power up)

sub EVENT_SAY {
   if ($text=~/hail/i) {
      if (defined($qglobals{TAKtalk}) && plugin::check_hasitem($client, 41000)) {
         my $tak_wins = $client->GetLDoNWinsTheme(5);
         if ($tak_wins >= 40 && $qglobals{TAKtalk} == 19) {
            # 40 wins - TAKtalk 20, TAKpower 4
            quest::setglobal("TAKtalk",20,5,"F");
            quest::setglobal("TAKpower",4,5,"F");
            quest::say("Ah, you've come to learn of the fate of the elves of Takish-Hiz. Well, as the elves of the Elddar Forest fled to Faydwer, some that were trapped under the sands within the city of Takish-Hiz continued their efforts to prevent the sand from completely taking over the city. There were many of them and they were completely unaware that the city was abandoned and expended all of their energy trying to rebuild the city and free themselves. It is the hour for me to meditate friend, but I would be pleased if you returned to hear more.");
            $client->Message(15, "You have received an invaluable piece of information!");
            $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
            if ($tak_wins >= 42) {
               $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
            }
         }
         elsif($tak_wins >= 42 && $qglobals{TAKtalk} == 20) {
            # 42 wins - TAKtalk 21
            quest::setglobal("TAKtalk",21,5,"F");
            quest::say("I am happy you have returned. The fate of my ancestors is significant in my opinion. The elves buried in Takish-Hiz began to get desperate over time. Food supplies and natural resources were dwindling at an alarming rate. They needed to buy time for their rescue. Then, the masters of geomancy agreed to conduct a most unusual experiment, mostly out of curiosity, but all quietly recognizing it may be useful in the future. They gathered a number of insects and began to reconstruct their biology with sand using the geomantic arts. It took many attempts before the first insect survived with legs made of sand. Once they had mastered the recreation of limbs, they turned their focus to organs and brains of the lowest forms of living creature in the sand-filled city. Sorry, $name. This is a long tale and I must break it into digestible portions. Return soon and I will tell you more.");
            $client->Message(15, "You have received an invaluable piece of information!");
            if ($tak_wins >= 44) {
               $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
            }
         }
         elsif($tak_wins >= 44 && $qglobals{TAKtalk} == 21) {
            # 44 wins - TAKtalk 22
            quest::setglobal("TAKtalk",22,5,"F");
            quest::say("I keep finding more information on the elves, the more time I spend in Takish-Hiz. Yes, back to the geomancers endeavors. While the insects they experimented with had no brains to speak of, the geomancers were able to recreate the insects entirely and the resulting sandy beings behaved normally in their eyes. With what they had learned from those experiments, the elves were able to summon a variety of creatures that could assist them with keeping the city repaired. More another time then, $name? I do hope so.");
            $client->Message(15, "You have received an invaluable piece of information!");
            if ($tak_wins >= 46) {
               $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
            }
         }
         elsif($tak_wins >= 46 && $qglobals{TAKtalk} == 22) {
            # 46 win - TAKtalk 23
            quest::setglobal("TAKtalk",23,5,"F");
            quest::say("I've found a journal with the most thrilling story! It says that when the remaining food was nearly all consumed in Takish-Hiz, the surviving elves had to consider alternatives on how they would live. Collectively, they had some ideas with implications that were horrific to the geomancers. But then, one brave elf, Cirwea Strongbow, overlooked the geomancers discomfort and begged them to use his body for a most dangerous experiment. As Cirwea's arm was crushed when part of a great stone wall fell on him, he hoped the geomancers could replace it with their magic. His arm was turning black quickly and he feared he would die anyway. He was also hoping he might be the first elf that would be completely turned to sand. Find me soon $name and we'll go further on the path of this story. I need to read more myself.");
            $client->Message(15, "You have received an invaluable piece of information!");
            if ($tak_wins >= 48) {
               $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
            }
         }
         elsif($tak_wins >= 48 && $qglobals{TAKtalk} == 23) {
            # 48 wins - TAKtalk 24
            quest::setglobal("TAKtalk",24,5,"F");
            quest::say("Hello $name. I've spent much time reading and piecing the story of the elves together. As it happens, the geomancers were reluctant and afraid that Cirwea could lose his young life altogether if they experimented on his arm. However, Cirwea urged them on. He convinced them he would die anyway as there was nearly no food left and his arm was rife with disease. The geomancers acquiesced and worked for many days to prepare, practicing on several creatures that were available to them. When the geomancers were more confident, they coaxed the last wolf of Takish-Hiz into their special summoning chambers. They managed to completely replace the wolf's flesh with sand. Together they decided they were satisfied with the results as the dog behaved as it usually had. That is when they turned their attention to Cirwea. We must end this for now, $name. We will both know more by the time we see each other again.");
            $client->Message(15, "You have received an invaluable piece of information!");
            if ($tak_wins >= 50) {
               $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
            }
         }
         elsif($tak_wins >= 50 && $qglobals{TAKtalk} == 24) {
            # 50 wins - TAKtalk 25, TAKpower 5
            quest::setglobal("TAKtalk",25,5,"F");
            quest::setglobal("TAKpower",5,5,"F");
            quest::say("This is a most unusual story, $name. I read that the day finally came for Cirwea and he was prepared for the test. He was rested on a bed of sand with his arms and legs were outstretched. The geomancers put him into a trance, gathered around him, and joined hands. Together they all crouched to the floor and buried their fingers in the sands. They began to chant and their arms glowed blue, yellow, and green with their summoning gifts. The sand underneath Cirwea shook and undulated in ripples around him. They were upon the moment of truth. With more time, I can continue. This is as far as I've gotten in the tale myself.");
            $client->Message(15, "You have received an invaluable piece of information!");
            $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
            if ($tak_wins >= 52) {
               $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
            }
         }
         elsif($tak_wins >= 52 && $qglobals{TAKtalk} == 25) {
            # 52 wins - TAKtalk 26
            quest::setglobal("TAKtalk",26,5,"F");
            quest::say("This journal about Takish-Hiz has me mesmerized! It says that as the geomancers stood around Cirwea, chanting, one of the geomancers leaned forward on her knees and began sculpting sand into the shape of an arm. She lifted the sculpture and it remained bound by the magic. She laid it on top of Cirwea's bruised and broken arm and pushed lightly downward. Sparks of blue magic danced around the sculpture of the arm as it worked its way into Cirwea's flesh and bone. In a moment, the magic dissipated. Cirwea blinked and opened his eyes. They all waited, barely breathing. With a smile, Cirwea turned his eyes to each one of the geomancers that stood above him. Then, he wiggled the fingers on the hand of his sandy arm. Fantastic, is it not? You must go now so I can read more!");
            $client->Message(15, "You have received an invaluable piece of information!");
            if ($tak_wins >= 54) {
               $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
            }
         }
         elsif($tak_wins >= 54 && $qglobals{TAKtalk} == 26) {
            # 54 wins - TAKtalk 27
            quest::setglobal("TAKtalk",27,5,"F");
            quest::say("How terrible it must have been in Takish-Hiz, hm? In my last reading, I learned that as food became extinct, the geomancers all began to replace their living bodies with sand. The one part of the body they did not dare replace was their brains. While the wolf they had transformed into a sand creature long ago still lived, it was not as rambunctious as it once was. It was a cause for concern, but all of the remaining elves knew they would have to abandon their natural biology or they would die. All of their efforts would be for naught if they were not able to survive with their skills and spirits in tact. They wouldn't be able to protect the city. I'm aching to read more, $name. When I see you again, we'll carry on.");
            $client->Message(15, "You have received an invaluable piece of information!");
            if ($tak_wins >= 56) {
               $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
            }
         }
         elsif($tak_wins >= 56 && $qglobals{TAKtalk} == 27) {
            # 56 wins - TAKtalk 28
            quest::setglobal("TAKtalk",28,5,"F");
            quest::say("The bravery of my ancestors really makes my heart proud. Again, Cirwea offered his head and mind for the first experiment the geomancers would perform. His bravery and faith in his fellow geomancers was unequaled. With his usual persuasiveness, Cirwea told his fellow fading elves that they had to try or none of them would survive. Once again, they prepared the summoning room. The tension in the air felt as heavy as the sand bearing down on them. I'm afraid that's all I know at this point. I plan to read more soon.");
            $client->Message(15, "You have received an invaluable piece of information!");
            if ($tak_wins >= 58) {
               $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
            }
         }
         elsif($tak_wins >= 58 && $qglobals{TAKtalk} == 28) {
            # 58 wins - TAKtalk 29
            quest::setglobal("TAKtalk",29,5,"F");
            quest::say("I was able to steal a few minutes with the journal left by some of the Takish-Hiz elves and read some eerie details around the grand experiment they conducted. The geomancers all gathered around Cirwea once more, but this time his eyes were lifeless. Ahead of time, the geomancers created a unique sculpture that was a totem. They were able to trap Cirwea's spirit within it. It was hoped that the spirit within the totem would be released within Cirwea's completely earthen form. Their eyes shone more keenly this day because they knew they faced the answer to the question they had all been asking themselves . . . would they be able to survive as sand creatures? And so, the summoning ceremony began. That's as far as I was able to read! I must get back to it!");
            $client->Message(15, "You have received an invaluable piece of information!");
            if ($tak_wins >= 60) {
               $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
            }
         }
         elsif($tak_wins >= 60 && $qglobals{TAKtalk} == 29) {
            # 60 wins - TAKtalk 30, TAKpower 6
            quest::setglobal("TAKtalk",30,5,"F");
            quest::setglobal("TAKpower",6,5,"F");
            quest::say("This journal is the most fascinating text I have ever read. To continue, dear $name, the summoning ceremony finished and once again Cirwea opened his eyes. The elves were all somewhat taken aback as his eyes did shine once again, but now his eyes were made of gems. Once more, he smiled. In a gravelly voice, he said 'My name is Cirwea and I am your first sand elf!' From that moment, the elves began their feverish transformation to becoming sand elves. But, they should have waited longer to see how this new form would affect them over time. I'm not sure why, because I haven't read that far. When I find spare time, I will read more, I promise!");
            $client->Message(15, "You have received an invaluable piece of information!");
            $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
            if ($tak_wins >= 62) {
               $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
            }
         }
         elsif($tak_wins >= 62 && $qglobals{TAKtalk} == 30) {
            # 62 wins - TAKtalk 31
            quest::setglobal("TAKtalk",31,5,"F");
            quest::say("Goodness! I have been anxious for you to return so I can tell you more! Cirwea, the first sand elf, was also the first to show an alarming change. He talked to his fellow geomancers less and less as the days passed. He was consumed with constantly repairing and rebuilding the city. While his fellow elves would take time to talk and share their lives, he would continue to manipulate the sands. Then, the other elves began talking less and less. I'm afraid there are some pages missing in the journal. I plan to return to Takish-Hiz to find them.");
            $client->Message(15, "You have received an invaluable piece of information!");
            if ($tak_wins >= 64) {
               $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
            }
         }
         elsif($tak_wins >= 64 && $qglobals{TAKtalk} == 31) {
            # 64 wins - TAKtalk 32
            quest::setglobal("TAKtalk",32,5,"F");
            quest::say("I found most of the missing pages! It seems that there was a desperate attempt by the youngest sand elves to restore all of the spirits of the sand elves into new totems so they would be protected. In the process, they lost several elves completely as their spirits were all but gone and could not be trapped into the totems. Some of the elves toyed with ending their lives, but hoped that someday that if they were rescued they could be restored to their formal physical beauty and intelligence. But it was not to be. I must read the final pages, dear $name. Come back soon and we'll end this tale together!");
            $client->Message(15, "You have received an invaluable piece of information!");
            if ($tak_wins >= 66) {
               $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
            }
         }
         elsif($tak_wins >= 66 && $qglobals{TAKtalk} == 32) {
            # 66 wins - TAKtalk 33
            quest::setglobal("TAKtalk",33,5,"F");
            quest::say("I should have been prepared for the sad ending of the elves, but I was not. My heart is troubled. The final pages of the journal ends as all of the elves succumbed to their sandy hosts and all lost their love for life. The journal became hazy because there were no elves to finish it. The sand elves you see now are just echoes of the elves they once were. They are not really the ancestors of the elves because they have become something else. They still see the continuing threat of the sands burying their city and continue to rebuild it with the sands. Now that we have discovered them, they fight even harder to protect all that they have sought to rebuild. That is all the information I have on Takish-Hiz right now, I'm afraid. You should go visit Ruanya Windleaf. I believe she may have more to tell you.");
            $client->Message(15, "You have received an invaluable piece of information!");
            if ($tak_wins >= 68) {
               $client->Message(13, "You have additional information to uncover! You must speak to Ruanya Windleaf to find out more.");
            }
         }
         elsif($tak_wins >= 68 && $qglobals{TAKtalk} == 33) {
            $client->Message(13, "You have additional information to uncover! You must speak to Ruanya Windleaf to find out more.");
         }
         elsif($qglobals{TAKtalk} == 39) {
            # theme complete
         }
         else {
            # adventure some more msg -- text made up
            $client->Message(9, "You need to adventure some more in Takish-Hiz.");
         }
      }
      elsif (plugin::check_hasitem($client, 40999)) {
         # 40999 - Wayfarers Brotherhhod Emblem
      }
   }
}

sub EVENT_ITEM {
   plugin::return_items(\%itemcount);
}

