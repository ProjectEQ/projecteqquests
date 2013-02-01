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
      else {
        my $ruj_wins = $client->GetLDoNWinsTheme(4);
        if (!defined($qglobals{RUJtalk})) {
          quest::setglobal("RUJtalk",0,5,"F");
        }
        if ($ruj_wins < 2) {
          quest::say("Greetings, $name. I always have a story to tell, but I've been consumed with learning about the Rujarkian Hills. If you do enough work for us in those hills, I can share some of my knowledge with you!");
        }
        elsif ($ruj_wins >= 2 && $qglobals{RUJtalk} == 0) { #2 wins
          quest::setglobal("RUJtalk",1,5,"F");
          quest::say("Bah, you made me miss a note! No matter. I've been interrupted a lot lately with all the inquiries I get! I've been collecting stories and information from all over these days. I fancy myself a bit of a historian now when it comes to the goblins and orcs. It's important to understand the history of both of those creatures to understand what is happening in the Rujarkian Hills. That's my opinion, anyway. Those are no ordinary orcs in the hills. See me soon and I will have a tale or two for you.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 4) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 4 && $qglobals{RUJtalk} == 1) { #4 wins
          quest::setglobal("RUJtalk",2,5,"F");
          quest::say("Wonderful to see you, $name! I always enjoy telling a story to a fellow explorer. Let's start with the goblins and the orcs and where they came from, shall we? To start with, you should know that the hero that was considered the mother of all of the goblins was named Rujark. Her name is about the only thing the goblins of Norrath can agree upon. Obviously, the hills over yonder once belonged to Rujark's goblins, but they do not anymore. That's all I will divulge for now!");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 6) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 6 && $qglobals{RUJtalk} == 2) { #6 wins
          quest::setglobal("RUJtalk",3,5,"F");
          quest::say("Perfect timing. I just put down my lute. Did you know the orcs were created by Rallos-Zek? Oh yes! They were bred for battle. Mighty creatures indeed and very determined. They rely on slaves, whether they be orcs or other creatures. Each orc seemingly belongs to another! Return soon for more $name. I'm sure we will spend a lot of time together!");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 8) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 8 && $qglobals{RUJtalk} == 3) { #8 wins
          quest::setglobal("RUJtalk",4,5,"F");
          quest::say("Just finishing up some bread. Let's make this quick. As I said before, each orc belongs to another. We know it's true. This makes the social order of the orcs very simple to follow. Each orc is property, all the way to the highest ranks. The highest ranks relate to one another a bit differently though. Unfortunately, I don't have much more detail that that! I wonder if this will help you defeat them? I don't know that, but I do think knowledge can be a weapon.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 10) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 10 && $qglobals{RUJtalk} == 4) { #10 wins - Power Up
          quest::setglobal("RUJtalk",5,5,"F");
          quest::setglobal("RUJpower",1,5,"F");
          quest::say("Welcome once again $name. As I said, while orcs are almost always the property of another, it's someone different at the top ranks. The highest levels of the orcs maintain their positions through trading and sharing property, and fighting to prove their supremacy. It's a complicated system that is constantly in motion. In order to keep their positions, the top ranks constantly build their stable of slaves and defend against those yearning for power. Can you imagine that life? How depressing! They must forever be on their guard. To be owned would be a foul fate!");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($ruj_wins >= 12) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 12 && $qglobals{RUJtalk} == 5) { #12 wins
          quest::setglobal("RUJtalk",6,5,"F");
          quest::emote("hums a mesmerizing melody and then stops. 'Ah, yes, $name. Hello. I am sure you have seen the vast number of goblins being used as slaves in the Rujarkian Hills, have you not? Well, I have a friend that can tell you more about their origins. Various clans and species of goblins are indeed spread across Norrath, but the Rujarkian goblins are different. You'll find Ginehl Wiquar in the sewers of Freeport. She's been gathering information from all sorts of messengers around the world about the Rujarkian goblins and orcs.'");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 14) {
            $client->Message(13, "You have additional information to uncover! You must speak to Ginehl Wiquar to find out more.");
          }
        }
        elsif ($ruj_wins >= 14 && $qglobals{RUJtalk} == 6) { #Send to other NPC
          $client->Message(13, "You have additional information to uncover! You must speak to Ginehl Wiquar to find out more.");
        }
        elsif ($ruj_wins >= 22 && $qglobals{RUJtalk} == 10) { #22 wins
          quest::setglobal("RUJtalk",11,5,"F");
          quest::say("Ah, Ginehl has sent you back to me! Good timing too. I've been piecing together information from journals and folklore about the goblins and orcs. The story behind how the Rujarkian Hills got their name is an interesting one indeed! I believe I already mentioned Rujark, the mother of the goblins. There is an interesting tale behind how she became the heroine that all goblins admire. She's also about the only thing the goblins will agree on. There is no time to get into this now, but we will find time to discuss this soon, I am sure.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 24) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 24 && $qglobals{RUJtalk} == 11) { #24 wins
          quest::setglobal("RUJtalk",12,5,"F");
          quest::say("Finally $name, we have time to talk. Well, Rujark had a vicious heart as a young goblin. While her brothers and sisters would spend time in the mines, she would often sneak off and learn the ways of battle. Female goblins were not considered warriors in those days at all. She was supposed to answer to the whims of all the males that had duties for her. Her desire to see battle was fierce, though, and she resisted her station. After performing her daily duties, she would disappear into the dark caves and teach herself how to use the weapons she would find discarded. There is so much more to tell, but I have no time now! I'm starting to compose a song about the history of the Rujarkian Hills.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 26) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 26 && $qglobals{RUJtalk} == 12) { #26 wins
          quest::setglobal("RUJtalk",13,5,"F");
          quest::say("Rujark, yes. You are in luck. Because I'm writing a song about the Rujarkian Hills, I have been traveling and looking for more particulars and I always get told more of the tales. So, I can tell you now that after years of practice, Rujark became a master of all the weapons she had found. She had extraordinary agility and dexterity. After some time, she chose to take her skills to the surface of Norrath to test herself. She was anxious as she waited for the right moment. Getting caught would mean the end of her! She was not afraid of death either. She had seen plenty of that as the goblins fought the orcs over the years. That's almost all of what I know. I need to gather more of the story for my song, so I will probably have more information for you soon.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 28) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 28 && $qglobals{RUJtalk} == 13) { #28 wins
          quest::setglobal("RUJtalk",14,5,"F");
          quest::say("I found great subject matter for the chorus of my song! It goes something like this . . . 'Rujark, oh mighty Rujark of the hills -- there were none that could match her skills. With great might and ferocious heart she would tear all of her foes apart!' Good, yes? Well, I discovered that Rujark finally made it to the surface of Norrath and as luck would have it, she spotted a camp of orcs, Crushbone orcs to be exact. They were shorter and appeared weaker than the orcs she lived with all her life so she was somewhat disappointed. However, they proved to be worthy test subjects for her fighting skills. She snuck up to them and before they could take their next breaths, they were slain. Or so the story goes . . . I must continue writing the lyrics to my song, $name. Come back soon though. I hope to have more.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 30) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 30 && $qglobals{RUJtalk} == 14) { #30 wins - Power Up
          quest::setglobal("RUJtalk",15,5,"F");
          quest::setglobal("RUJpower",3,5,"F");
          quest::say("Hey-ho $name! I had to rewrite some of the notes of my song. It's quite complicated making a musical masterpiece! So, from where we left off, the story goes that Rujark didn't know that her brother, Givlikk, was wise to her habits over the years and had followed her out of the caverns to the surface. He saw Rujark's skill and grace with her two short blades. He was impressed and envious at the same time. He ran home ahead of her and waited in silence for her return. I have a friend in the Karanas I must speak with. I heard he has more information I can use to tell you and put in my new song.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($ruj_wins >= 32) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 32 && $qglobals{RUJtalk} == 15) { #32 wins
          quest::setglobal("RUJtalk",16,5,"F");
          quest::say("Where were we again, $name? Hm . . . ah yes. Rujark returned to her hovel in the caves and her brother Givlikk stopped her as she attempted to pass through the door. He asked her about the blood on the rags she wore. She was unsure of her brother's intentions and said nothing. He told her he had seen her fight the orcs. He quietly resented his sister's skills, but could not ignore their magnitude. Together, they would come up with a plan that would suit them both. I think I made the verse about this a little faster paced than the others so I can build some suspense!");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 34) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 34 && $qglobals{RUJtalk} == 16) { #34 wins
          quest::setglobal("RUJtalk",17,5,"F");
          quest::say("Each day, I get closer to completing my song. The notes blend so well now and the lyrics are moving along! I had to pay for some information, but it was useful. As you know, goblins are not known for their empathy. Therefore, while Givlikk and Rujark discussed how to proceed with her skills and secrets, he had his own agenda. Givlikk entertained thoughts of trading Rujark as a guard to slave owners in order to make a great deal of money. The only problem was she was female. No one would buy a female warrior. And that is when they hatched their plan. I must stop here for now. I just thought of a great lyric for part of my song!");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 36) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 36 && $qglobals{RUJtalk} == 17) { #36 wins
          quest::setglobal("RUJtalk",18,5,"F");
          quest::say("My friend, $name, it is so good to see you! I keep working on this song of mine. It continues to grow the more I learn about the Rujarkian Hills. As you may have guessed, Givlikk and Rujark both decided that if Rujark was presented as a male, she could live as she had always dreamed and would be of great use to the goblins overall. They changed her clothing. In order to disguise her female features and her former identity, Rujark willingly let her brother Givlikk scar her face with a burning dagger. Of course, it was a task he enjoyed greatly. His envy of his sister grew every hour, every day. That is all I have uncovered for now, friend. Return soon and if my song is done, I will play it for you!");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 38) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 38 && $qglobals{RUJtalk} == 18) { #38 wins
          quest::setglobal("RUJtalk",19,5,"F");
          quest::say("I've come to a part in my song that will have to move the audience to great anticipation! I think I shall use minor chords for that part, hm. So, yes $name, as Rujark face was bandaged until her scars healed, she easily fit among the male goblins. She refrained from speaking and loyally took orders from her battle master. They would often raid the orcs. In every fight, Rujark killed twice as many orcs as the rest. Rumors and fanciful stories began to get passed around the caves under the spine of the world. Must go, $name. I really want to finish this portion of my song.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 40) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 40 && $qglobals{RUJtalk} == 19) { #40 wins - Power Up
          quest::setglobal("RUJtalk",20,5,"F");
          quest::setglobal("RUJpower",4,5,"F");
          quest::emote("stops tuning his lute. 'Nearly there $name! I will be ready to sing the song soon. I have more to add about Rujark, though. If you recall, the goblins began to tell heroic stories about Rujark. She was lauded as the most fierce and impressive goblin of all. Even the nobles became nervous about the greatness of this one vicious goblin. Rujark became tense too. The attention paid to her was not welcome. If her secret was discovered, she was certain to be killed. And while Rujark continued with her life and war, her brother Givlikk worked an evil plan. I'll tell you what that plan was next time, $name. I want to put it into verse first!'");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($ruj_wins >= 42) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 42 && $qglobals{RUJtalk} == 20) { #42 wins
          quest::setglobal("RUJtalk",21,5,"F");
          quest::say("I created a nice bridge in the song that should make my audience shiver with intrigue! The portion I added to my song was about an evil plan. Givlikk had been negotiating with the goblin nobles about the ownership of Rujark. Each of them wanted the powerful warrior by their side and each believed that if they owned Rujark they would keep their seat of power, and, maybe, ascend to king. It wasn't difficult for Givlikk to secure a high price as all the nobles vied to own Rujark. Givlikk pitted the nobles against each other until the price was so high that Givlikk could have probably bought the throne itself! I have a meeting with Biski Teezlen. He said he had new information for me! Hopefully it is worthy of being included in my great composition.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 44) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 44 && $qglobals{RUJtalk} == 21) { #44 wins
          quest::setglobal("RUJtalk",22,5,"F");
          quest::say("Hello again $name! Biski Teezlen did have a wonderful story for me. He said that as Givlikk schemed, Rujark continued to master the arts of war. Her tactics were renowned and she was given her own army after a time. Under her leadership, Rujark's crew of fighters was devastating to the orcs. It was Rujark and she alone who brought hope that the goblins may finally keep the orcs at bay and claim the caverns under the spine of the world. And, no, we're not done yet, but I need to write a new song for a lovely young lass I have met. Much like you, she came to listen to my stories about the Rujarkian Hills. She is of such great beauty and kindness that she inspired me to write a song about her. I hope you understand, fair $name.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 46) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 46 && $qglobals{RUJtalk} == 22) { #46 wins
          quest::setglobal("RUJtalk",23,5,"F");
          quest::say("We must continue our story! I was talking with Biski Teezlen more and he told me that Givlikk was attempting to sell his sister to the highest bidding noble. As it happened, the nobles bettered him. As Rujark was a male in their eyes, the nobles believed that Rujark was not Givlikk's to sell. In a panic, Givlikk called a meeting of all the nobles, telling them he had a most interesting secret for them to consider. When all were gathered, Givlikk made a last attempt to ensure he would collect money for the trade of his sister. I bet you can guess what happened, hm? Well, you must wait. I must make this part of my song before I forget it all.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 48) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 48 && $qglobals{RUJtalk} == 23) { #48 wins
          quest::setglobal("RUJtalk",24,5,"F");
          quest::say("Sorry to have ended so abruptly last time, my friend, but my song is better for it! As you most likely surmised, during the meeting of the nobles, Givlikk blurted out that Rujark was female. At first they didn't know what to make of the news. They were not certain Givlikk told the truth. Seeing the true motivations and greed of Rujark's brother, they began to believe him. They did accept that Rujark belonged on the battlefield, but they could not condone a female leading an army to war against the orcs. So, they sent a messenger to tell Rujark the nobles requested her presence. I fear I may need to write two songs to tell this story, my friend.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 50) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 50 && $qglobals{RUJtalk} == 24) { #50 wins - Power Up
          quest::setglobal("RUJtalk",25,5,"F");
          quest::setglobal("RUJpower",5,5,"F");
          quest::say("My song gets longer and longer the more I talk to my friends in the Wayfarers Brotherhood. I told you that the nobles sent for Rujark after they learned she was female. Well, she appeared before them, in all of her magnificent shining steel armor. The scars of her face left her disfigured enough that no one could really tell her gender. The nobles eyed her carefully and walked around her. With the battles she'd had since the day that Givlikk marked her face, she had suffered more scars in battle, making her gender harder to detect. Then, the nobles confronted her and exposed her lie. They sentenced her to slavery and asked her to relinquish all of her armor, weapons, and told her that her title as a battle master was revoked. Naturally, she resisted. That reminds me, I have to go through my song pages to change some of the rhyme. I will talk to you later though!");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($ruj_wins >= 52) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 52 && $qglobals{RUJtalk} == 25) { #52 wins
          quest::setglobal("RUJtalk",26,5,"F");
          quest::emote("strums his lute and stops to write some words down on a sheet filled with musical notes and lyrics. 'Wonderful to see you back, $name! You must hear this! When Rujark was told she would have to go back to the bottom of the ranks and take orders from males, her response was deadly. She raised her short swords and made quick work of the nobles who died with stunned expressions. They did not have a hope against her skills. The news of her triumph over the nobles spread fast and so did word that she was a female. Speaking of spreading news, it's time for me to start practicing this song and committing it to my memory. I have a few things to add still, however.'");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 54) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 54 && $qglobals{RUJtalk} == 26) { #54 wins
          quest::setglobal("RUJtalk",27,5,"F");
          quest::say("Ah, we have come to the big finale of our story! Over all the years Rujark warred against the orcs, she gained a faithful following. It turned out that her prowess in battle far exceeded the perception of her gender. The goblins then began to set rumors on the breeze that Rujark was blessed by both Brell Serilis, the Duke of Below, and Rallos Zek, the god of War. The rumors took hold and she became the leader of the goblins, who referred to her, then and now, as their mother. They believe she brought the goblins to a better place and her knowledge and skill kept the goblins from falling to the orcs for many years. And so, the region where Rujark and the gnomes lived came to be referred to as the Rujarkian Hills. I was going to end my song there, but yet again, someone told me more about Rujark and her fate. Soon, you will hear about that.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 56) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 56 && $qglobals{RUJtalk} == 27) { #56 wins
          quest::setglobal("RUJtalk",28,5,"F");
          quest::say("Hail $name. Well, the story about Rujark has a bit of a bitter ending which makes it perfect for my song. Over the years that Rujark trained and improved the goblins as the leader in the Rujarkian Hills, her brother Givlikk grew so envious that he became obsessed with ending his sister's life. Givlikk was shamed and punished for trying to sell his sister too. After all, to the goblins, Rujark was very much their divine mother that had been touched by the gods. Rujark kept her brother near to her because she trusted him. Hm, I need to add more notes to this part of the song.");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 58) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 58 && $qglobals{RUJtalk} == 28) { #58 wins
          quest::setglobal("RUJtalk",29,5,"F");
          quest::emote("plays a sad melody on his flute. 'Where was I, $name? Ah yes. Well, one night Givlikk completely lost all of his bonds with reason. As he often did, Givlikk brought Rujark a stein of frothy ale as they ate an evening meal. He had set up the routine some time before, when he started having great fantasies about killing his sister. He watched eagerly as Rujark lifted the stein to her lips and drank. He cackled as she swallowed the poisonous ale he had made. Now, this is where the tale gets a little strange . . . and as sad as it is, this kind of drama makes for a wonderful song.'");
          $client->Message(15, "You have received an invaluable piece of information!");
          if ($ruj_wins >= 60) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
          }
        }
        elsif ($ruj_wins >= 60 && $qglobals{RUJtalk} == 29) { #60 wins - Power Up
          quest::setglobal("RUJtalk",30,5,"F");
          quest::setglobal("RUJpower",6,5,"F");
          quest::say("Songs that end in powerful tragedy are often remembered, $name. The story of Rujark certainly includes that. Right, the poison. When Rujark swallowed the poison, she was not affected as she should have been. There were no violent spasms. She did not bleed from her eyes, ears, or mouth. She just plainly went to sleep. There was one journal that I read that described Rujark's spirit lifting from her body and soaring to another existence. Of course, we can't confirm this, but it sounds wonderful for a song! Anyway, that is how the area got its name, from the mighty Rujark. You'd be best off going to Shumpi Wimahnn. He is a sprightly halfling but he knows a lot about orcs! He's been doing orcish research in Highpass Hold.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($ruj_wins >= 64) {
            $client->Message(13, "You have additional information to uncover! You must speak to Shumpi Wimahnn to find out more..");
          }
        }
        elsif ($ruj_wins >= 64 && $qglobals{RUJtalk} == 30) { #Send to other NPC
          $client->Message(13, "You have additional information to uncover! You must speak to Shumpi Wimahnn to find out more.");
        }
        elsif ($ruj_wins >= 74 && $qglobals{RUJtalk} == 36) { #74 wins - Power Up
          quest::setglobal("RUJtalk",37,5,"F");
          quest::setglobal("RUJpower",8,5,"F");
          quest::say("Have you had your fill of story yet $name? You have spent a lot of time learning about the Rujarkian Hills. And, I can tell by the look in your eye that you know just as much as anyone about the orcs and goblins in those hills. I consider you a master of the story here as much as anyone. I have nothing to tell you, but you can stand by as I sing if you like. Be well, $name. I consider you a great adventurer and good friend. I'd fight with you by my side any day.");
          $client->Message(15, "You have received an invaluable piece of information!");
          $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
          if ($qglobals{MMCtalk} == 38 && $qglobals{MIRtalk} == 34 && $qglobals{TAKtalk} == 39 && $qglobals{GUKtalk} == 35) { #player has just maxed their stone
            $client->Message(13, "It's time to acknowledge you as a Wayfarer. Give Chaenz Abella in East Commonlands your Adventurer Stone and he'll replace it with your very own Wayfarers Emblem. Or, if it's being used in a charm, you must remove it to get your new one. And, if you simply destroy the stone, he will replace it with your much-deserved emblem. Just tell him you want your [emblem].");
            quest::setglobal("Wayfarer",3,5,"F");
          }
        }
        elsif ($qglobals{RUJtalk} == 37) { #Theme done
          quest::say("Have you had your fill of story yet $name? You have spent a lot of time learning about the Rujarkian Hills. And, I can tell by the look in your eye that you know just as much as anyone about the orcs and goblins in those hills. I consider you a master of the story here as much as anyone. I have nothing to tell you, but you can stand by as I sing if you like. Be well, $name. I consider you a great adventurer and good friend. I'd fight with you by my side any day.");
        }
        else {
          $client->Message(9, "You need to adventure some more in the Rujarkian Hills."); #Text made up
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