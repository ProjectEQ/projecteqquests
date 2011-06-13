sub EVENT_SPAWN {
quest::set_proximity($x-20,$x+20,$y-20,$y+20);
}
sub EVENT_ENTER {
quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),1,0,-223,-173,-20,0);
quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),1,0,-229,-172,-20,0);
quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),1,0,-217,-176,-20,0);
quest::spawn2(quest::ChooseRandom(292029,292005,292030,292001,292006,292002),1,0,-223,-198,-20,0);
quest::ze(15,"A voice rings out, echoing among the dusty halls, Trespassers have found a way into the temple! Stop them before they get any further!");
quest::ze(15,"Up ahead, you sense the frenzied activity of the Trusik as word of your presence spreads. They double their efforts to complete their ritual, calling for the assistance of the ancient god of this forgotten temple. You must move quickly as they now grow stronger by the minute.");
$npc->Damage($npc,1000,732,24,0);  #death via damage instead of depop causes respawn timer to function
}
