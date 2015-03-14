# Discord Progression: Access to Txevu
# Created by Gonner

sub EVENT_SAY {
	if ($text=~/hail/i) {
		if (plugin::check_hasitem($client, 60253) && plugin::check_hasitem($client, 60252) && plugin::check_hasitem($client, 60176)) { # Splinter of the High Temple, Fragment of the High Temple, Sliver of the High Temple
			quest::say("I've been expecting you. You have all three pieces to complete the mystery of Txevu. Give them to me and I will use what geomantic knowledge I have to form them into a totem of stone that will carry the trusik essence.");
		} elsif (plugin::check_hasitem($client, 60253) || plugin::check_hasitem($client, 60252) || plugin::check_hasitem($client, 60176)) {
			quest::say("Hello. I see you've been busy. I've heard of your exploits from the scouts in the mountains and it seems you're close to uncovering the mystery of Txevu. Return to me when you have more information");
		} else {
			quest::say("Greetings. I'd love to chat but I must get back to my studies. I've been learning as much as I can about geomancy and its uses. Good day.");
		}
	}
}

sub EVENT_ITEM {
	if (plugin::check_handin(\%itemcount, 60252 => 1, 60176 => 1, 60253 => 1)) { # Splinter of the High Temple, Fragment of the High Temple, Sliver of the High Temple
		quest::emote("takes the three stone pieces from you and wraps them in a soft hide covered with glyphs. He mutters some strange words and the stones begin to glow and undulate beneath the hide. You see a wind of souls swirl around you and become absorbed in the stone.");
		quest::say("The essence of the trusik has been imbued into this stone. With one touch of this totem, the guardian of Txevu will recognize the spirit of its masters and let you pass.");
		quest::summonitem(60254); # Cipher of Txevu
		quest::setglobal("god_txevu_access",1,5,"F");
	}
	plugin::return_items(\%itemcount);
}
#END of FILE zone:abysmal ID:279009 -- Brevik_Kalaner.pl