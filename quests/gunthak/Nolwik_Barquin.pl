#Nolwik_Barquin.pl
#Started by Angelox, finished by Kilelen
#Healing Waters

sub EVENT_SAY { 
	if ($text=~/Hail/i){
		if ($class eq "Druid"){
			quest::say("The salty air grows stale in this place. As if the essence of Tunare and Karana have been shut out by the dark tide of Broken Skull. The wind of Karana grows wild and restless, and the water of the mother turns black as it touches the tainted stone of Innoruuk. Were it not for my [promise] to Xanuusus I would not be here.");
		}
		else{
			quest::emote("glances up at you. 'Hello, $name.  I'm in no mood to talk, please leave me in peace.'  Nolwik turns and looks out across the water seemingly looking or perhaps listening for something.");
		}
	}
	if ($text=~/promise/i){
		quest::say("Since I was a boy, Xanuusus has entrusted me with a pair of holy symbols, one of Karana, and one of Tunare. I guarded them faithfully since that day until recently. I had been patrolling Innothule swamp in hopes of finding the wayward trolls that had been disturbing those of Tunare's children that inhabit the wetlands. Unknown to me at the time, a new [presence] was there in the swamp that day.");
	}
	if ($text=~/presence/i){
		quest::say("I had just found a troll threatening a water moccasin a fair distance from the gates of Grobb. The troll looked to be dressed a bit differently then most of the other trolls I'd found recently. He had a patch over one eye, and his armor appeared to be of much higher quality then anything the Bashers normally carried. I paid it no heed though, and continued planning my [attack] on the unsuspecting troll.");
	}
	if ($text=~/attack/i){
		quest::say("Just as I was beginning to weave my first spell against the troll, a large wet figure struck me by surprise knocking me to the ground. I staggered to my feet and looked at my attacker. It was a larger then normal troll holding a rather large curved sword and shield. It scowled at me with a sort of enraged hunger as it licked its lips in apparent anticipation of a fresh [meal].");
	}
	if ($text=~/meal/i){
		quest::say("As fate would have it the troll would go hungry that night. Although I was badly injured from his initial strike, I was able to stand and weave the roots of the nearby trees around his feet which allowed me time to gate away before more of his friends arrived. It wasn't until I arrived in the plains of Karana that I realized that I had lost my holy [emblems].");
	}
	if ($text=~/emblems/i){
		quest::say("I highly doubt that the trolls know the importance of the symbols they have stolen from me, but I am sure they at least recognize the value of the metal they were forged from. I suspect that they have tossed them in with the rest of their treasure as if they were nothing more then gold coins. I must get them back at all costs.");
	}
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 59061 => 1, 59062 => 1)) {#A Golden Emblem (Tunare), A Golden Emblem(Karana)
    quest::emote("gasps as you hand him the two symbols. 'I am in your debt, $name. There is nothing I can ever do to repay you, but I can at least teach you of the healing water that Tunare has shown me how to control. Take this scroll, I pray to Tunare that it will serve you well.' ");
    quest::summonitem(59014);#Spell: Healing Water
  }
  plugin::return_items(\%itemcount);
}#Done