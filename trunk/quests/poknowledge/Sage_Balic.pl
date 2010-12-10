#############
#Quest Name: Crown of Deceit
#Author: Shadestrike
#NPCs Involved: Sage Balic, an_old_froglok
#Zone: Plane of Knowledge
##############

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings friend. Welcome to my place of private contemplation. I relax here and leaf through my old studies, admiring at creations from the past made by races we thought would never amount to anything. My favorite tomes to look at are those that deal with Frogloks.");
  }
  if($text=~/your research/i) {
    quest::say("My research? Oh, I imagine Tenada sent you to me. I'd love to tell you about my studies, if you have time to listen.");
  }
  if($text=~/listen/i) {
    quest::say("I have come to Knowledge to fine-tune my abilities in spell craft. To date I've been able to create some minor incantations, but have had little success in creating any magic that was truly revolutionary. I am actually in a bit of a race with the other Sages who are my contemporaries. They too are looking to make a major breakthrough . . . Come to think of it, I could probably find quite a few [uses for their research], should you manage to come by any of it.");
    quest::say("Sorry, I digress. Where was I? Oh yes! In the past I, as well as the other Sages, have had little success; however from the volumes of information found here, each of us found a new outlook on the creation of magic. I found that most of the magical discoveries came from existing magical components, mostly runes and words of power. Should you come by any of these components please use this box to check to see if they have the proper magical configuration. The extractor will be able to remove what it needs if you find a valid combination. Right now I believe the box will only function with a single word and rune of approximately the same power.");
    quest::summonitem(17176);
  }
  if($text=~/their research/i) {
    quest::say("Well it couldn't hurt, now could it? If you manage to 'acquire' any of their research feel free to show it to my assistants; Xelrin's research to Tenada and Gunyth's research to Winon downstairs.");
  }
  if ($text=~/frogloks/i) {
    quest::say("A surprising race to study is the Frogloks of Antonica. While we may think their magic was weak, it was at one time so powerful the Gods reached down and smote them for their creations. Balls of energy that made life into magic! Their High Enchanter even made a mask that transformed the wearer into a Teir`Dal! Quite an interesting race worthy of some study if you ask me, someday I shall like to go and see these frogloks, especially to learn more knowledge of the magical mask.");
  }
  if ($text=~/magical mask/i) {
    quest::emote("blinks and looks at you.");
    quest::say("I have told you all that I know, for more knowledge you will need to seek its creator. The enchanter is more than likely very old, the mask having been made at the height of the power of the Froglok race. Here take this picture book to aid you in your quest.");
    quest::emote("hands you a Picturebook.");
    quest::summonitem(11275);
  }
}

#END of FILE Zone:poknowledge  ID:202050 -- Sage_Balic