sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Be careful around here. $name. Injured broodlings are no use to anyone. Many of these structures are yet unstable and could fall at any time. If you're a mystic, I can teach you how to [protect] yourself.");
  }
  if($text=~/protect/i) {
    quest::say("Yes indeed. As a broodling, you will need some protection to avoid any... unfortunate accidents. Should you wish, I can fashion some [armor] for you from some basic components. Provided you risk your life gathering them for me first.");
  }
  if($text=~/armor/i) {
    quest::say("Armor, indeed. I can fashion protection for your [chest], [hands], [legs], or [head].");
  }
  if($text=~/chest/i) {
    quest::say("To make a breastplate for you, you will have to bring me some banded mail, a star ruby, some watchman's spectacles, and some nectar of isolation. Now hurry back.");
  }
  if($text=~/hands/i) {
    quest::say("For gauntlets, I will need some banded gauntlets, a ruby, some venomous parchment, and a warlord drawing pen.");
  }
  if($text=~/legs/i) {
    quest::say("If you want to protect your legs with some greaves, then bring me some banded leggings, a fire emerald, a sarnak recruitment letter, and an exiled iksar head.");
  }
  if($text=~/head/i) {
    quest::say("For a helment, bring me a banded helm, a sapphire, Bargynn's Digger, and Sythrax building plans.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 3056 => 1, 10032 => 1, 14777 => 1, 14778 => 1)) {
    quest::say("Ah. Very good. Take this breastplate for your own good.");
    quest::summonitem(4989); #scaled mystic breastplate
    quest::exp(2000);
    quest::faction(282,10);
    quest::faction(193,5);
    quest::faction(30,5);
    quest::ding();
  }
  if(plugin::check_handin(\%itemcount, 3062 => 1, 10035 => 1, 14773 => 1, 14774 => 1)) {
    quest::say("Hmmm? Oh. Your gauntlets. Yes. Here you are. Now be careful.");
    quest::summonitem(4985); #scaled mystic gauntlets
    quest::exp(1000);
    quest::faction(282,10);
    quest::faction(193,5);
    quest::faction(30,5);
    quest::ding();
  }
  if(plugin::check_handin(\%itemcount, 3063 => 1, 10033 => 1, 14775 => 1, 14776 => 1)) {
    quest::say("Ahhh yes. These will protect your legs from the threat of tables.");
    quest::summonitem(4987); #scaled mystic greaves
    quest::exp(1000);
    quest::faction(282,10);
    quest::faction(193,5);
    quest::faction(30,5);
    quest::ding();
  }
  if(plugin::check_handin(\%itemcount, 3053 => 1, 10034 => 1, 14771 => 1, 14772 => 1)) {
    quest::say("Take this helment and keep your head down when you leave. The door is a little low.");
    quest::summonitem(4990); #scaled mystic helm
    quest::exp(1000);
    quest::faction(282,10);
    quest::faction(193,5);
    quest::faction(30,5);
    quest::ding();
  }
}
#END of FILE Zone:cabeast  ID:5756 -- Shezlie_Furscale 

