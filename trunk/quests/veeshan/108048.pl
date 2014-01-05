#BeginFile: Phara_Dar.pl
#Quest for Veeshan's Peak - Phara Dar: Proof for Phara Dar
sub EVENT_SPAWN {
	quest::setnexthpevent(80);
}

sub EVENT_HP {
	if($hpevent == 80) {
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
		quest::setnexthpevent(60);
	} elsif($hpevent == 60) {
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
		quest::setnexthpevent(40);
	} elsif($hpevent == 40) {
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
		quest::setnexthpevent(20);
	} elsif($hpevent == 20) {
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
		quest::spawn2(108518, 0, 0, $x, $y, $z, $h);
	}
}

sub EVENT_SAY {
	if ($text=~/hail/i) {
		quest::say("I am surprised to see such short-lived mortals here. One such as yourself would never dare to enter my sanctum before. Time's have changed. What is it that you want here amongst such greatness? I shall humor you if you aim to [help] me. There is something that I've been wanting to retrieve for a while now, ever since my father's death. What say you?");
	} elsif ($text=~/help/i) {
		quest::say("Fine. Listen well. A shroud was given by my father to my mother months before his death. That shroud is very dear to me and I wish to have it back. My mother is still in possession of this item and I fear she will not easily hand it over. To help me, you must also help her. Go speak to her and assist her to acquire the shroud for me.");
	}
}

sub EVENT_ITEM {
	if ($faction == 1) {
		if (plugin::check_handin(\%itemcount, 69316 => 1)) { #Box of Phara Dar (Full)
			quest::say("Poor Fraka, he was only a whelp. The betrayers have paid for their crime. While this has avenged the loss of my brother, it still does not take the pain away. Here is your reward for your trouble. Should you find this reward is not fitting, I can replace it with a different one. Now, please leave my sanctum. I need time alone.");
			if ($class eq "Cleric" || $class eq "Druid" || $class eq "Shaman" || $class eq "Necromancer" || $class eq "Wizard" || $class eq "Magician" || $class eq "Enchanter") { #Caster
			quest::summonitem(69390); #Earring of Phara Dar
			} elsif ($class eq "Warrior" || $class eq "Paladin" || $class eq "Ranger" || $class eq "Shadowknight" || $class eq "Monk" || $class eq "Bard" || $class eq "Rogue" || $class eq "Beastlord" || $class eq "Berserker") { #Melee/Hybrid
				quest::summonitem(69389); #Ring of the Azure Sky
			}
			quest::exp(50000);
		} elsif (plugin::check_handin(\%itemcount, 27261 => 1)) { #Shroud of the Dar Brood
			quest::say("I can hardly believe my tired eyes. You have returned the shroud! Wait, could this mean...? Is Fraka, my brother, dead? No. I cannot believe this -- it cannot be possible. And yet it has to be for you have acquired the shroud so hastily. What a sad day. Here is what I want you to do now, and you must. I want you to seek out those who assisted in this slaying of my brother and bring me proof the he is avenged. I will not rest until I see proof. Return to me only when you have the shroud and all the proof in hand. Now leave me be!");
			quest::summonitem(69315); #Box of Phara Dar (Empty)
			quest::summonitem(27261); #Shroud of the Dar Brood
		} elsif (plugin::check_handin(\%itemcount, 69390 => 1)) { #Earring of Phara Dar
			quest::say("How utterly obtuse and arrogant. How about this one then?");
			quest::summonitem(69389); #Ring of the Azure Sky
		} elsif (plugin::check_handin(\%itemcount, 69389 => 1)) { #Ring of the Azure Sky
			quest::say("How utterly obtuse and arrogant. How about this one then?");
			quest::summonitem(69390); #Earring of Phara Dar
		}
	}
	plugin::return_items(\%itemcount);
}
#END of FILE Zone:veeshan ID:108048 -- Phara_Dar.pl