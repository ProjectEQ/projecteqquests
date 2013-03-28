#############
#Quest Name: McMerrin's Feast - "Evil" Races, or any with VS faction
#Author: BWStripes
#NPC's Involved: 1
#Items involved: 4
#############
###NPC 1
#Name: The_Great_Oowomp
#Race 1 (Ogre), Texture of 1, Size 7, gender of 1
#Location XYZ: 3119.0, 5724.0, 8.1 in Timorous Deep
#Level: 40
#Type: Mob/Quest NPC
#Reward: 12941: Spell: Cannibalize II
#############
###Item 1
#Name: Clay of Ghiosk. - Comes from Army Behemoths in the City of Mist - Called Strange Ochre Clay, and identifies as "Clay of Ghiosk".
#ID: 12942
###Item 2
#Name: Crushed Diamonds (LORE: Crushed Dread Diamond)
# You can find Crushed Diamonds as a ground spawn in the Timorous Deep on the Golra island at -8850, -6040.
# Or, get a dufrenite, and head tothe Dreadlands, in the area with all the wizard spires, there is a MOB called "gem cutter skeleton". He is inside one of the pyramids (there's an entrance on the ground), and is KOS to everyone. An Enchanter, Necro, or Bard is required to charm him so that you can hail him, and he talks about sparklies. Ask him "what dread diamond," and he offers to trade a dufrenite for one. Give him a dufrenite (while he's charmed) and he gives you a "Dread Diamond" [No Drop](not crushed), and says how they are very valuable but more so in the crushed form, and that you would require high skill and a spectral pestle to crush it.
# The spectral pestles are found on spectral guardians in Kaesora and Trakanon's Teeth, and combining the dread diamond + spectral pestle to make Crushed Diamonds, which identifies as "Crushed Dread Diamonds" (trivializes at around 70 Alchemy skill, so make sure your skill is high enough - you lose the pestle, but get the diamond back).
#ID: 12945
###Item 3
#Name: Yun Shaman Powder - from Froglok Yun Shamans in Trakanon's Teeth. Black, NO TRADE.
#ID: 12944
###Item 4
#Name: Greyish Bone Chips - from Skeleton Warlords in Karnor's Castle
#ID: 12943
####


sub EVENT_SAY {
  if($text =~ /hail/i) {
    quest::emote("gestures as if casting a powerful spell...");
    quest::say("Come forward, adventurer! Come and [see the dancing skeleton]. I shall cast a powerfull spell and bring forth this operatic, clattering jumble of bones and he shall do a fine dance for you. From the nether regions and planes beyond, I call forth this bardic, magical, rhyming, tap-dancing hunk of undead!! I am Oowomp the Great!!");
  }
  if($text=~/see the dancing skeleton/i){
    quest::say("Oh!!  You wish to see the great Oowomp perform his magic!! I have studied with the grand mages and wise [McMerin clan] of Norrath. as my speech implies. I can call forth the skeleton with but a twinkling of my power and five of your gold.");
  }
  if($text=~/McMerin clan/i){
    quest::say("Clan McMerin were wise shamans from the North. They allowed me to study with them. I learned many spells while I communed with them.  From them, I sto.., I mean, I learned the secret of McMerin's Feast. If you want to know the secret, you could [help gather components] for future rituals.");
  }
  if($text=~/help gather components/i){
    quest::say("Actually... Not so much help as do - ALL - of the gathering. In the lands of Kunark are clay of Ghiosk, crushed dread diamond and powder of Yun. A rare find would be the bones of one who touched the Bath of Obulus. Find and return these to me and the shaman secret of McMerin's Feast is yours.");
  }
}

sub EVENT_ITEM {
  if($gold == 5) {
    quest::emote("flings the coins into the air and they all fall neatly into his oversized coin pouch. <Tink, tink, tink, tink, TINK!!>");
    quest::say("Gaze upon my awsome powers of the arcane!! You, a simple $race, shall see my power. Allakabam!!");
    quest::spawn2("96088","0","0","3122.8","5725.2","7.9","13.0");
    quest::settimer(1,3);
  }
  elsif (plugin::check_handin(\%itemcount, 12942=>1, 12945 => 1, 12944 => 1, 12943 =>1)){
    quest::say("Ahh, you've gathered all the ritual components. Very good, as promised, a cop...I mean, priceless scroll of McMerin's Feast for you!");
    quest::summonitem(12941);
    quest::exp(45000);
  }
  plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  if ($timer == 1) {
    quest::signalwith(96088,5,0);
    quest::stoptimer(1);
  }
}

#END of FILE Zone:timorous  ID:2030 -- The_Great_Oowomp
