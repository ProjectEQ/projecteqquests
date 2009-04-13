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
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52926 =>1 )) {
    quest::say("Well done! And ye got it off that great creature? Aye, it really exists. Guess that mad feller ain't so mad, now, is he? Ha! Well, we have a better chance at saving the spirit. Take this seaweed back. I've wrapped it for you. Now, get moving!");
    quest::summonitem(57600);
  }
}