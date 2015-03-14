##Hunter_Gitog.pl
#Gitog's Goblin Heads

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::emote("growls as you approach. 'Do not attack. I wish to speak with you.' Gitog leans forward and sniffs the air. 'Yes you are powerful. [Help] me, and I will help you.'");
  }
  if($text=~/help/i) {
    quest::emote("'s lips curl into a snarl. 'I do not normally associate with outsiders, but we have a problem and you seem strong enough to assist us. Our hunting grounds have recently been overtaken by a dangerous group of [fire goblins]. These are no ordinary fire goblins however.'");
  }
  if($text=~/fire goblins/i) {
    quest::say("They were once members of the Taklasinai fire goblin tribe that lair further within the caverns. However they fed upon the flesh of the spiders that live in the caves. The spider flesh is poisonous. It burns the brain causing madness and rage. These fire goblins are out of control. They attack any who venture near them. They have recently attacked several members of our tribe in our hunting grounds. If you [assist] us in stopping them, you will be rewarded.");
  }
  if($text=~/assist/i) {
    quest::say("I will reward you for every four brain-scorched goblin heads you bring to me.");
  }
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 55252 => 4)) {#Brain-Scorched Goblin Heads
    quest::say("These will be no more threat.  Take this, $name.");#text made up
    quest::exp(1750000);#1% of Level 51 xp
    quest::summonitem(55240);#Enchanted Lava Spider Blood
    quest::faction(341, 10);#Tribe Vrodak
    quest::faction(120, -30);#Goblins of Fire Peak
  }
  plugin::return_items(\%itemcount);
}#Done