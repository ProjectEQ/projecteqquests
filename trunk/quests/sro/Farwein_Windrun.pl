# NPC: Farwein Windrun (35067)
# Zone: sro (Southern Desert of Ro)
# Quest:
#   Adventure in Takish-Hiz (LDoN charm power up)

sub EVENT_SAY {
   if ($text=~/hail/i && defined($qglobals{TAKtalk}) && plugin::check_hasitem($client, 41000)) {
      my $tak_wins = $client->GetLDoNWinsTheme(5);
      if ($tak_wins >= 14 && $qglobals{TAKtalk} == 6) {
         # 14 wins - TAKtalk 7
         quest::setglobal("TAKtalk",7,5,"F");
         quest::say("Hail $name. I'm certain that Ruanya sent you to me. That must mean you want to learn more about Takish-Hiz and the elves. I do have an interesting tale about that. Some call it folklore, but I say it is true. The story was passed amongst the wood elves for centuries. Give me some time to organize and we will talk, friend.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($tak_wins >= 16) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($tak_wins >= 16 && $qglobals{TAKtalk} == 7) {
         # 16 wins - TAKtalk 8
         quest::setglobal("TAKtalk",8,5,"F");
         quest::say("So glad you're here. I've been aching to tell my story. Soon after Takish-Hiz was built, not only did Solusek Ro become angry, Innoruuk did as well. He abhorred the sickly sweet and lovely elves and wanted to disrupt the peaceful city and cut into Tunare's heart. Sorry to stop here $name, but I must practice. Don't tell anyone, but I've been learning the geomantic arts!");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($tak_wins >= 18) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($tak_wins >= 18 && $qglobals{TAKtalk} == 8) {
         # 18 wins - TAKtalk 9
         quest::setglobal("TAKtalk",9,5,"F");
         quest::say("So good to receive you again, $name. We can continue without interruption for a short time. When the Prince of Hate, Innoruuk, saw how happily and peacefully the elves lived, his ire burned like an inferno. He stole the king and queen right from their thrones in Takish-Hiz without any warning and imprisoned them in the Plane of Hate, his terrible home. Oh, I am afraid I must now return to the Faydarks for a short spell and visit my family. I have just remembered they talked about an artifact of the old elves they keep hidden. I am yearning to see it!");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($tak_wins >= 20) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($tak_wins >= 20 && $qglobals{TAKtalk} == 9) {
         # 20 wins - TAKtalk 10, TAKpower 2
         quest::setglobal("TAKtalk",10,5,"F");
         quest::setglobal("TAKpower",2,5,"F");
         quest::say("I had a wonderful visit with my family, $name. Where were we? Hm. Ah, yes. Innoruuk tortured the elven king and queen of Takish-Hiz for 300 years. He twisted their minds and tortured their bodies until they were no longer beautiful and bright. He rebuilt them as he saw fit until they became the first of Innoruuk's intelligent abominations on Norrath. They became known as the dark elves, or Teir'Dal. Speaking of frightful, I must return to Takish-Hiz. My friends are signaling me to hurry our discussion. I'll see you soon.");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($tak_wins >= 22) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($tak_wins >= 22 && $qglobals{TAKtalk} == 10) {
         # 22 wins - TAKtalk 11
         quest::setglobal("TAKtalk",11,5,"F");
         quest::say("The story of the elves and Takish-Hiz is becoming more familiar to me the more I tell it. I must say though, it is heartbreaking to learn that the Elddar Forest used to stretch across the entire southeastern quarter of Antonica. I am sure we would have found it magnificent! It is even sadder that some of the gods had such a hatred of the elves. Anyway, I must go cook my friends a meal. I would suggest that you return to Ruanya Windleaf to discuss more about the fate of Takish-Hiz and the elves.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($tak_wins >= 24) {
            $client->Message(13, "You have additional information to uncover! You must speak to Ruanya Windleaf to find out more.");
         }
      }
      elsif($tak_wins >= 24 && $qglobals{TAKtalk} == 11) {
         $client->Message(13, "You have additional information to uncover! You must speak to Ruanya Windleaf to find out more.");
      }
      elsif($qglobals{TAKtalk} == 39) {
         # theme done
      }
      else {
         # adventure some more msg -- text made up
         $client->Message(9, "You need to adventure some more in Takish-Hiz.");
      }
   }
}

sub EVENT_ITEM {
   plugin::return_items(\%itemcount);
}