sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Welcome! We are the Soldiers of Tunare, the sworn protectors of Faydark. Through the magic of Tunare we care for the land and with blade, staff and spell we protect the Faydark against those who would destroy and despoil it. We are always grateful for any assistance to our cause. Perhaps you could help me with some simple [errands]."); }
if ($text=~/errands/i){quest::say("As druids of the Mother of All, we may only use the scimitar and blunt weapons, all other blades are forbidden. Prove your devotion by bringing me a rusty [short sword], [long sword], [broad sword] and [bastard sword]. I will destroy them and reward you for your faith. They will be reforged into weapons blessed by Tunare to assist the Soldiers in their defence of the Heartwood."); }
}
sub EVENT_ITEM { 
if ($item1=="18786"){quest::say("Welcome! We are the Soldiers of Tunare, the sworn protectors of Faydark. I thank you for joining our cause, we can always use the help. Here, put on this tunic, and let's get started.. you have much to learn. ");
quest::summonitem("13537");
quest::exp("100"); }
if ($itemcount{5013} == 1 && $itemcount{5016} == 1 && $itemcount{5019} == 1 && $itemcount{5022} == 1) {
	quest::say("You have done well, child! Take this as a blessing from Tunare for doing her will.");
	quest::summonitem("5047");
	quest::givecash("0,0,6,0");
	quest::exp("750"); }
}
#END of FILE Zone:gfaydark  ID:54083 -- Heartwood_Master 

