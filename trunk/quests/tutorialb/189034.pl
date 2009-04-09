sub EVENT_SAY(){
  if ($text=~/hail/i){quest::say("Weapons are one of your main forms of combat. And a faster weapon can make the battle go in your favor. While helping out here , I found enough stones to sharpen weapons. If youd like I can sharpen your's , simply hand it to me.");  }
}
sub EVENT_ITEM(){
  if ($item1==9997){quest::summonitem(7021);  }
  if ($item1==9998){quest::summonitem(5042);  }
  if ($item1==9999){quest::summonitem(6030); }
  if ($item1==55623){quest::summonitem(5071);  }
}
              
