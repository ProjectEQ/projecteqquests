sub EVENT_ITEM {
   if(plugin::check_handin(\%itemcount, 1093 => 1)) {
    quest::say("Thank you. I will return to the Dain and inform him that the battle is underway. Please escort Garadain to the battlefield and see that he returns safely. May Brell bless you and bring you victory over these beasts.");
    quest::settimer("spawn1",5);
    quest::depop(116084);
  }
  else {
    plugin::return_handin(\%itemcount);
  }
}

sub EVENT_TIMER {
  if($timer == "spawn1") {
    quest::stoptimer("spawn1");
#Garadain Glacierbane
    quest::spawn2(116084,236,0,-389.6,-2713.6,181,19);
#royal wolven guard
    quest::spawn2(116563,238,0,790.9,-2497.6,168.6,40);
    quest::spawn2(116563,239,0,799.8,-2491.6,169.1,40);
    quest::spawn2(116563,240,0,808.4,-2485.8,169.6,40);
    quest::spawn2(116563,241,0,817,-2480.1,170.1,40);
    quest::spawn2(116563,242,0,779.6,-2480.4,168,40);
    quest::spawn2(116563,243,0,788,-2474.8,168.5,40);
    quest::spawn2(116563,244,0,796.7,-2469,169,40);
    quest::spawn2(116563,245,0,805.6,-2463,169.4,40);
#priest of brell
    quest::spawn2(116541,246,0,796.2,-2506.7,168.9,40);
    quest::spawn2(116541,247,0,805.1,-2500.8,169.4,40);
    quest::spawn2(116541,248,0,814,-2494.9,169.9,40);
    quest::spawn2(116541,249,0,822.9,-2489,170.4,40);
    quest::spawn2(116541,250,0,773.4,-2471.7,167.7,40);
    quest::spawn2(116541,251,0,782.2,-2465.9,168.2,40);
    quest::spawn2(116541,252,0,791.2,-2459.8,168.6,40);
    quest::spawn2(116541,253,0,799.7,-2454.2,169.1,40);
#royal archer
    quest::spawn2(116555,254,0,801.8,-2515.1,169.2,40);
    quest::spawn2(116555,255,0,810.8,-2509.1,169.7,40);
    quest::spawn2(116555,256,0,819.6,-2503.3,170.2,40);
    quest::spawn2(116555,257,0,828.5,-2497.3,170.7,40);
    quest::spawn2(116555,258,0,767.5,-2462.8,167.4,40);
    quest::spawn2(116555,259,0,775.9,-2457.2,167.8,40);
    quest::spawn2(116555,260,0,784.9,-2451.2,168.3,40);
    quest::spawn2(116555,261,0,793.7,-2445.3,169.2,40);
#paladin of brell
    quest::spawn2(116549,262,0,808.4,-2523.6,169.6,40);
    quest::spawn2(116549,263,0,817.1,-2517.8,170.1,40);
    quest::spawn2(116549,264,0,825.8,-2512,170.5,40);
    quest::spawn2(116549,265,0,834.4,-2506.3,171.0,40);
    quest::spawn2(116549,266,0,761.7,-2453.8,167,40);
    quest::spawn2(116549,267,0,770.6,-2447.8,167.7,40);
    quest::spawn2(116549,268,0,779.4,-2442,168.8,40);
    quest::spawn2(116549,269,0,787.8,-2436.4,169.8,40);
#ry'gorr elite
    quest::spawn2(116556,0,0,389.9,-3451.6,146.7,249);
    quest::spawn2(116556,0,0,392,-3476.5,146.6,249);
    quest::spawn2(116556,0,0,364.6,-3451.7,146.7,249);
    quest::spawn2(116556,0,0,366.5,-3477.6,146.6,249);
    quest::spawn2(116556,0,0,450.2,-3449.3,146.7,249);
    quest::spawn2(116556,0,0,451.7,-3475.3,146.6,249);
    quest::spawn2(116556,0,0,475.4,-3447.9,146.7,249);
    quest::spawn2(116556,0,0,476.9,-3473.5,146.7,249);
#kromrif soldier
    quest::spawn2(116548,0,0,339.5,-3453.3,146.7,249);
    quest::spawn2(116548,0,0,341,-3478.5,146.7,249);
    quest::spawn2(116548,0,0,313.6,-3454.2,146.8,249);
    quest::spawn2(116548,0,0,315.1,-3479.9,146.7,249);
    quest::spawn2(116548,0,0,500.9,-3446.9,146.8,249);
    quest::spawn2(116548,0,0,502.4,-3471.9,146.7,249);
    quest::spawn2(116548,0,0,526.2,-3445,146.8,249);
    quest::spawn2(116548,0,0,527.7,-3470.6,146.8,249);
#kromrif soldier inside fort
    quest::spawn2(116548,0,0,442.6,-3592.8,146.4,255);
    quest::spawn2(116548,0,0,406,-3592.8,146.3,255);
#oracle of ry'gorr
    quest::spawn2(116006,0,0,433.3,-3593,146.3,255);
#chief ry'gorr, head dropping version
    quest::spawn2(116577,0,0,425.9,-3593.2,146.3,255);
#Firbrand the black
    quest::spawn2(116012,0,0,416.2,-3592.8,146.3,255);
#ringeightcoord
    quest::spawn2(116575,0,0,0,0,0,0);
  }
}#END of FILE Zone:eastwastes  ID:116138 -- Gloradin_Coldheart 