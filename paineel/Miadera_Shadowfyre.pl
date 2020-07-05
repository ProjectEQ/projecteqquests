#BeginFile paineel\Miadera_Shadowfyre.pl
#Quest for Paineel - Miadera Shadowfyre: Terror Forged Mask
#
#Status: Incomplete
#Issue2: Get correct text
#
# items: 10523, 19032, 14110, 14109, 14106

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Ahhhahahaha! The terror that lays over this city like a blanket tingles my bones with vigor. I seek a fellow apostle of Cazic-Thule to assist me in the [summoning of Terror].");
  }
  if($text=~/summoning of terror/i) {
    quest::say("It will be a frightfully fulfilling summons. To do this, I need an eye of urd, some basalt drake scales, the lens of Lord Soptyvr, and a lock of widowmistress hair.");
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 10523 => 1, 19032 => 1, 14110 => 1, 14109 => 1)) { #Eye of Urd, Basalt Drake Scales, Lens of Lord Soptyvr, Widowmistress Hair
    quest::say("Yes, this is what I require to summon Terror!"); #Text made up
    quest::emote("begins speaking an incantation. 'Take this mask as your reward for helping me.'");
    quest::summonitem(14106); #Mundane Mask
#    quest::spawn2(?????); #Avatar of Terror
  }
  plugin::returnitems(\%itemcount);
}
#END of FILE Zone:paineel  ID:75070 -- Miadera_Shadowfyre