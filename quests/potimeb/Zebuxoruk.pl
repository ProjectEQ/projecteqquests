sub EVENT_SPAWN {
    quest::emote("staggers about and looks at you, drowsy from his weakened state. 'My thanks to you. I am surprised to see you have made it here. We must get back to Norrath. The time has come for me to share my knowledge. Something is coming, a threat to us all, and the sands in the hourglass are thinning. Make haste and take me back the way you came.'");
quest::settimer("zeb1",20);
}
sub EVENT_TIMER {
if($timer eq "zeb1"){
    quest::say("I am surprised at the gods for taking such drastic measures, though I suppose all of the creations of the Nameless are capable of displaying poor judgment and irrational behavior. These gods are burdened with powers and responsibilities beyond our comprehension, yet at times they do not understand the eventual effect of their actions. I am compelled to share the knowledge of the gods with the populace of Norrath, so that I might save their creations. They do not realize that if mortality ceases to exist... if they are not worshipped and held aloft by the beliefs of those that they now have grown to fear... they will fall from power and a new age of darkness will wash over existence as they know it. I did not seek to interfere with them or their  realms, only to free them from a fate that awaits all of us. It is this fate that now stands ready, greedily gathered on the edge of the void, ready to test the will of all mortals.");
    quest::settimer("zeb2",20);
    quest::stoptimer("zeb1");
}
if($timer eq "zeb2"){
    quest::say("If they have taken measures these extreme I must rethink what I have done, and what I will do. If there was this much cause for conc...");
    quest::signalwith(223111,1006,0);
    quest::spawn2(223213,0,0,47,-1105.91,-2.8105,187.9);
    quest::settimer("zeb3",10);
    quest::stoptimer("zeb2");
}
if($timer eq "zeb3"){
    quest::say("Druzzil, I have missed you. Wasn't it you that taught me in your own realm to seek knowledge and share it in all forms?");
    quest::settimer("zeb4",15);
    quest::stoptimer("zeb3");
}
if($timer eq "zeb4"){
    quest::stoptimer("zeb4");
    quest::depop();
 }
}