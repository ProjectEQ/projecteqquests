sub EVENT_SAY {
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/elder spirit sent me/i) {
    quest::say("Aye, well then. Watch yerself. Thar be a crazy fella over there. Been trying for days, I 'ave, to get 'im to make some sense about this megalodon creature 'e keeps prattling on about. I been a bit shy o' stepping in the lake to get some seaweed for the spirit's potion. Maybe you could go take a look. Somethin' usually comes by to snap 'em up when they grow, so ye may need to route around a tad out there. You think you are [up to it]?");
  }
  }
  if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 1) {
  if ($text=~/up to it/i) {
    quest::say("Very well, then, off you go in search of the seaweed.");
    quest::spawn2(51160,0,0,2812,-771,-199,146);
  }  
}
if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 3) {
  if ($text=~/break down/i) {
  quest::say("As most things, the process is not a simple one and we'll need some ingredients for a special potion. You must retrieve four items, which should not prove difficult for a shaman of your stature. They are very specific and I can tell you more about the [skin], the [powder], the [tooth], and the [goo]. When you have all of these things, use my medicine bag to create this potion and return it to me.");
  quest::summonitem(52922);
}
}
if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 3) {
  if ($text=~/skin/i) {
  quest::say("First, you must find your way to Kuua for part of the potion. There you will find a foul hound of flesh with no fur and fangs. We need a perfect specimen of some of its skin for our potion. Three should do nicely.");
  }
  }
if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 3) {
  if ($text=~/powder/i) {
  quest::say("The powder is very unique and can be difficult to obtain -- many have died trying as it's a coveted magic. There is an undead fiend that uses this powder to turn many creatures and darken them. It is a beast in a sickly plane which makes it that much more challenging, of course. This powder is needed so that we can use a pinch of it to attract the Spirit of Might close enough to us to have it turn its back on the path of the wasichu.");
  }
  }
if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 3) {
  if ($text=~/tooth/i) {
  quest::say("In suffocating lands, there are a few revenants with a marrow that we need. It's a rather unpleasant task and I'm sure they won't cooperate. You must find four of their teeth.");
  }
  }
if (defined $qglobals{shaman_epic} && $qglobals{shaman_epic} == 3) {
  if ($text=~/goo/i) {
  quest::say("The goo is very special and will provide a strong acidic base for the agent we are creating. You will find it deep where the spirits groan and drift, where it seems even the walls howl in agony. There is only one creature that produces this goo that we use to separate gem from metal. It is very deep within that place. You should try to obtain two samples of goo.");
  }
  }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52926 =>1 )) {
    quest::say("Well done! And ye got it off that great creature? Aye, it really exists. Guess that mad feller ain't so mad, now, is he? Ha! Well, we have a better chance at saving the spirit. Take this seaweed back. I've wrapped it for you. Now, get moving!");
    quest::summonitem(57600);
  }
  if (plugin::check_handin(\%itemcount, 57088 =>1 )) {
    quest::say("Aye, so ye have returned. We have much to do here, me friend. The first thing we must do is [break down] this bangle into its gems and metal. This here bangle was very carefully made. First, the gems were blessed by the spirits, then the metal itself as it was forged. Aye, we need to carefully separate them. The two gems were blessed by the spirits of Wisdom and Patience, and the metal was strengthened by the Spirit of Might. We will use these to call them back to us.");
  }
  if (plugin::check_handin(\%itemcount, 57560 =>1 )) {
    quest::emote("nods at you and reaches into her pocket and takes out the gemmed bangle and puts it on the ground. She takes the vial and slowly lets a few drops fall on the platinum. It seems to coil and bend and pulls itself into a small globe and the gems lazily fall onto the ground.");
    quest::say("Perfect! Now, you must return the gems and platinum to the Spirit of Enlightenment. I've put it in a purse to keep them safe. You truly are beginning to surpass all of our expectations, $name.");
    quest::summonitem(57614);
  }
  plugin::return_items(\%itemcount);
}