# NPC: Ginehl Wiquar (9127)
# Zone: freportw (West Freeport)
# Quest:
#   Adventure in the Rujarkian Hills (LDoN charm power up)

sub EVENT_SAY {
   if ($text=~/hail/i && defined($qglobals{RUJtalk}) && plugin::check_hasitem($client, 41000)) {
      my $ruj_wins = $client->GetLDoNWinsTheme(4);
      if ($ruj_wins >= 14 && $qglobals{RUJtalk} == 6) {
         # 14 wins - RUJtalk 7
         quest::setglobal("RUJtalk",7,5,"F");
         quest::say("Ah, you're here to receive information. I've have a steady stream of messengers bringing me more history around the goblins and orcs in the Rujarkian Hills. It's a very interesting story. The gods themselves were involved, don't you know. You see, Solusek Ro, the lord of Flame, created the Serpent Mountains by arching the crust of Norrath and brought burning heat down upon the inhabitants of Norrath. A tribe of goblins and orcs were trapped somewhere beneath the surface. The ages of evolving, warring, and fighting produced the result we see in the hills. The goblins lost their control of the hills some time ago, but I don't know when. There is much more behind that story though. I can tell you more later. There are too many ears about.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($ruj_wins >= 16) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($ruj_wins >= 16 && $qglobals{RUJtalk} == 7) {
         # 16 wins - RUJtalk 8
         quest::setglobal("RUJtalk",8,5,"F");
         quest::say("More about the Rujarkian orcs and goblins, hm? Well, over the years, the orcs trapped underneath the Rujarkian Hills advanced in ways we've never seen. There are no other orcs in our lands that have attained the same organization and strength these vessels of battle have. There was no way the goblins could prevent the rise of the orcs and the fall of their superiority in the hills. Run along now please, I'm expecting someone. I'll see you soon, I have no doubt.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($ruj_wins >= 18) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($ruj_wins >= 18 && $qglobals{RUJtalk} == 8) {
         # 18 wins - RUJtalk 9
         quest::setglobal("RUJtalk",9,5,"F");
         quest::say("I certainly understand your continuing interest in the evolution in the Rujarkian Hills. Those poor worshippers of Brell Serilis, the goblins, really didn't stand a chance against the orcs. I can see why the dwarves aren't too fond of the idea that their own father has anything to do with the goblins. It seems reasonable to me though as both races are experts with life underground, wouldn't you say? Okay, I must ask you to leave again. Some of my more unsavory contacts will not approach while I have visitors.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($ruj_wins >= 20) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($ruj_wins >= 20 && $qglobals{RUJtalk} == 9) {
         # 20 wins - RUJtalk 10, RUJpower 2
         quest::setglobal("RUJtalk",10,5,"F");
         quest::setglobal("RUJpower",2,5,"F");
         quest::say("How do you do, $name? We've done some more investigating into the Rujarkian Hills as more of our adventurers infiltrate the ranks. There are far more of them than we imagined. We've found some accounts of the history of the goblins too. Barstre Songweaver has had some time to study them further. You should go back to him. I'm sure the information is useful.");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($ruj_wins >= 22) {
            $client->Message(13, "You have additional information to uncover!  You must speak to Barstre Songweaver to find out more.");
         }
      }
      elsif($ruj_wins >= 22 && $qglobals{RUJtalk} == 10) {
         $client->Message(13, "You have additional information to uncover!  You must speak to Barstre Songweaver to find out more.");
      }
      elsif($qglobals{RUJtalk} == 37) {
         # theme done
      }
      else {
         # adventure some more - text made up
         $client->Message(9, "You need to adventure some more in the Rujarkian Hills.");
      }
   }
}

sub EVENT_ITEM {
   plugin::return_items(\%itemcount);
}
