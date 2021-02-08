# items: 12157, 2116, 2118, 2120, 2123, 2124, 12158
sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Welcome, $name. The Cathedral of Underfoot welcomes all good persons. May you find peace from the dangers of Butcherblock within these walls. The paladins of this holy place are very much aware of the evils outside Kaladim. The threat of goblins and [birdmen] has increased.");
  }
  elsif($text=~/birdmen/i) {
    quest::say("The birdmen I speak of are the aviak krags. These vile creatures have desecrated our land. They have dared to perch upon our great statue. The king has instructed all noble paladins in this order to [destroy the krag chicks].");
  }
  elsif($text=~/destroy the krag chicks/i) {
    if ($faction <= 4) {
       quest::say("Yes. You are known to have aided our cause. You shall continue by returning any aviak chick talons to me. I will reward you for the return of no fewer than four at a time. Go, and serve the will of the king!");
    }
    else {
       quest::say("The Clerics of Underfoot have yet to see your faith directed towards our wills. Perhaps you should assist Master Gunlok Jure in the crusade against the undead.");
    }  
  }
  elsif ($text=~/elders/i) {
    if ($faction <= 4) {
      quest::say("The krag elders are the strongest of the aviaks. Their might has been well-documented by our order. Our high ranking paladins are ordered to slay the eagles. If you are with us, return four aviak talons to me and a fine reward shall be yours. Perhaps even our cathedral tailors and scribes may donate to your quest.");
    }
    else {
      quest::say("The Clerics of Underfoot have yet to see your faith directed towards our wills. Perhaps you should assist Master Gunlok Jure in the crusade against the undead.");
    }
  }
}

sub EVENT_ITEM {
   if (($faction <= 4) && (plugin::check_handin(\%itemcount, 12157 => 4))) {
      quest::say("You have done well. Your deeds shall be recorded within our journals. Here, then, is your reward. May you strive to serve us to the full extent of your powers. The [elders] must also die.");
      quest::faction(227, 20);  #Clerics Of Underfoot
      quest::faction(274, 20); #Kazon Stormhammer
      quest::faction(293, 20); #Miner's Guild 249
      quest::exp(5000);
      quest::summonitem(quest::ChooseRandom(2116,2118,2120,2123,2124)); # Item(s): Small Patchwork Tunic (2116), Small Patchwork Cloak (2118), Small Patchwork Sleeves (2120), Small Patchwork Pants (2123), Small Patchwork Boots (2124)
      quest::ding();
   }
   elsif (($faction <= 4) && (plugin::check_handin(\%itemcount, 12158 => 4))) {
      quest::say("Ahh! you are truly brave, $name!");
      quest::faction(227, 40);  #Clerics Of Underfoot
      quest::faction(274, 40); #Kazon Stormhammer
      quest::faction(293, 40); #Miner's Guild 249
      quest::exp(80000);
      quest::givecash(0,4,5,2);
      quest::ding();
   }
   #do all other handins first with plugin, then let it do disciplines
   plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
   plugin::return_items(\%itemcount);
}

#END of FILE Zone:kaladimb  ID:67026 -- Bumle_Reminjar
