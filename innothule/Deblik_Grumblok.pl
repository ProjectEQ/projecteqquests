# NPC: Deblik Grumblok (46097)
# ZONE: Innothule Swamp
# Quest:
#   Adventure in Deepest Guk (LDoN charm power up)

sub EVENT_SAY {
   if ($text=~/hail/i && defined($qglobals{GUKtalk}) && plugin::check_hasitem($client, 41000)) {
      my $guk_wins = $client->GetLDoNWinsTheme(1);
      if($guk_wins >= 52 && $qglobals{GUKtalk} == 25) {
         # 52 wins - GUKtalk 26
         quest::setglobal("GUKtalk",26,5,"F");
         quest::say("Greetin's dere $name. Me guess dat you want to hear more about de curse dat is making a mess down dere in Deepest Guk? Mm-hmm. First, you may wonder why me helping de Wayfarers Brotherhood? Me was sent away from my home and betrayed by my own chum in Neriak. Somehow me don't have de fear and hate my troll brudders and sisters do. Anyway, Morden Rasp took me in and me made friends. Me supposed to hate de froggies, but me don'ts. Anyway, where was I? Me forgot. You go away and come back someday soon and me will remember de stuff.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 54) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 54 && $qglobals{GUKtalk} == 26) {
         # 54 wins - GUKtalk 27
         quest::setglobal("GUKtalk",27,5,"F");
         quest::say("Okay, so when Warlord Ykesha ruled in de swamps, we built a fortress dat became a troll city. My ancestors made de poor froggies slaves, so they were part of life in de fortress. Then, Warlord Ykesha went crazy! He kept hiding from everyone. He always thought someone was coming to kill him! Oh, me tired. Me needs a nap.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 56) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 56 && $qglobals{GUKtalk} == 27) {
         # 56 wins - GUKtalk 28
         quest::setglobal("GUKtalk",28,5,"F");
         quest::say("Me not so tired now! Warlord Ykesha went so deep into de fortress and no one heard from him. Things went strange because trolls had no leader. De froggies saw dat de trolls were running around confused, so they started to organize. Uhm. Too much talking. Go away now and come back.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 58) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 58 && $qglobals{GUKtalk} == 28) {
         # 58 wins - GUKtalk 29
         quest::setglobal("GUKtalk",29,5,"F");
         quest::say("De story is a bit scary. While Warlord Ykesha was crazy, de Broken Skull trolls saw a chance to kill a bunch of de Ykesha clan trolls and take de Grozmok Stone. And they did. When de Broken Skull trolls left, de froggies grabbed all de weapons they had stolen from de trolls and finished where they left off, taking over de fortress and they called it Guk! Me tell you more later. Promise!");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 60) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 60 && $qglobals{GUKtalk} == 29) {
         # 60 wins - GUKtalk 30, GUKpower 6
         quest::setglobal("GUKtalk",30,5,"F");
         quest::setglobal("GUKpower",6,5,"F");
         quest::say("Me remember you, $name! If me remember right, there had been no sign of Warlord Ykesha. All we know is dat he just got further and further back in de dungeon. Then something bad happened. A troll shaman was able to hide in Guk and remained unnoticed by de froggies for some time. In de dark, he prayed to Innoruuk to help him escape. Innoruuk heard de prayer and looked down. He was angry dat Mithaniel Marr's froggies took over de home of his troll children. Innoruuk let his ire pass through de troll shaman! Oh, good story. You come back later for more. Hee hee.");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($guk_wins >= 62) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 62 && $qglobals{GUKtalk} == 30) {
         # 62 wins - GUKtalk 31
         quest::setglobal("GUKtalk",31,5,"F");
         quest::say("Me knew you couldn't stay away $name! When de shaman became a conduit for Innoruuk's hate, a very bad thing happened. De curse dat Innoruuk sent through de troll was so powerful it sent a deadly, soul-robbing shockwave through Guk. Anything near de troll had its soul stolen. De curse is so evil dat it created a living portal, a portal to Innoruuk's own Cauldron of Hate. Yeah, scary. Me know!");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 64) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 64 && $qglobals{GUKtalk} == 31) {
         # 64 wins - GUKtalk 32
         quest::setglobal("GUKtalk",32,5,"F");
         quest::say("Oh, yes $name, there is more! After de troll brought Innoruuk's curse to de mortal realm, he died 'cause Innoruuk couldn't use him. But those froggies closest to de portal to de Cauldron of Hate were given de task of collecting souls to feed to de curse. Me thinks they are called de Witnesses of Hate, having looked into de very cauldron themselves. Ew. Poor froggies.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 66) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again."); # red message
         }
      }
      elsif($guk_wins >= 66 && $qglobals{GUKtalk} == 32) {
         # 66 wins - GUKtalk 33
         quest::setglobal("GUKtalk",33,5,"F");
         quest::say("We nearly done with this story! You know how there are undead froggies and living froggies in Guk? Well, dat curse is why! De undead froggies in Guk were touched by de curse. Down in Deepest Guk, de curse is strongest, so if you goes in there, cover your nose or something. My story is done now me thinks. You should go talk to Selephra Giztral again! Bye byes!");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($guk_wins >= 68) {
            $client->Message(13, "You have additional information to uncover! You must speak to Selephra Giztral to find out more."); # red message
         }
      }
      elsif($guk_wins >= 68 && $qglobals{GUKtalk} == 33) {
         $client->Message(13, "You have additional information to uncover! You must speak to Selephra Giztral to find out more."); # red message
      }
      elsif($qglobals{GUKtalk} == 35) {
         # theme maxed
      }
      else {
         # text made up
         $client->Message(9, "You need to adventure some more in Deepest Guk.");
      }
   }
}

sub EVENT_ITEM {
   plugin::return_items(\%itemcount);
}