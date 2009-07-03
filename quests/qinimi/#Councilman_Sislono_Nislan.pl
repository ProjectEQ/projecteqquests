sub EVENT_SAY {
  if ($text=~/hail/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 1) {
      quest::say("While I place my own life at risk by helping you, I feel a strong sense of honor amongst you and those who have come with you. It is because of this that I will try to help in anyway I can.");
}
}
  if ($text=~/stone of entry/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 2) {
  quest::say("Gaining access to such a private place has always been reserved for the elders of my people. While the legion may have destroyed our home, they have yet to figure out a way around many of our wards that bar access to our sacred areas. Unfortunately, their frustration at gaining entry resulted in the painful torture of many of my people until they were given the keys to enter. The courtroom requires one of these keys and while the invaders hold all of the existing keys, I can create one if you can retrieve the proper [items].");
}
}
  if ($text=~/items/i) {
  if (defined $qglobals{bic} && $qglobals{bic} == 2) {
  quest::say("The key consists of mud, some stonedust particles, and a piece of chalk. The mud can be found in the sewers beneth the city. The stonedust is plentiful near the coliseum, and the chalk can be found all over this area. Bring these to me and I will make you a temporary key which will grant you access to the courtroom. I implore you to hurry. I fear the one you seek may not be alive much longer.");
}
}
  if ($text=~/thing/i) {
    if (defined $qglobals{bic} && $qglobals{bic} == 2) {
    quest::say("The geomantic device which raises you into the courtroom is an ancient one and takes time to reset after it has been used. If you are having trouble entering, be patient. You will know it is ready to receive a key when you hear a grinding sound from the base of the device as it settles into place. Please be sure you are fully prepared before entering. While it once was a place of peaceful discussion, the courtroom is now a place where terrible torture is conducted by those the legion wants information from. When they see uninvited guests, they will not be very happy. The leader of this area's force is known as Tixxrt and stopping him is the only way you can save the small one, called Kreshin.");
}
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67700 =>1 )) {
    if (defined $qglobals{bic} && $qglobals{bic} == 1) {
    quest::say("Yes, I have seen this and others like it before. While we do not understand where it comes from, we have come to the conclusion that these strange glyphs express somthing important to your people. These particular glyphs were made by the small one they hold captive in the courtroom. If you wish to help him, you will have to retrieve the [stone of entry]. Only with this stone can you enter the courtroom and help the one who calls himself Kreshin.");
    quest::setglobal("bic",2,5,"F");
  }
  }
  if (plugin::check_handin(\%itemcount, 67398 =>1, 67399 =>1, 67400 =>1 )) {
    if (defined $qglobals{bic} && $qglobals{bic} == 2) {
    quest::emote("covers the three pieces in his hands, closes his eyes, and begins to chant. A glow begins to emanate from his hands and he begins to chant louder. Then, just as quickly as it began, the glow in his hands dims and the chanting stops.");
    quest::say("There you are -- the key which grants you and your party access to the courtroom. Just stand on the pedestal in the center of the large building in this part of the city with the key in your hand and say you wish to enter. There is one more [thing] I must tell you before you go.");
    quest::summonitem(67415);
  }
  }
  plugin::return_items(\%itemcount);
}