# NPC: Henai Silentwalker (70033)
# Zone: cauldron (Dagnor's Cauldron)
# Quest:
#   Adventure in the Mistmoore Catacombs. (LDoN charm power up)

sub EVENT_SAY {
   if ($text=~/hail/i && defined($qglobals{MMCtalk}) && plugin::check_hasitem($client, 41000)) {
      my $mmc_wins = $client->GetLDoNWinsTheme(3);
      if($mmc_wins >= 24 && $qglobals{MMCtalk} == 11) {
         # 24 wins - MMCtalk 12
         quest::setglobal("MMCtalk",12,5,"F");
         quest::say("Ah, Vual has sent you to me. Well met! I've been sent here by the Wayfarers Brotherhood to walk with the creatures in Mistmoore's Catacombs. It's been a very interesting experience so far. I was able to figure out how some of the more powerful vampires behave, but it's been mighty tricky. The class known as the Sustainers certainly has some appalling dynamics friend! Come back soon. I will no doubt have more information for you after my next foray into the catacombs.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mmc_wins >= 26) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mmc_wins >= 26 && $qglobals{MMCtalk} == 12) {
         # 26 wins - MMCtalk 13
         quest::setglobal("MMCtalk",13,5,"F");
         quest::say("It's good to know I'm not the only one investigating Mistmoore's Catacombs. I am impressed! The numbers of foul beasts in there are somewhat unter control. I discovered that the Sustainers occupations are, in general, to keep the catacombs maintained and protected. For some reason, there are disputes among them even though they perform different functions. I've got to get back in there to find out more about it.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mmc_wins >= 28) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mmc_wins >= 28 && $qglobals{MMCtalk} == 13) {
         # 28 wins - MMCtalk 14
         quest::setglobal("MMCtalk",14,5,"F");
         quest::emote("wipes his fevered brow. 'Whew, I barely escaped my last trip to the catacombs. Have you noticed that there is a silent, well-mannered war between many of the vampires within the catacombs? The same hold true for the sects of the Sustainers. The ones that call themselves the Crimson Cabal are mostly magic users and those called the Harvesters are the undead that maintain the catacombs and keep it clean, so to speak. They have a strong dislike for each other, though they manage to be civil on the surfance. Odd that. That's about all I know right now, sorry to say.'");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mmc_wins >= 30) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mmc_wins >= 30 && $qglobals{MMCtalk} == 14) {
         # 30 wins - MMCtalk 15, MMCpower 3
         quest::setglobal("MMCtalk",15,5,"F");
         quest::setglobal("MMCpower",3,5,"F");
         quest::say("Ah, welcome back $name! I see you have done well to help my friends, the Wayfarers Brotherhhod. Remember the Crimson Cabal? I've heard that the Crimson Cabal continues the study of magic in the catacombs. They persist with their research and practicing of magic that will best serve and protect their masters and Mayong Mistmoore. The problem is that the Harvesters are forced to live in close quarters and sometimes feel the brunt of the Crimson Cabal's magic as they experiment and practice. That, in part, is why the Harvesters tend to strike back.");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($mmc_wins >= 32) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mmc_wins >= 32 && $qglobals{MMCtalk} == 15) {
         # 32 wins - MMCtalk 16
         quest::setglobal("MMCtalk",16,5,"F");
         quest::say("The Harvesters are certainly not the bright ones. I suppose as they are mostly unkempt dead, they wouldn't be too bright or organized. While that's true, I hear the Harvesters have been keeping a secret of their own. As they were pushed farther back into the catacombs by the painful magic of the Crimson Cabal, they found some rare and useful ore. While none of us know what its purpose is, I believe it's significant.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mmc_wins >= 34) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mmc_wins >= 34 && $qglobals{MMCtalk} == 16) {
         # 34 wins - MMCtalk 17
         quest::setglobal("MMCtalk",17,5,"F");
         quest::say("It seems that the strange ore found deep in Mistmoore's Catacombs is much like the other magical fragments we are finding deep under the crust of Norrath in the dungeons. It appears the material does indeed have a purpose. The Crimson Cabal and Harvesters will forever war with each other now that they believe the ore may improve their struggle to ascend from their lowly place in the catacombs. It is out job, though, to be certain that the power amongst the two sects remains balanced. With your help, I think we can do it.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mmc_wins >= 36) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mmc_wins >= 36 && $qglobals{MMCtalk} == 17) {
         # 36 wins - MMCtalk 18
         quest::setglobal("MMCtalk",18,5,"F");
         quest::say("Greetings $name. I hate to say it, but I fear I have become diseased. I have spent so much time in the catacombs that I've become infected. It will be some time before I will be well enough to return. I am expected to make a full recovery though! All the research and information we've been gathering has provided a cure for what ails me. Be careful you don't catch it! A new party was formed and is taking over for me. They have been reporting back to Vual. You may want to go back and talk to him.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mmc_wins >= 38) {
            $client->Message(13, "You have additional information to uncover! You must speak with Vual Stoutest to find out more.");
         }
      }
      elsif($mmc_wins >= 38 && $qglobals{MMCtalk} == 18) {
         $client->Message(13, "You have additional information to uncover! You must speak with Vual Stoutest to find out more.");
      }
      elsif($qglobals{MMCtalk} == 38) {
         # theme done
      }
      else {
         # text made up
         $client->Message(9, "You need to adventure some more in the Mistmoore Catacombs.");
      }
   }
}

sub EVENT_ITEM {
   plugin::return_items(\%itemcount);
}
