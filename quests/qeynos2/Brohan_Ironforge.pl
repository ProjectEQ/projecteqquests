sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Please, leave me be alone. I have such sorrow in my heart.. I wish to be alone with my thoughts.");
}
if($text=~/sorrow/i){
quest::say("My daughter Tayla has left and I fear she will not return. If only I could find someone.. Hey, would you like to do a favor for an old man or are you too busy?");
}
if($text=~/Tayla/i){
quest::say("Tayla is my oldest and youngest daughter. Unlike the rest she is of a different mother. She is part elven. She appears to be physicaly younger than the rest, but she has spent more years as my daughter than all the others. Tayla is from my first marriage to Weleana.");
}
if($text=~/Where is Tayla/i){
quest::say("My daughters have informed me that Tayla has runaway to live with the elves of Kelethin. Apparently life among the human citizens of Qeynos was not very kind to her. I wish her well, but I wish I knew she was safe.");
}
if($text=~/Hurrieta/i){
quest::say("Hurrieta is a good woman. She has a bit repulsed that I once was married to a wood elf. She got over that I believe. We had four children together. The children seem quite accepting of Tayla, even though she is a half elf.");
}
if($text=~/do you a favor/i){
quest::say("Good. Please find my daughter, Tayla Ironforge. Bring me proof that she is safe. She was last seen near Nektulos. I am a fine blacksmith and I shall give you a worthy gift if you do this for me."); }
}
sub EVENT_ITEM { 
if ($itemcount{26644} == 1){#Nonexistent: 'a sealed letter', 'father, I am well, I will be living among the elves now, Love Tayla'
quest::say("Oh! thank you! Now I know she is safe. My sweet Tayla. Here is your reward, as promised. A hero such as yourself deserves a weapon with which to uphold your noble values.");
my @items = (5303,5304,5305,5313,6303,6311,6312,7300,7301,7311,7499);
quest::summonitem("$items[int(rand($#items+1))]");
quest::faction("2084","1");
quest::faction("2128","1");
quest::faction("2356","1");
quest::faction("2015","1");
quest::faction("10108","-1");
quest::exp("100"); }
}
#END of FILE Zone:qeynos2  ID:2046 -- Brohan_Ironforge 

