sub EVENT_SAY {
 if($text =~ /Hail, Collier/i) {
	quest::say("Make it a habit of walking into peoples rooms now do ya? Well seeing as I'm here on business I may have a [proposition] for you.");
 }
 if($text =~ /What is the proposition/i) {
	quest::say("I'm in the employment of an alchemist that desires some rare venom from this region of Norrath. I will reward you with a special weapon treatment if you can return to me with a venomous spikefish poison sac, an ancient poison sac, an ancient snake fang, and the blood of a necromancer.");
 }
 if($text =~ /What special weapon treatment/i) {
	quest::say("My employer has uncovered the secrets of the Bloodclaw and can reproduce the weapon treatment used in the forging of the legendary Stiletto of the Bloodclaw.");
 }
}
sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 31828 => 1, 22570 => 1, 6949 => 1, 6950 => 1)) {
    quest::say("There is the weapon treatment I promised you. Use it in a forge with either a Long Sword or a Scimitar. Choose which weapon you prefer carefully as there is only enough of the substance for a single treatment.");
    quest::summonitem(22571);
    quest::exp(100);
  }
  plugin::return_items(\%itemcount);
}