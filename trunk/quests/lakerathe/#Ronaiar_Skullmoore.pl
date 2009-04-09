#BeginFile: lakerathe\#Ronaiar_Skullmoore.pl
#Quest file for Lake Rathetear - Ronaiar Skullmoore: Necromancer Epic 1.5 (pre)

sub EVENT_SAY {
  if($text=~/hail/i) {
    if($NecroPre==1) {
      quest::say("So you have come to stop me?");
      quest::emote(" throws a magnificent, yet evil looking staff into the water.");
      quest::say("The precious staff you seek is now lost in the lake for all eternity!");
      quest::attack($name);
    }
    else {
      quest::say("Hello, $name."); #Real text still needed
    }
  }
}

sub EVENT_ITEM {
  quest::say("I have no use for this, $name.");
  plugin::return_items(\%itemcount);
}

sub EVENT_DEATH {
  quest::spawn2(51156,0,0,1005,3000,0,-227); #Worboli
}

#EndFile: lakerathe\#Ronaiar_Skullmoore.pl (51155)