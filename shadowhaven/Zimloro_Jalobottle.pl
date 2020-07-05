# items: 4758, 4759, 4765
sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Oi there, $name. If you are lookin for a potion or an antidote I got just what the doctor ordered. Step right up! I also have many other special potions but sadly I do not have the correct [components] for them.");
  }
  if($text=~/components/i){
    quest::say("Well you see I can make some very magnificent potions. Unfortunately, I am in need of a few [ingredients] that I lost in a lab accident a few days back.");
  }
  if($text=~/ingredients/i){
    quest::say("You sure seem interested in my work there, $name. So interested that I think you would be willing to go fetch the components I require for my studies for me! Am I correct? Will you [retrieve these components] for me?");
  }
  if($text=~/retrieve these components/i){
    quest::say("Fantastic, $name! Elefan, my apprentice, is currently studying under my wing. He had been collecting samples in Shadeweaver lately and he probably has the items that I need. If you could go and speak with him and present him with this ingredient list, hopefully he will have what I need. Please bring the components back to me as soon as possible!");
    quest::summonitem(4758); # Item: Zimloro Ingredient List
  }
}
sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount, 4759 => 1)) {
    quest::say("You did it, $name! Finally I can finish these potions that I have been working on for such a long time. I will surely tell all of my friends of your willingness to help me!");
    quest::faction(1512,10); #house of stout
    quest::faction(1508,10); #traders of the haven
  }
  if (plugin::check_handin(\%itemcount, 4765 => 1)) {
    quest::say("Ah, of course, the antidote supplies I have been waiting for from Daksins. I hope he is ok, we all told him it was not wise to go out to the cursed mountains alone. I thank you for bringing me these supplies because Daksins was unable too. There have been many reports lately of people receiving the disease carried by the beasts you encountered. Should you come across these extracts in the future bring them to me if you like. Thank you again, your actions will not go unnoticed.");
    quest::exp(5000);
    quest::faction(1512,10); #house of stout
    quest::faction(1508,10); #traders of the haven
  }
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:shadowhaven  ID:150278 -- Zimloro_Jalobottle 

