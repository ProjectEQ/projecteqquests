sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 52909 =>1 )) {
    quest::say("Egads, me friend. It has been summoned from the ground. Take as many friends as ye can muster. Ye are going to need them. This creature will be surrounded by summoned spirits of our very own warders. Ye must release as many of those abused spirits as ye can and dispatch the animist. That beast must have something he uses to control the warders. Return it to me!");
    quest::spawn2(336126,0,0,-1448,444,-39.9,207.3);
  }
  if (plugin::check_handin(\%itemcount, 52910 =>1 )) {
    quest::say("You are owed a great debt from beastlords everywhere. You have restored the revered spirits of the wild and they have returned to Norrath. And, what's this? Interesting. I would not have expected you to find this totem. Its markings are unfamiliar. I have wrapped it for you. You must go to see Muada at once and show him this.");
    quest::summonitem(52914);
  }
  plugin::return_items(\%itemcount);
}