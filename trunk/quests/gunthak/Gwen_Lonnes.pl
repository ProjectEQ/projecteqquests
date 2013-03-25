#Gwen_Lonnes.pl
#Started by Angelox, finished by Kilelen
#Relics of the Luggalds

sub EVENT_SAY { 
	if ($text=~/Hail/i){
		if (($class eq "Monk") || ($class eq "Rogue") || ($class eq "Warrior") || ($class eq "Berserker")){
			quest::emote("swirls her leg around and nearly takes your head off with a powerful roundhouse kick. Apparently she doesn't like to be surprised while practicing her forms. 'What is it whelp, I have little time to waste speaking to weaklings. I must be in top form if I am to do battle with the pirates of Broken Skull, not to mention their fishy friends the [Luggalds].' She then turns back to her forms.");
		}
		else{
			quest::emote("glances at you for a moment, then sneers and turns back around. 'Go away whelp, before I decide to use you for a sparring dummy.'");
		}
	}
	if ($text=~/Luggalds/i){
		quest::emote("whips her arm around and slashes it towards your face. It stops a mere inch squarely in front of your nose. 'You obviously just got off the boat, $name. Anyone who's been here more then a day knows about the Luggalds. Rumors say they are the new children of Innoruuk, created to serve their dark master in the aqueous lands of Norrath. Even now they sit in their caves deep within Broken Skull, weaving their magics and making plans to gather more relics of the old age. Few have seen what lies under their dark robes and lived to tell about it. Indeed the [robes] seem to have some sort of dark enchantment on them.'");
	}
	if ($text=~/robes/i){
		quest::say("The dark cloth that the Luggalds wear is made with some manner of enchantment. It allows them much of the same protection that normally requires heavy armor. I hope to take a robe from one of them and possibly use it against them, but they are very cunning and have so far eluded me on my journeys on to the island. So far the only thing I've discovered that will cut though this odd fabric is glass. If I had some sections of robe and a glass shard, I might be able to fashion the robe into something quite useful.");
	}
	if ($text=~/other things/i && defined($qglobals{GwenLonnesA}) && ($qglobals{GwenLonnesA} == 1)) {
		quest::say("The Broken Skull clan has long used a special type of ink in their tattooing which is said to give them power in combat. I am curious to study the qualities of this ink. I have also seen several of the Shaman carry dark ore stones from time to time. I suspect that I may be able to tie the ink to the stone and hang it from that necklace I gave you to create a powerful amulet. Bring me a stone, ink and your dark cord and we shall see if the rumor of their power is true.");
	}
}
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 59056 => 1, 59055 => 1)) {#A Sharp Glass Shard, A Torn Luggald Robe
    quest::emote("stops her practice cold as you show her the torn robe. She seems to be fairly impressed, but her words convey a different message. 'Where did you get this? You're trying to tell me you took it from a Luggald yourself? What, did you find one on a rotting corpse somewhere? Bah, whatever the method it is still somewhat useful. Not exactly a prime specimen, but it will do.' She takes the glass shard and begins to cut long sections of fabric from the robe. She takes several strands and begins to weave them into a sort of braid. She hands it to you when she's made a sizeable length of cord.");
    quest::say("Here, place this around your neck and it should offer you some small bit of protection. As long as you're interested in scavenging, you might try to find a few [other things] for me as well.");
    quest::summonitem(59057);#Dark Cord of Broken Skull
    quest::exp(1750000);#1% of level 51 xp
    quest::setglobal("GwenLonnesA",1,0,"F");
  }	
  elsif(plugin::check_handin(\%itemcount, 59058 => 1, 59059 => 1) && defined($qglobals{GwenLonnesA}) && ($qglobals{GwenLonnesA} == 1)){ #A Jar of Broken Skull Clan Ink, A Dark Ore Amulet
    quest::emote("takes the stone from you and dips her finger in the jar of ink. She then begins to mark runes all across the surface of the stone. She then takes the stone and hangs it from your dark cord and hands it back to you. 'I find it hard to believe you managed to do this $name, but I have kept my promise. I have either vastly overestimated the Luggalds or I have considerably understestimated you.'");
    quest::summonitem(59060);#Amulet of Dark Waters
    quest::exp(1750000);#1% of level 51 xp
    quest::delglobal("GwenLonnesA");
  }	
  plugin::return_items(\%itemcount);
}#Done