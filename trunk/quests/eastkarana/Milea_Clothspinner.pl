sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Hail, fellow adventurer. Are you from Qeynos?"); }
}
sub EVENT_DEATH { #Guard Elias to attack Milea after 30s
quest::summonitem("13302");
}
sub EVENT_ITEM { 
if ($itemcount{18801} == 1 ){	
quest::say("My sister is in danger. She is all the family I have left. I shall be on my way soon. Please take her my handkerchief, so she knows you have contacted me. Thank you. I am thankful Nerissa ran into you. I just wonder why she did not tell Kane about her suspicions.");
quest::summonitem("13302");
quest::faction("10103","1");
quest::faction("10101","1");
quest::faction("10102","-1");
quest::faction("10111","-1");
quest::faction("10112","1");
quest::exp("200"); }

if ($itemcount{26644} == 1 ){#Nonexistent 'sealed letter', filename='LoveToMilea'
quest::say("Oh great!! I thought I saw that last of Plagus, or as all the women in the Steel Warriors called him, The Plague. Please do not tell him where I am. It must have been a long journey for you. Here. A little something for your wasted trip. I found it on the ground. Have fun going back to Freeport.");
my @items = (3040,5231);
quest::summonitem("$items[int(rand($#items+1))]");
quest::faction("10103","1");
quest::faction("10101","1");
quest::faction("10102","-1");
quest::faction("10111","-1");
quest::faction("10112","1");
quest::exp("200"); }
}
#END of FILE Zone:eastkarana  ID:15046 -- Milea_Clothspinner 

