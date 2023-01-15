# items: 57008, 57996, 57010, 52900
sub EVENT_SAY {
if ($client->GetGlobal("beast_epic") ==3) {
  if ($text=~/lands/i) {
    quest::say("I've been studying the rhinocerosss asss well asss other things I cannot discusss, but my life is about our kind and the power of our warders. This gray beast here isss so incredibly fierce and surprisingly agile for its size. I have been able to use the waysss of ferociousss beastsss in some of my conjuresss that you may have heard of hm? Endless things to learn about wild beastsss. Enough slithering of the tongue, I shall [" . quest::saylink("read") . "] thisss note now.");
  }
  if ($text=~/read/i) {
    quest::say("I must go. That letter bringsss troubling newsss. I must hurry asss I now have another task I must persue urgently. I marked that letter for Muada for you. Do not lose it.");
    quest::summonitem(57008); # Item: Letter from Muada
  }  
}

 if ($client->GetGlobal("beast_epic") ==8) {
  if ($text=~/track down/i) {
    quest::say("I'm afraid that all I can tell you isss that it isss most thought of as an easily tamed creature, but now it hasss been twisted and frayed into a strange and terrible beast. Though it isss a common beast, trace it to its originsss -- where it wasss born. This one hasss been untouched by any who would tame it. It wasss once prized -- I can sense that. Extraordinary creature. Should you discover the beast, you may need to end itsss mortal existence. Return to me with what you learn. Be quick.");
  }
 }
}

sub EVENT_ITEM {
 if ($client->GetGlobal("beast_epic") ==2) {
  if (plugin::check_handin(\%itemcount, 57008 =>1)) {
    quest::say("Ah, well,expect rigorousss timesss. Nice to see a familiar stroke of the pen. I learned from Muada a long time ago and it wasss not easy. His tasksss are never easy. Are you familiar with these [" . quest::saylink("lands") . "]?");
	quest::setglobal("beast_epic", "3", 5, "F");
  }
 }
 if (plugin::check_handin(\%itemcount, 57996 =>1)) {
   quest::say("Greetingsss and welcome back, beastlord. I have sensed an unwieldy presence among the feral spiritsss and it threatensss to consume all in itsss path, flesh and ethereal essence both. We can't afford to lose more spiritsss to the darknesss of Discord and this beast threatensss that very thing. I'm afraid the eldersss forbid me to go asss if I am lost we lose another with a strong connection to the wild spiritsss. So, I must ask you to [" . quest::saylink("track down") . "] thisss creature in my stead.");
   quest::setglobal("beast_epic", "8", 5, "F");
 }
 if ($client->GetGlobal("beast_epic") ==8) {
  if (plugin::check_handin(\%itemcount, 57010 =>1 )) {
    quest::say("So, we have lost another. I do try to not worry about this threat, but I do not know how to stop it. Each day we feel more pain and trouble with our feral spiritsss and even our companionsss feel asss though their ferocity is becoming clouded. You must go see Elder Muada. He will want to speak with you, I have no doubt. Give him thisss letter.");  
    quest::summonitem(52900); # Item: Sealed Note for Muada
  }
 }
  plugin::return_items(\%itemcount);
  $qglobals{muadalet}=undef;
}