# Rogue Epic NPC/Guildmaster -- Tani_N`Mar

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings!  You must be a stranger or [new to the Hall].  If you are a stranger. be warned that these halls are intended for the Ebon Mask only. If you are found to be a member of another house. you just may feel the sting of a blade in your back.");
 }
  if($text=~/i am new to the hall/i) {
    quest::say("Then I am glad to make your acquaintance. Have you ever been to Freeport?  If not. how would you like to go?  It is a test of your cunning we wish.  Are you prepared to risk your young life?  Are you [ready to venture to Freeport]?");
 }
  if($text=~/i am ready to venture to freeport/i) {
    quest::say("Find a way to the port of Freeport.  Seek out Giz Dinree.  She is usually near the shores at night.  She is your contact. Tell her you were [sent by TanI].  She will fill you in on your mission.  Good luck.  Do not waste time practicing your skills. Go as you are.");
 }
  if($text=~/book of souls/i) {
    quest::say("The Book of Souls chronicles all the lives Innoruuk has tainted over the years. It is in the care of the Maestro of Rancor. I can use this tome as a basis for my translation, if you return it and the note to me. An experienced practitioner in the art of non-detection should be able to snatch it from its resting place, don't you think, $race?'");
 }
  if($text=~/note/i) {
    quest::say("Oh, you want that piece of paper Stanos was so hot after? Well it's mine now, though it looks like ogre scratch to me. You're not getting it, Stanos is not getting it, and Hanns is not getting it. It is MINE! Now, $race, scamper off like the dog you are, before I decide I need more practice with these short swords!");
 }
 }



sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13892 =>1 )) {
    quest::say("Good work! I knew you could prove your worth. Most waste time training. I do not reward those who waste my time. Please take this. It is from our horde, from countless robberies. I hope you can use it to advance yourself. Remember to always stay faithful to Neriak.");
    quest::exp(5000);
    quest::givecash(0,8,0,0);
    quest::faction(90,5);
    quest::faction(135,-5);
    quest::faction(361,-5);
    quest::faction(133,-5);
    quest::faction(31,-5);
    quest::summonitem(5066);
  }

   plugin::try_tome_handins(\%itemcount, $class, 'Rogue');
   plugin::return_items(\%itemcount);
 }


#END of FILE  Quest by: Solid11  Zone:neriakc  ID:42000 -- Tani_N`Mar 
#Updated by Jaekob
