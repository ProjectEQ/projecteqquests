# Beriol's Research
#
# items: 4769, 4770

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, $name. And good day to you. What brings you to my quarters today? Do you wish to learn more about the [magic] that we study in our hallowed section of the Shadowhaven?");
  }
  if ($text=~/magic/i) {
    quest::say("It's always a pleasure to meet someone that shows interest in the magic we practice here. Our magic studies consist mostly of teleportation and the arts of elemental mastery. I'm Actually conducting a study now, but I' missing a few [books].");
  }
  if ($text=~/books/i) {
    quest::say("Well, I have an old student that is now serving as an advisor to one of the most respected residents of Katta Castelleum. He has some specific books that i need to further my research, but i cannot take the time to travel so far away from my home to retrieve them. I seek out one who will [bring my research] to me from Dersino.");
  }
  if ($text=~/bring your research/i) {
    quest::say("You are exactly the one I am looking for. After presenting this seal to Dersino, inform him that you wish to take the research and I am sure that he will know i have sent you. I loook forward to seeing you soon.");
    quest::summonitem(4769); # Item: Seal of Beriol
  }
  if ($text=~/exodus/i) {
    quest::say("Ahh, the event that started it all it was the strife between Seru and Tsaph Katta that ultimately brought us here to Luclin. Those must have been interesting times but, being over twenty generations Luclin born, I could only guess. One of these days I would like to read up on the subject, but what little we do have about it is always checked out. If that's what you came looking for, good luck - check with Rianna, she is usually up on those things.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4770 => 1)) {
    quest::say("This is exactly the research book that I was in need of. I am very thankful for you getting these for me. Should you ever feel up to it again in the future Dersino always is getting new books in that could be very helpful in my studies. Again, I thank you and wish you the best of luck.");
    quest::exp(1000);
    quest::faction(1511,10); #house of midst
    quest::faction(1508,10); #traders of the haven
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: shadowhaven ID: 150087 NPC: Beriol_Talorakoir

