#############
#Quest Name: McMerin's Feast - "Good" Races, or any with FV faction
#Author: BWStripes
#NPC's Involved: 1
#Items involved: 4
#############
###NPC 1
#Name: Marlyn McMerin
#Race 1 (Barbarian), Texture of 1, Size 7, gender of 1
#Location XYZ: 1669.0, -3813.0, -102.379997 in Firiona vie
#Level: 40
#Type: Merchant
#Reward:
# 12941: Spell: Cannibalize II
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
###

# Quest for Spell: Cannibalize II - good version - most of the text is improvised as unavailable.
#

sub EVENT_SAY {
  if($text =~ /hail/i) {
    quest::say("Greetings hearty adventurer. Searching for the components necessary for fine shaman spells are we? I have come to Kunark in search of [rare alchemy components], but I have found the dangers of Kunark are far too great for me.");
  }
  if($text=~/rare alchemy components/i){
    quest::say("Grand!! I have heard word of [four rare components]. Collect them for me and I will share with you a rare scroll of [McMerin's Feast].");
  }
  if($text=~/McMerins Feast/i){
    quest::say("Clan McMerin are wise shamans from the North. The secret of McMerin's Feast won't be understandable unless you're a shaman, but you can always pass it on to one.");
  }
  if($text=~/McMerin's Feast/i){
    quest::say("Clan McMerin are wise shamans from the North. The secret of McMerin's Feast won't be understandable unless you're a shaman, but you can always pass it on to one.");
  }
  if($text=~/four rare components/i){
    quest::say("From the lands of Kunark we require some clay of Ghiosk, crushed dread diamond and some powder of a Yun shaman. The rarest component is the bones of one who touched the Bath of Obulus. Find these things, return them to me and the secret of [McMerin's Feast] is yours.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 12942=>1, 12945 => 1, 12944 => 1, 12943 =>1)){
    quest::say("What's this? This is amazing - you collected them all! To think, the power that these items hold if properly used. Never mind that now, here, take the scroll. You've certainly earned it.");
    quest::exp(45000);
    quest::summonitem(12941);
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:firiona - Marylyn_McMarin