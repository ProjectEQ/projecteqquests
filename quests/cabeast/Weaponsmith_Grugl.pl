sub EVENT_SAY {
if ($text=~/hail/i) {
  quest::say("Come to assist in the testing of the bashing equipment? Nah. Not you. You are too small. You must be here to practice your forging.");
}
 if ($text=~/footmans pike/i) {
   quest::say("To forge a footman pike requires skill as well as an iron rod, forging hammer and a footman pike head. To forge the pike head you will need a geozite tool, raw pike head and petrified redwood if the footman pike head plans are yours.");
 } 
 if ($text=~/soldier pike/i) {
   quest::say("To forge a soldier pike requires skill, not to mention an iron rod, a forging hammer plus a soldier pike head. To forge the pike head, you will need a geozite tool, raw pike head and frontier fools gold as well as the soldier pike head plans.");
 }
 if ($text=~/trooper pike/i) {
   quest::say("To forge a trooper pike requires much skill! You also need an iron rod, forging hammer plus a trooper pike head. To forge the pike head, you will need the trooper pike head plans, a geozite tool, raw pike head and a radiant meteorite.");
 }
 if ($text=~/legionnaire mancatcher/i) {
   quest::say("To forge a legionnaire mancatcher, a blacksmith of great skill would need the steel rod, forge hammer and the forged legionnaire mancatcher crown. That crown is forged with the geozite tool, legionnaire crown plans, a raw crown and a peridot.");
 }
 if ($text=~/champions mancatcher/i) {
   quest::say("To forge a Champion mancatcher a blacksmith of great skill would need a steel rod, a forge hammer, and a forged Champion mancatcher crown. That crown is forged with a geozite tool, crown plans, a raw crown, and an opal.");
 }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}