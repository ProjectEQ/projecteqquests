sub EVENT_SAY { 
if($text=~/Hail/i){quest::say("I hope you have a good reason for disturbing my contemplations. Perhaps you [seek the knowledge] of those who meditate within this Temple of Fear?"); }
if($text=~/assist/i){quest::say("In order to summon the avatar of Fright. I require some special components for the ritual. Fetch me the flesh of a zombie. the dust used in the process of mummification. [charred bone chips]. and a [vial of Tunare's Breath]."); }
if($text=~/chips/i){quest::say("Some time ago a necromancer by the name of Obretl was sent to slay Rathmana Allin and his abomination of an adopted son. Ortallius. Obretl failed in his task and now haunts a small ruin in the desert of Ro cursed by Solusek to wallow in his failure in the form of a burning skeleton. Slay Obretl to free him from his pathetic existence and gather his charred remains."); }
if($text=~/vial/i){quest::say("Tunare's Breath is a life-giving potion created by the Fier'Dal Soldiers of Tunare. Seek out the druid Kalayia who is known to wander the Faydarks in search of reagents for potions. Procure from her a vial of Tunare's Breath. Shed her blood if need be."); }
}
sub EVENT_ITEM { 
	if ($item1=="18019"){quest::say("You are welcomed into the fold. Now go out. and prove yourself. young one. You have much to learn about the Dark Truth.");
quest::summonitem("13573");
quest::exp("100"); }
}
#END of FILE Zone:paineel  ID:75072 -- Sern_Adolia 

