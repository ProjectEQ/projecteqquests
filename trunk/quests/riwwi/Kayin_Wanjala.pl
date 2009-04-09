# Help Kayin Escape

# Created by Gonner


sub EVENT_SAY {

if($text=~/hail/i){
	quest::say("Why can't I keep a lid on this temper of mine? It's always getting me into [trouble]!");
	}

if($text=~/trouble/i){
	quest::say("Yeah, big trouble. There I was, minding my own business, working on my section of the Hanging Gardens when this big lug comes over and tells me to work faster. I was already working my hands raw, so I ignored him. Next thing I know, he's whipping me! I'd had enough. I turned around and let him have it with a big [punch] right in the face.");
	}

if($text=~/punch/i){
	quest::say("By all rights, that punch should have knocked him flat and I should have been sprinting for freedom.' Kayin sighs. 'Unfortunately, my best effort was met with derisive laughter and I was thrown over the beast's shoulder. Not the most comfortable of [situations], let me tell you."); 
	}

if($text=~/situations/i){
	quest::say("I was passed from guard to guard for a while before being dumped into this cage that I've been standing in ever since. I know I'm destined to be fed to some ravenous beast for their entertainment. When the time comes, I'll fight as best I can, but I haven't seen any slaves come back from the games alive so I don't think my chances are very good. I'd [escape] from here if I could.");
	}

if($text=~/escape/i){
	quest::say("I don't really want to be eaten by animals, but the guard who put me here, Ra`Tuk Hrux Vekxit, has threatened to kill a good friend of mine if I try to escape. I'd rather die than have my friend be killed because of me. Hrm, maybe you can [help me].");
	}

if($text=~/help you/i){
	quest::say("You look like you've got some strength in you. If you can kill Ra`Tuk Hrux Vexkit and bring me proof of his death, it will be safe for me to escape. I hear he can be found in the yards outside the coliseum most of the time. You'll have to hurry, though. I think they're running low on slaves for the games.");
	}

}

sub EVENT_ITEM {
if(plugin::check_handin(\%itemcount, 64014 => 1)) {  # Head of Ra'Tuk Hrux Vexkit V1
	quest::say("Hah! What an ugly mug on this one! Thank you, friend. I can slip out of here now and know that my friend is still relatively safe. Here, you keep the head. Maybe you can show it to my friend Njanu Dinari back in Barindu and tell him the story. I'm sure he's worried about me and it might ease his mind a bit.");
	quest::faction(363,5); # Yunjo Slave Resistance
	quest::faction(416,-5); # Gladiators of Mata Muram
	quest::summonitem(64015); # Head of Ra'Tuk Hrux Vexkit V2
	quest::exp(300000);
	}
}

#END of FILE zone:riwwi ID:282044 -- Kayin_Wanjala.pl


