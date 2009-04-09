sub EVENT_SAY { 
if ($text=~/Hail/i){quest::say("Welcome $name . This is the Temple of Marr and you must be another seeker of Passion and Valor. That is good. Become one with us and help us to defeat the [fallen knight]. It is he who has caused the demise of this city."); }
if ($text=~/knight/i){quest::say("The fallen knight I speak of is none other than Sir Lucan D'Lere. The self proclaimed ruler of this city. He is no ruler and he never was no true Knight of Truth. If it were not for the [Crusade of Tears] this city would still be united in valour."); }
if ($text=~/crusade/i){quest::say("In the year of thirty one hundred fifty. the Knights of Truth were called upon by the twin gods Erollisi and Mithaniel Marr. They instructed us to go forth across the Ocean of Tears and across the lands of Faydwer and purge the lands of the undead. It was during this crusade Freeport was left in the care of Sir Lucan D'Lere. How unfortunate."); }
}
sub EVENT_ITEM { 
	if ($item1=="18735"){quest::say("Thanks.");
quest::summonitem("13556");
quest::exp("100"); }
}
#END of FILE Zone:freportn  ID:8046 -- Tholius_Quey 

