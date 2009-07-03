sub EVENT_SAY {
  if ($text=~/hail/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) {
    quest::say("Greetings. You must be one of the adventurers that Fezbin told me about. It is a pleasure to meet such a brave individual. Where are my manners? My name is Taminoa Bialu and I compile all the information from our scouts in the [city] area of Taelosia.");
}
}

 if ($text=~/city/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) {
    quest::say("Well, it appears the native inhabitants of Taelosia lived in a grand city once. This city is made up of four different areas named in their language. They are [Qinimi], [Riwwi], [Barindu], and [Ferubi]. Based off of early information, we believe each area had a specific purpose. I am still trying to decipher the native language to figure out what the names mean, but going off of visual information I can assume that Qinimi served as their court, Riwwi is where they held games, Barindu was a lush garden, and Ferubi was a central place of worship once. That is about the extent of my information as far as the intended purpose of each area. What they are now used for I can explain in further detail. Which area would you like to hear more about?");
}
}

 if ($text=~/qinimi/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) {
    quest::say("It appears the Muramites have made this some sort of stronghold. Destroying many of the native symbols, the invaders have converted the building that once served as the court into fortified headquarters. It is here you will find a structure called the Chamber of Souls, various pens to hold ukun, and a moat of sickly black sludge. The structures that the nihil once called home are all but destroyed now. Very sad indeed. That's where the legion keeps the bulk of the [slaves]. I believe that the scout for this area was caught sneaking around the housing district, but I have no proof. If you were to search this area, maybe you would find some sort of sign or marker he may have left. That would be helpful.");
}
}

 if ($text=~/slaves/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) {
    quest::say("I see Fezbin saved some of the more dismal news for me. The legion has enslaved the natives of the continent. In the city area, these slaves are used mainly for menial tasks. Due to their fragile bodies, they cannot do any heavy lifting, but their knowledge of shaping stone makes them perfect for building new structures for the legion to use as well as altering current ones. They command the stone workers. I am not sure how the slaves are used in the temple areas. That information is held by L`diava.");
}
}
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67397 => )) {
    if (defined $qglobals{bic} && $qglobals{bic} == 1) {
    quest::say("Yes. This is exactly what I needed. Excellent job. Okay, now give me one moment to decipher this . . . hm. It seems that just before he was captured he was trying to communicate with the slaves in the area. The text is very hard to make out, but it looks like he may have been trying to get into the main headquarters. He was interacting with a particular slave named Sislono Nislan. This slave promised him a way into the headquarters only if he promised to rid the area of a tyrant, named Tixxrt. The rest of the parchment is undecipherable. I would suggest finding this slave and showing him this to see if he knows what happened.");
    quest::summonitem(67700);
  }
}
plugin::return_items(\%itemcount);
}