sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the Temple of Life. where the will of Rodcet Nife, the Prime Healer, is carried out.  I am the High Priestess Jahnda.  If you require any training in our ways. please talk to any of our priests or any of the paladins of the Temple of Life.");
}
if($text=~/Brother Estle needs the blessed oil/i)
{
quest::say("I do not distribute the blessed oil of life. Please speak with Nomsoe Jusagta. Tell Nomsoe that Brother Estle needs the blessed oil.");
}
if($text=~/hayle mool/i)
{
quest::say("Brother Hayle Mool is one of our finest clerics. He could convert anyone to the ways of Rodcet Nife. Recently, he has been out in the [Plains of Karana] trying to befriend the [Splitpaw clan]. I pray he has not become their prisoner or even worse, their dinner.");
}

}
sub EVENT_ITEM { 
	if($item1 == "18714"){
		quest::say("Welcome to the Temple of Life. I am Jahnda. the High Priestess of the Clerics of Nife. Wear this tunic with pride and carry out the will of Nife. Please. see Tonmerk Plorsin or Nomsoe Jusagta. They will help get you started spreading the will of The Prime Healer.");
		quest::summonitem("13506");
		quest::exp("100");
	}
	 if($itemcount{13911} == 1)
  {
   quest::say("Oh my word!! This is terrible news. This belongs to Hayle Mool. He has been captured by the Splitpaw Clan while in Karana. You must go to his aid. We cannot do so at this time. Here. Be sure to hand him this summons. I will need to speak with him.");
   quest::summonitem(18927);
  }

}
#END of FILE Zone:qeynos2  ID:2069 -- Priestess_Jahnda 

