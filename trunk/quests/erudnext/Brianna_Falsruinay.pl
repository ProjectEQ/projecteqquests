sub EVENT_SAY {
 if($text =~ /Hail, Brianna Falsruinay/i) {
	quest::say("Hello Traveler, I am afraid I don't recognize you to be a local around these parts although I could have been buried in my work. I have been quite busy since [Elisi] turned up missing.");
 }
 if($text =~ /Elisi/i) {
	quest::say("Elisi Nasin is a very well known enchanter and courier from Erudin. It is part of her trade to travel to Qeynos and share knowledge with the residents of the Order of Three. She often travels once or twice a month to deliver and pick up her most recent workings. However, she still has not returned from her most recent [travel]. We fear the worst for her; pirates have been rampant around these parts lately. We should send [someone to Qeynos] soon but have not had the time to do so.");
 }
 if($text =~ /travel Qeynos/i) { 
   quest::say("Your offer is quite gracious Tuppen, I do have a good feeling about you. If you wish to help us figure out what has happened to Elisi please travel to Qeynos. I believe the person she used to exchange magic with was named Jalorin. He is a member of the Order of Three so you should be able to find him there. Present him with this medal so that he may know you are sent from us. Please return to me if you should discover anything about Elisi's disappearance.");
   quest::summonitem(21971);
 }
 if ($text=~/still willing to help/i) {
   quest::say("Very well $name, please take this note to Jalorin. I would like him to provide us with some of Elisi's scrolls that she has brought him recently. If he can't provide you with the scrolls I have listed here then I believe he is withholding some information and we could alert the Qeynos council of Jalorin's possible involvement.");
   quest::summonitem(21969);
 }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 21699 => 1)) {
    quest::say("Jalorin gave this to you? This is quite odd because this is not Elisi's handwriting and there is clearly something wrong. I really do think for some reason that Jalorin is involved so if you are [still willing to help] I would like you to help me find out if he is being truthful. I must warn you though, if Jalorin is in fact involved with her disappearance this could get dangerous.");
  }
  if (plugin::check_handin(\%itemcount, 21970 => 1)) {
    quest::say("Oh yes something is extremely wrong. It is at least good news that you have disposed of Jalorin. I knew he had to be involved in this one way or another. This map appears to have some dull writing on it but I cannot make it out correctly. While you were gone, my husband reminded me that Elisi always wore her medallion given to her by her mother and her guards carried the finest blade ever presented to a Sentinel of Erudin. If you could find 3 of these guardian blades along with Elisi's medallion I believe that we could come to a conclusion on Elisi's whereabouts. The sad news is that if you should recover these items there is no doubt in my mind that she is dead because she would never give up her medallion willingly. Oh and here is the map you took from Jalorin, I have no use for it.");
    quest::summonitem(21970);
  }
  if (plugin::check_handin(\%itemcount, 21698 => 1, 21697 => 3)) {
    quest::say("This is a sad day indeed. Thank you for your valorous deeds, $name. Please accept this along with our gratitude for finding out what became of Elisi.");
    quest::summonitem(61001);
  }
  plugin::return_items(\%itemcount);
}