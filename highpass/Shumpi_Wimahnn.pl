# NPC: Shumpi Wimahnn (5073)
# Zone: highpass (Highpass Hold)
# Quest:
#    Adventure in the Rujarkian Hills (LDoN charm power up)

sub EVENT_SAY {
   if ($text=~/hail/i && defined($qglobals{RUJtalk}) && plugin::check_hasitem($client, 41000)) {
      my $ruj_wins = $client->GetLDoNWinsTheme(4);
      if ($ruj_wins >= 62 && $qglobals{RUJtalk} == 30) {
         # 62 wins - RUJtalk 31
         quest::setglobal("RUJtalk",31,5,"F");
         quest::say("Ah yeah, them orcs. Bit on the burly side, aren't they? I'm sure I could take one out. I bet they can barely see me if I run through their legs. What do ya think? Hee hee. Oh, right. Task at hand. You want to know more about those awful Rujarkian orcs, hm? I've done me a bit of sneaking in the Rujarkian Hills. I've learned how they operate and how they set up their ranks. If you come back soon, I'll tell you a wee bit about it. I've gots to run though. Time to eat!");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($ruj_wins >= 64) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($ruj_wins >= 64 && $qglobals{RUJtalk} == 31) {
         # 64 wins - RUJtalk 32
         quest::setglobal("RUJtalk",32,5,"F");
         quest::say("What cheer! You've gone and come back again $name! Blimey, I'm a touch peckish. Anyway, the orcs. Yeah, well, at the very bottom rung of their ladder, you'll see the lowest of the low, aye. Most would think the Rujarkian orcs merciless to the point of madness, but there is a wee bit of practicality in their minds that detests waste. So, criminals are not just tossed into the stewpots like the weak or old, they become cast-off, menial slaves in a group of orcs known as The Broken. Those orcs are composed exclusively of the damned. Frightful, hm? The Broken orcs are mad and spend their useless blood freely, preferring death over a life without a real master. Cripes, I have to find some food to put into me belly.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($ruj_wins >= 66) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($ruj_wins >= 66 && $qglobals{RUJtalk} == 32) {
         # 66 wins - RUJtalk 33
         quest::setglobal("RUJtalk",33,5,"F");
         quest::say("Back to it, $name. I'm ready! Ya know, even though slavery is the tie that binds orcs of all stations together, there are slaves that provide food and labor to all the orcs. They are controlled by the Steelcrown. And while those nasty Steelcrown can ask the stronger orcs to help find and kill new flesh, the management, control, and use of slaves is their sole domain. They are the most numerous of the Rujarkian orcs and the most commonly encountered by outsiders . . . and they don't usually live very long. Hee hee. I'll be . . . I'm hungry again.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($ruj_wins >= 68) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($ruj_wins >= 68 && $qglobals{RUJtalk} == 33) {
         # 68 wins - RUJtalk 34
         quest::setglobal("RUJtalk",34,5,"F");
         quest::say("I'm going to have to start carrying food with me, $name. It's dreadful to stand here all day and hear my tummy growl as it does. As I just wrote in a note to Barstre Songweaver, I was able to get a few more tidbits on the Spiritbound orcs in the Rujarkian Hills. They are the healers and teachers amongst the orcs, though an outsider would be hard-pressed to compare the ruthless and brutish rituals of the Spiritbound to the rituals of the outside world. Gifted with mysterious insight, they police the thoughts and actions of their race, turning quickly to righteous judge and deft executioner when the situation calls for it. Hee hee. They are also bloody masters with surgical tools. Whether or not they use them to heal and repair is questionable. I saw tools and blood, but no mended orcs. Naturally, I didn't hang around too long! Alas, I must run, I can barely hear myself think over my grumbling belly!");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($ruj_wins >= 70) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($ruj_wins >= 70 && $qglobals{RUJtalk} == 34) {
         # 70 wins - RUJtalk 35, RUJpower 7
         quest::setglobal("RUJtalk",35,5,"F");
         quest::setglobal("RUJpower",7,5,"F");
         quest::say("Thankfully I just ate, fair $name! Not sure you know this yet, but even though the Rujarkian orcs would rather take than trade, one line of their breed, the Captive Coin, has managed to survive through treacherous, but careful, use of wealth. They build quiet trade alliances with outsiders, but still use brute strength and coercion more often than crafty wit to obtain their monies. Still, as far as orcs go, you understand, they are considered clever . . . and fearsome. Speaking of fearsome, I've got myself a raging appetite I must appease. I'll be ready to talk to you later.");
         $client->Message(15, "You have received an invaluable piece of information!");
         $client->Message(15, "Your Adventurer Stone glows with more power as you gain stature with the Wayfarers Brotherhood.");
         if ($ruj_wins >= 72) {
            $client->Message(13, "You have additional information to uncover! Try speaking to this adventurer again.");
         }
      }
      elsif($ruj_wins >= 72 && $qglobals{RUJtalk} == 35) {
         # 72 wins - RUJtalk 36
         quest::setglobal("RUJtalk",36,5,"F");
         quest::say("The last and final group of orcs I've learned about are the Steelslaves. Ferocious, they are! Born to bleed, these are the greatest warriors of the Rujarkian orcs. Although the other classes have fighters in them, none compares to the innate skill and practiced battle rage that these orcs possess. They are the front line and last defense of the Rujarkian orcs and they are mighty menacing in great numbers, I tell you. I get shivers about it, I do! Well, that's all I have to tell you about the orcs. I'm sure Barstre Songweaver can give you any additional information you may need.");
         $client->Message(15, "You have received an invaluable piece of information!");
         if ($ruj_wins >= 74) {
            $client->Message(13, "You have additional information to uncover!  You must speak to Barstre Songweaver to find out more.");
         }
      }
      elsif($ruj_wins >= 74 && $qglobals{RUJtalk} == 36) {
         $client->Message(13, "You have additional information to uncover!  You must speak to Barstre Songweaver to find out more.");
      }
      elsif($qglobals{RUJtalk} == 37) {
         # theme done
      }
      else {
         # text made up
         $client->Message(9, "You need to adventure some more in the Rujarkian Hills.");
      }
   }
}

sub EVENT_ITEM {
   plugin::return_items(\%itemcount);
}