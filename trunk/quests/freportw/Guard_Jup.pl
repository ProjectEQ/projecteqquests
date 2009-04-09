sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hail, Citizen. In this time of piracy on the high seas, your [duty] is clear, is it not?");
  }
  if ($text=~/duty/i) {
    quest::say("What duty? To your state and your fellow man, that is what duty! These attacks must be stopped, before all order is lost and the city falls to [vermin]! We must strike them down first, with strength and determination; this could get out of hand.");
  }
  
  if ($text=~/vermin/i) {
    quest::say("The pirates of Broken Skull Rock are uncouth and relentless. They take whatever they may want, ruining trade lines without regard to the might of such established cities as Freeport. The rotten thieves are all thrown and mixed together in filthy shantytowns from what I hear, so striking at their heart should not be terribly difficult. Your [mission] is clear.");
  }
  if ($text=~/mission/i) {
    quest::say("Go to Broken Skull Rock! Slay these impudent pirates and wreak havoc on their plans. Some of them carry a seal that grants passage about their society, bring me ten of these such seals and your duty to your city shall be fulfilled. We might even have some form of [reward] for you.");
  }
  if ($text=~/reward/i) {
    quest::say("First the seals, then the reward! Take this to transport them in.");
    quest::summonitem(17174);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 54010 =>1 )) {
    quest::say("Excellent work, $name!  This will teach the pirates of Broken Skull a lesson and help our cause in repelling them.  Here is your reward.");
    quest::summonitem(54024);
    quest::exp(10000);
    quest::ding();
  }
  plugin::return_items(\%itemcount);
}