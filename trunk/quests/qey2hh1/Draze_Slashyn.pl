####################################
# NPC:  Draze Slashyn
# Info:  Spawned by quest, Linaya Sowlin
# Zone: qey2hh1
# Quest:  Nitrates and the Assassin
# Loot: Item id 18911 100%, random trash(rusty axe, zone random), and small cash
# Level: 5 HP: 200 Class:  Warrior
# Spawn Loc:  -3400,-8000,23
# Author:  Andrew80k
####################################
sub EVENT_SPAWN {
   quest::moveto(-7756,-3726,1);
   quest::shout("Come out of that house, Linaya Sowlin!! I am waiting! It is time for you to die!");
}
sub EVENT_DEATH {
   quest::say("Your act of murder will not go unnoticed by the Unkempt Druids or nature itself!!");
}