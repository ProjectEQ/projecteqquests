#Mirao_Frostpouch.pl
#Willamina's Needles
# items: 28090, 28091


sub EVENT_SAY {
	if($text=~/Hail/i) {
    quest::say("And good day to you, $name. This great, wondrous city holds a seemingly endless supply of knowledge and power, attainable by all who walk our streets and seek it. In an effort to accommodate the travelers, scholars, and heroes alike that have ventured into our midst in this recent era. the citizens of New Tanaan have individually offered their own unique knowledge in almost every area significant to travelers of all professions. As a former chemist and knowing that not all of Norrath's great minds have the time or the patience to brew arcane potions. I have taken the liberty to craft some from my memory. Those that you will find in my inventory are the ones I felt would best suit our visitors.");
  }
  if($text=~/elixir/i) {
    quest::say("That poor lad, he's always catching ill this time of year. Unfortunately I am out of the medicine he needs right now. Perhaps if you could obtain the key ingredient I am missing, I could brew up a batch for you to take to him. I have heard Cador recently came into possession of some black lava powder. If you can convince him to give you some, bring it to me right away!");
  }
}
  
  
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 28090 => 1)) {#Black Lava Powder
    quest::emote("takes the powder and quickly dashes it into a boiling cauldron. He then stirs it and pours the concoction into a small bottle. 'Here you go, this should make poor Bolcen feel much better. Hurry now, he's waiting.");
    quest::summonitem(28091);#Curative Potion
    quest::exp(250);
  }
  plugin::return_items(\%itemcount);
}#END of FILE Zone:poknowledge  ID:202153 -- Mirao_Frostpouch 

