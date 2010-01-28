sub EVENT_SAY { 

if($text=~/Hail/i){

quest::say("Greetings. May I help you?"); }

}

sub EVENT_ITEM {

if (plugin::check_handin(\%itemcount, 5571 => 1)) {
quest::say("Where did you get this?! I have been looking for just this kind of map for a very long time! Hmmm, I know, how about I show you how to improve those claws of yours!");
quest::say("In order to improve them, I need you to take this Stitching Pack, unless you already have one, and this stone and make two leather straps. Once you have them, give me them along with your claws and I will work my magic!");
quest::say("Use only the very best rockhopper hide you can find along with that stone, and you will have those strips in no time!");
quest::summonitem("17237");
quest::summonitem("5572");
}
if(plugin::check_handin(\%itemcount,5581 => 2, 3673 => 1, 3674 => 1)) {
quest::emote("takes the leather straps from you and begins to make quick, deft adjustments to the claws. Soon, she hands them back to you, firmly reinforced by the leather straps.");
quest::say("There you go! I see you had little trouble gathering the straps. Perhaps you could help a friend of mine in Hollowshade Moors. Here, take this note and deliver it to Rittuh Purric. She should be at one of the outposts, though I couldn't tell you which one. Good luck, $name!");
quest::emote("hands you a folded note.");
quest::summonitem("5574");
quest::summonitem("5575");
quest::summonitem("5573");
quest::exp(2500);
}
if (plugin::check_handin(\%itemcount, 5577 =>1 )) {
  quest::say("You have done very well, youth. I hope that you are beginning to understand what it means to walk the path of Khati Sha. Public service is very important. Our namesake is the fundamental figure in the foundation of this society. Our walls are made of the ore that he discovered. His exploration of the lands that surround our home made it possible for us to live here in peace. This leads us to our next lesson. I would like you to seek out the caverns beyond the thicket. A breed of shelled creatures roam the tunnels of those caverns. Occasionally, a strong glow will manifest itself in one of these creatures. Find such a creature and bring me the source of its glow. Wrap the light source in your Khati Sha recruit's cloak and place them both in this box.");
  quest::summonitem(17610);
  quest::exp(1000);
  quest::faction(423,1);
}
if (plugin::check_handin(\%itemcount, 5579 =>1 )) {
  quest::emote("opens the box and removes your old cloak. She unwraps the orb and looks at it for a moment.");
  quest::say("You have done well, youth.' She says as she picks up what appears to be a new cloak. She hands you the cloak and smiles. 'Your life as a member of our sect may not always be pleasant, but take comfort in the fact that you are performing a great service to your people. Walk the path of the Khati Sha with pride and one day may you see his face as I have. Now, seek out Kaam Rahiir in the libraries. Show him your claws and he will be able to assist you in imbuing them magically. Take care.");
  quest::shout("Citizens of Shar Vahl, take this time to welcome $name to the level of Khati Sha Apprentice. We are all in the debt of each and every citizen that works a hard as $name to improve our city.");
  quest::summonitem(5580);
  quest::exp(10000);
  quest::faction(423,1);
}
plugin::return_items(\%itemcount);
}
#End of FILE Zone:sharvahl  ID:155061 -- Kery_Miann

