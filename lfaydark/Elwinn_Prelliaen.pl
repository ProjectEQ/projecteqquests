# NPC: Elwinn Prelliaen (57084)
# Zone: lfaydark (Lesser Faydark)
# Quest:
#   Adventure in the Mistmoore Catacombs. (LDoN charm power up)

sub EVENT_SAY {
   if ($text=~/hail/i && defined($qglobals{MMCtalk}) && plugin::check_hasitem($client, 41000)) {
      my $mmc_wins = $client->GetLDoNWinsTheme(3);
      if($mmc_wins >= 52 && $qglobals{MMCtalk} == 25) {
         # 52 wins - MMCtalk 26
         quest::setglobal("MMCtalk",26,5,"F");
         quest::say("Shhh, keep it down. There are many who would strongly disapprove of my protection of one of the vampires from Mistmoore's Catacombs. I've been keeping him safely hidden, so do not expect or attempt to usurp my efforts to learn ways to protect ourselves from the evil that lurks in those caves. There is much to learn about the Progeny. We know very little about them, other than they are the elite vampires. Some of them are even considered Mayong Mistmoore's children.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mmc_wins >= 54) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($mmc_wins >= 54 && $qglobals{MMCtalk} == 26) {
         # 54 wins - MMCtalk 27
         quest::setglobal("MMCtalk",27,5,"F");
         quest::say("Ah yes. Have you encountered Mayong Mistmoore's children yet? They call themselves the Progeny. But, there is some dispute about which of them should be the ruler of the catacombs. As a result, Mistmoore's children have aligned themselves in two ways: the Trueborn and the Scions.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mmc_wins >= 56) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($mmc_wins >= 56 && $qglobals{MMCtalk} == 27) {
         # 56 wins - MMCtalk 28
         quest::setglobal("MMCtalk",28,5,"F");
         quest::say("You may have learned that the Trueborn claim to have Mayong Mistmoore's immortal blood running through their blackened veins. The Scions are the most recent additions to vampire nobility. Most still have memories of their mortal lives. Both resent each other; both want to be in Mayong's highest favor. There is much more to learn, but I can tell you no more right now.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mmc_wins >= 58) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($mmc_wins >= 58 && $qglobals{MMCtalk} == 28) {
         # 58 wins - MMCtalk 29
         quest::setglobal("MMCtalk",29,5,"F");
         quest::say("It's rather peculiar that both the Trueborn and the Scions war for Mayong's favor. do they not understand that Mayong cares nothing for them? All Mayong desires is his own perfection, whatever that means. His narcissism is so complete it leaves him no room for his children. There appears to be no way to convince those pathetic undead in the catacombs of Mayong's indifference.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($mmc_wins >= 60) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($mmc_wins >= 60 && $qglobals{MMCtalk} == 29) {
         # 60 wins - MMCtalk 30, MMCpower 6
         quest::setglobal("MMCtalk",30,5,"F");
         quest::setglobal("MMCpower",6,5,"F");
         quest::say("I'm afraid I can tell you no more. The source of my information has diappeared. I'm not sure if he was found, or if he left of his own accord. During all this time though, Vual Stoutest was able to create another Wayfarers Brotherhood party to get to the still heart of the catacombs. You should go talk to him. Be well traveler. The world is becoming stranger by the hour.");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($mmc_wins >= 62) {
            $client->Message(13, "You have additional information to uncover! You must speak to Vual Stoutest to find out more.");
         }
      }
      elsif($mmc_wins >= 62 && $qglobals{MMCtalk} == 30) {
         $client->Message(13, "You have additional information to uncover! You must speak to Vual Stoutest to find out more.");
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