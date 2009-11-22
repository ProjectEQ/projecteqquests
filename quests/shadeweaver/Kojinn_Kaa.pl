#Kojinn_Kaa.pl
#Champion of the Vah Shir

sub EVENT_SAY { 
	if($text=~/Hail/i){
		quest::emote("waits patiently for a hero to emerge, one that will deliver a crippling blow to those that would hunt the cats of these lands. His eyes look deep to your soul as if to ask, 'Is this the hero I await?' ");
	}
	
	if ($text=~/hero/i) {
		quest::say("Many have come before me and made such claims. Your fervor is appreciated, but I require proof that you are a hero whose heart is with us before I can entrust you with such a sacred mission. Have you something to show that you have earned our trust?");
	}
	
}

sub EVENT_ITEM {
	if(plugin::check_handin(\%itemcount, 30854 => 1)){#Hero's Shroud
		quest::say("You have proven yourself a hero of our cause, and so I entrust you with this information: the poachers have set up an outpost in the caves on the outskirts of the thicket. Go and wreak havoc upon this deplorable filth that has mistreated our friends. As a badge of the honor you have earned, construct a champion's robe and have the High Priestess Bast bless it for you. The ceremony will require three drops of the blood of those who would bring harm to the felidae. It will be the High Priestess's honor to receive you.");
		quest::summonitem(30854);#Hero's Shroud, giving it back
		quest::summonitem(30855);#Champion Cape Pattern
		quest::faction(132, 10);#Guardians of Shar Vahl faction
	}
  	
	else {
		quest::say("I don't need this.");#text made up
		plugin::return_items(\%itemcount);
	}

}#END of FILE Zone:shadeweaver  ID:165133--Kojinn_Kaa.pl