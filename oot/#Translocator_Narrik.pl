sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Hello there. There seems to be some strange problems with the boats in this area. The Academy of Arcane Sciences has sent a small team of us to investigate them. If you need to [" . quest::saylink("travel to Freeport") . "] or [" . quest::saylink("travel to Butcherblock") . "] in the meantime, I can transport you to my companion there."); }
if ($text=~/travel to freeport/i){
  quest::say("Off you go!");
  quest::movepc(10,-1006.66,-14.65,-53.47,64);
}
if ($text=~/travel to butcherblock/i){quest::selfcast("2281"); } 
} 