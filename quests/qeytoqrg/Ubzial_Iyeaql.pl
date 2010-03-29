# NPC: Ubzial Iyeaql (4071)
# Zone: qeytoqrg (Qeynos Hills)
# Quest:
#   Adventure in Miragul's Menagerie (LDoN charm power up)

sub EVENT_SAY {
   if($text=~/hail/i && defined($qglobals{MIRtalk}) && plugin::check_hasitem($client, 41000)) {
      # 41000 Adventurer's Stone
      my $mir_wins = $client->GetLDoNWinsTheme(2);
      
      if ($mir_wins < 2) {
      }
      elsif($mir_wins >= 16 && $qglobals{MIRtalk} == 7) {
         # 16 wins - MIRtalk 8
         quest::setglobal("MIRtalk",8,5,"F");
         quest::say("My word, I've been aching to tell the story that was passed along to me in my youth. My parents were so fascinated by Miragul and his deceit, treachery, and madness that I was forced to study and learn it all as a youth. I'm assuming Teria told you about Miragul's transformation into a lich? Well, it's just not that simple. His history is fraught with all kinds of interesting twists and turns, much like his menagerie. Now that we're acquainted, I will tell you more next time we meet.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 18) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 18 && $qglobals{MIRtalk} == 8) {
         # 18 wins - MIRtalk 9
         quest::setglobal("MIRtalk",9,5,"F");
         quest::say("It is good to see you return, $name. Many years ago, not long after men first started walking the lands of Norrath, Miragul was born in Erudin after Erud led some wise magic users to the continent of Odus. As Miragul grew to be a formidable master of the arcane arts, he became greatly dissatisfied with the edicts handed down by the Council of Erudin that tried to restrict his study. The suggestion that Miragul and all erudites should focus on one of three magic professions -- a mage, a wizard, or an enchanter -- was preposterous. The idea was very shortsighted and ridiculous in Miragul's mind. It wasn't long before he found others that thought like him and that's when the trouble started. That's all I will tell you for now. I need to do some research for the Wayfarers Brotherhood this day.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 20) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 20 && $qglobals{MIRtalk} == 9) {
         # 20 wins - MIRtalk 10, MIRpower 2
         quest::setglobal("MIRtalk",10,5,"F");
         quest::setglobal("MIRpower",2,5,"F");
         quest::say("Glad to see you are back for more $name. There were a growing number of outcasts in Erudin that studied forbidden tomes brought to the city by spies on Antonica. Miragul discovered the outcasts and learned they studied a fourth discipline of magic he knew nothing of . . . yes, the dark art of necromancy. Always driven by knowledge and learning, Miragul was infatuated by this new magic. However, it wouldn't be long before the interests of the outcasts were discovered by the Council of Erudin. I will tell you more about that later, $name. I have things to do here.");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($mir_wins >= 22) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 22 && $qglobals{MIRtalk} == 10) {
         # 22 wins - MIRtalk 11
         quest::setglobal("MIRtalk",11,5,"F");
         quest::say("You are faring well, I hope? Well, the Council of Erudin discovered that the erudite outcasts were practicing necromancy and branded them all heretics. A civil war broke out as a result. It was one of the most fearsome wars in the history of Norrath. There were no swords or armor, they used only magic. The destruction unleashed by the power of the magic changed the face of Odus. Erudites fell in massive numbers and much of the pristine architecture of Erudin was lost. After some time, the heretics discovered they did not have the numbers to sustain the battle and fled, hiding in the southern region of Odus. They made a new home for themselves, which I'll discuss more soon, friend.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 24) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 24 && $qglobals{MIRtalk} == 11) {
         # 24 wins - MIRtalk 12
         quest::setglobal("MIRtalk",12,5,"F");
         quest::say("On with the story then. The heretics found themselves a new home on Odus, but Miragul did not travel with them. Seeing the potential to lose access to the great libraries and wisdom of Erudin, Miragul abandoned the heretics and appeared to support the Council of Erudin. It's interesting how Miragul managed to deceive so many. I'll tell you that secret when we meet again. There were some items recovered from the menagerie that I must study.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 26) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 26 && $qglobals{MIRtalk} == 12) {
         # 26 wins - MIRtalk 13
         quest::setglobal("MIRtalk",13,5,"F");
         quest::say("Ah, yes. You want to know how Miragul managed to deceive the erudites and heretics. You see, having studied the art of enchantment as well as the other magic professions, Miragul was very adept at disguising his identity with powerful illusions. He created three distinct identities for himself that allowed him to study in all the schools of magic in Erudin. He also created a fourth identity that allowed him to study with the heretics. His identity as Miragul remained a close ally of the Council in Erudin. In doing this, he kept abreast of all the business and rumor within the city. He was also able to stay in Erudin without suspicion. You must understand that he still really was not an ally to the council. See me soon and I'll explain why, $name. I am quite busy with my studies these days. So much to learn!");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 28) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 28 && $qglobals{MIRtalk} == 13) {
         # 28 wins - MIRtalk 14
         quest::setglobal("MIRtalk",14,5,"F");
         quest::say("I've certainly had a lot of visitor's $name. I am happy to see a familiar face. As it turned out, Miragul remained disgusted by the Council of Erudin. He managed to absorb most of the knowledge that Erudin offered while he schemed. In a short time, Miragul managed to steal and stash away the most powerful tomes and artifacts in Erudin. His plan to take all the treasured tomes and artifacts from Erudin worked. He left Odus for Antonica on a boat with his cache of items of knowledge. There is still much to tell, $name, but it must wait. Yet again, I must do more research into these strange things we're finding in the menagerie.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 30) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 30 && $qglobals{MIRtalk} == 14) {
         # 30 wins - MIRtalk 15, MIRpower 3
         quest::setglobal("MIRtalk",15,5,"F");
         quest::setglobal("MIRpower",3,5,"F");
         quest::say("Let's do this quickly, shall we? When Miragul reached Qeynos in Antonica, it was very unpleasant for him. He was constantly dodging erudite spies, so he found it increasingly difficult to hide, so he left the city. He traveled for a very long time and finally reached a well-secluded area called Winter's Deep. He settled for some time there, pouring over all the items he had stolen from Erudin and various places in his travels. He improved his knowledge and skill with magic so much so that he became very powerful. It took very little time before Miragul neared the end of his stash of learning materials. He grew restless. Sorry to interrupt, but Kizpi Taelwx wants me to help him learn some of the world's languages. I will see you again to discuss more, will I not?");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($mir_wins >= 32) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 32 && $qglobals{MIRtalk} == 15) {
         # 32 wins - MIRtalk 16
         quest::setglobal("MIRtalk",16,5,"F");
         quest::say("Hail $name. I believe we ended with Miragul finishing his stay in Winter's Deep. From there Miragul traveled south to attain more knowledge of the arcane arts. It did not take him too long to run into Rivervale, the halfling city. The propensity of the halflings to sneak around and steal worried him, so Miragul moved on. Let's talk more about his travels at another time. I have to scribe a spell before I forget the incantation.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 34) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 34 && $qglobals{MIRtalk} == 16) {
         # 34 wins - MIRtalk 17
         quest::setglobal("MIRtalk",17,5,"F");
         quest::say("Mm-hm, more about Miragul's travels through the lands. After his experience with the halflings, Miragul chose to find lands that were devoid of almost all intelligent life and thieves. He made his way north and found himself in the Frigid Plains. I believe you know that already? This was the beginning of Miragul's isolation. I will have more for you when you return though, dear friend.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 36) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 36 && $qglobals{MIRtalk} == 17) {
         # 36 wins - MIRtalk 18
         quest::setglobal("MIRtalk",18,5,"F");
         quest::say("Hail, $name. Always good to see you. Well, when Miragul reached the Frigid Plains the construction of the menagerie began. In the solitary and cold environment, Miragul founded his own paradise. He used magic to move the ice and earth to create a vast number of tunnels, rooms, libraries, and laboratories that stretched out like tendrils under the frozen ground above. But he would always make time to study magic and familiarize himself with all the artifacts and books he'd stolen. And then he started losing his sanity, which we will delve into later. I'm much too tired to continue. I've done nothing but read for days!");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 38) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 38 && $qglobals{MIRtalk} == 18) {
         # 38 wins - MIRtalk 19
         quest::setglobal("MIRtalk",19,5,"F");
         quest::say("I have been so busy talking, $name, that I've had no time to do research! Seeing as how I'm partial to you, I will take the time to continue the story. Miragul built fantastic laboratories where he experimented with all the magic he learned. He also practiced on the living, particularly creatures found in the Frigid Planes. You sometimes will see the results within the menagerie now. But, that's getting a little ahead of our story. For many years, thousands in fact, Miragul continued increasing his knowledge and power until he realized that his body was finally failing. He was becoming very old. Let's wait to continue this, $name. I have to talk business with my friend Mannis McGuyett.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mir_wins >= 40) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mir_wins >= 40 && $qglobals{MIRtalk} == 19) {
         # 40 wins - MIRtalk 20, MIRpower 4
         quest::setglobal("MIRtalk",20,5,"F");
         quest::setglobal("MIRpower",4,5,"F");
         quest::say("Nice to see you, $name. I'm afraid that Morden Rasp, my leader, needs me to devote my attention to another task. It seems there is a strange ore about that we've never seen before coming from some of these lost dungeons we have discovered. I have sent word to Teria Grinntli in Everfrost. She is more than capable of taking the story from here, my friend. Take care of yourself, particularly when you enter the menagerie. Its wonders can quickly become terrors.");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($mir_wins >= 42) {
            $client->Message(13, "You have additional information to uncover! You must speak with Teria Grinntli to find out more.");
         }
      }
      elsif($mir_wins >= 42 && $qglobals{MIRtalk} == 20) {
         $client->Message(13, "You have additional information to uncover! You must speak with Teria Grinntli to find out more.");
      }
      elsif($qglobals{MIRtalk} == 34) {
         # theme done
      }
      else {
         # adventure more message - text made up
         $client->Message(9, "You need to adventure some more in Miragul's Menagerie.");
      }
   }
}

sub EVENT_ITEM {
   plugin::return_items(\%itemcount);
}