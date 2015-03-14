# NPC: Bealya Tanilsuia (21070)
# Zone: commons (West Commonlands)
# Quest:
#   Adventure in Deepest Guk (LDoN charm power up)

sub EVENT_SAY {
   if ($text=~/hail/i && defined($qglobals{GUKtalk}) && plugin::check_hasitem($client, 41000)) {
      my $guk_wins = $client->GetLDoNWinsTheme(1);
      if ($guk_wins == 0) {
      }
      elsif($guk_wins >= 12 && $qglobals{GUKtalk} == 5) {
         # 12 wins - GUKtalk 6
         quest::setglobal("GUKtalk",6,5,"F");
         quest::say("Yes, I know. No one expects a dwarf to know anything! I can see that in your eyes. I've taken an interest in the frogloks though. I've been around Norrath for some time and, much like you, often heard rumors. I wanted to find out for myself if the rumors were true. As a result, I became a bit of an expert. Well, enough about me. A long time ago troll shamans predicted the rise of a particular troll called ''The Grozmok.'' This legendary troll would possess great might and hold powerful secrets. All of the trolls were to be united under one rule, but as we know, this didn't happen . . . Oh my, look at the time! I must get back to my studies. If you'd like to continue our talk, you're going to have to come back later.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 14) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 14 && $qglobals{GUKtalk} == 6) {
         # 14 wins - GUKtalk 7
         quest::setglobal("GUKtalk",7,5,"F");
         quest::say("Right, where was I. Ah yes. Well, as I said, the trolls were meant to be united under the powerful troll they referred to as The Grozmok. The troll shamans believed in the prophecy so completely that they wrote it in blood on a strong stone tablet, which was supposedly blessed by both Innoruuk, the prince of Hate, and Cazic-Thule, the god of Fear. They called this artifact the Grozmok Stone. I understand that it will take a while to absorb all of this information. I'll just leave you to mull over that for now.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 16) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 16 && $qglobals{GUKtalk} == 7) {
         # 16 wins - GUKtalk 8
         quest::setglobal("GUKtalk",8,5,"F");
         quest::say("So, yes, back to the Grozmok Stone. Well, the trolls guarded that stone with all the might they possessed. Then, the ogre minions of Rallos Zek, the god of War, turned their eyes to Innothule Swamp and slaughtered and enslaved all of those that crossed their path. Not only did the trolls fall, but the Grozmok Stone was lost to the ogres in the Rallosian Empire. Over time the ogres lost their favor with the gods and were cursed to become ignorant and slovenly. At this time, the trolls began to rise again as their numbers were able to increase without the interference of the wrath of the ogres. Well, $name, I think that's enough for now.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 18) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 18 && $qglobals{GUKtalk} == 8) {
         # 18 wins - GUKtalk 9
         quest::setglobal("GUKtalk",9,5,"F");
         quest::say("Right, back to the trolls. So, the trolls began to rebuild over time and split into tribes. Two tribes were of note: the Broken Skull Clan that lived on an island in the Gulf of Gunthak, and the Ykesha Clan that established themselves in the Innothule Swamps. For many years, the two clans warred for dominance, raiding each other's territories and the mountainous lands of the ogres that had survived the destruction of their empire. It was in these mountainous lands that the Grozmok Stone once again came into possession of the troll clans. And, I tell you, the story just gets more interesting from here, but it will have to wait.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 20) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 20 && $qglobals{GUKtalk} == 9) {
         # 20 wins - GUKtalk 10, GUKpower 2
         quest::setglobal("GUKtalk",10,5,"F");
         quest::setglobal("GUKpower",2,5,"F");
         quest::say("Hello again, $name. So, a war horde from the Ykesha Clan recovered the Grozmok Stone and presented it to their leader, Warlord Ykesha. Ykesha's shamans recognized the blessings of the gods of Fear and Hate upon the hieroglyphs on the stone. At the time, Ykesha believed he was going to become The Grozmok. That's it for now, my friend. I have work to do.");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($guk_wins >= 22) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 22 && $qglobals{GUKtalk} == 10) {
         # 22 wins - GUKtalk 11
         quest::setglobal("GUKtalk",11,5,"F");
         quest::say("Greetings once more, $name. Right, more of the story. As you know, when individuals gain celebrity some strange things can happen. As I was saying before, Ykesha came to believe he was The Grozmok. He became insanely paranoid and holed himself up deep within his fortress in the Innothule Swamp, which is now Guk. Seeing the weakness in the Ykesha clan's leadership, the forces of the rival clans moved in to take the Grozmok Stone. The Broken Skull clan won possession of the stone and the Ykesha clan was destroyed.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 24) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 24 && $qglobals{GUKtalk} == 11) {
         # 24 wins - GUKtalk 12
         quest::setglobal("GUKtalk",12,5,"F");
         quest::say("The few survivors of the Ykesha clan endured as scavengers in the Innothule Swamp for some time, until a new warlord emerged by the name of Jurglash, founder of the Grobb clan. The might of the clan grew quickly to become the prominent troll clan on the Antonican mainland. What? Yes, I know. I'm getting to the frogloks of Gukta. Patience!");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 26) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 26 && $qglobals{GUKtalk} == 12) {
         # 26 wins - GUKtalk 13
         quest::setglobal("GUKtalk",13,5,"F");
         quest::say("More about the trolls and emergence of the frogloks, yes. Well, you see, the Grozmok Stone remained in the possession of the Broken Skull clan, hidden and guarded in the tomb of a legendary Broken Skull shaman named Nadox. The shamans in Grobb learned the whereabouts of the Grozmok Stone and a raid was sent to recover it from the rival clan, which it did. The stone was taken to Grobb where it remained for some time, awaiting the arrival of The Grozmok.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 28) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 28 && $qglobals{GUKtalk} == 13) {
         # 28 wins - GUKtalk 14
         quest::setglobal("GUKtalk",14,5,"F");
         quest::say("Still want to learn more, $name? Excellent! Okay, so, the Broken Skull clan believed that The Grozmok would rise from its trolls, as they felt they were chosen by Innoruuk. Then, without warning, the Broken Skull clan attacked Grobb. With the aid of the Luggalds granted them by Innoruuk, they managed to invade the city with few losses and bring the Grozmok Stone to Broken Skull Rock.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 30) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 30 && $qglobals{GUKtalk} == 14) {
         # 30 wins - GUKtalk 15, GUKpower 3
         quest::setglobal("GUKtalk",15,5,"F");
         quest::setglobal("GUKpower",3,5,"F");
         quest::say("Back to where we were then, eh $name? The loss of the Grozmok Stone left much disarray in Grobb. A rather shoddy force of trolls departed Grobb to try to take back the Grozmok Stone from the Broken Skull clan. The frogloks witnessed the peril that Grobb had fallen into and took advantage of the opportunity to recover their dignity and their lands. They prayed to Mithaniel Marr, their creator, and asked for his blessing, which they received. Hm, I think you should get some background on that from my good friend Selephra Giztral. Good day and good luck!");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($guk_wins >= 32) {
            $client->Message(13, "You have additional information to uncover! You must speak to Selephra Giztral to find out more."); # red message
         }
      }
      elsif($guk_wins >= 32 && $qglobals{GUKtalk} == 15) {
         $client->Message(13, "You have additional information to uncover! You must speak to Selephra Giztral to find out more."); # red message
      }
      elsif($qglobals{GUKtalk} == 35) {
         # theme maxed
      }
      else {
         $client->Message(9, "You need to adventure some more in Deepest Guk.");
      }
   }
}

sub EVENT_ITEM {
   plugin::return_items(\%itemcount);
}