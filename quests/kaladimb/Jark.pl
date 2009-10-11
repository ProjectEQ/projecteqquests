# Paladin Epic 1.0
# NPCID: 67056
# Zone: kaladimb

sub EVENT_SAY {
  if ($text=~/Hail/i) {
    quest::emote("strikes the wall with his pick. A clacking sound echoes through the cave. 'Har har. There's something all right.'");
  }
  if ($text=~/something/i) {
    quest::say("Huh? Oh, I struck me some silver. Ain't gonna make me rich but it'll sure pay for me minin' costs. Speakin of, that wife o' mine was supposed ta bring me food already. Hey, you, wanna go get me my dinner? I ain't got nothing ta pay ya with but I sure would appreciate it.");
  }
  if ($text=~/dinner/i) {
    quest::say("Har, I know you were a good sort. Nella has it. She's out there somewhere in the lower areas. She likes to visit the temple, so maybe she's there. Just tell 'er Jark sent ya and she'll prolly have everythin' ready fer me.");
    quest::spawn2(67090,0,0,178.5,708.9,3.4,194.2); #spawn Nella Stonebraids
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29007 => 1)) { #cold plate of beef and bread
    quest::say("Har, har! No time fer eatin' now! While you were gone I struck me a rich vein. Lookie here! Ya ever seen a gem so pure? It's tiny but clear as glass. Ya take it, $name. Ya showed me some kindness, least I can do. Besides, still a share here for me.");
    quest::summonitem(29006); #pure crystal
  }
  else {
    quest::say("I do not need this.");
    plugin::return_items(\%itemcount);
  }
}

#END of FILE Zone:kaladimb  ID:67056 -- Jark