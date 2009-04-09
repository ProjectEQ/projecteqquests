# Inert Potion

sub EVENT_SAY {

 if ($text=~/Hail/i){

   quest::say("Welcome. my friend! We are the Craftkeepers. We study the circle of magic called enchantment. What circle do you [study]?");
 
 }

   if ($text=~/study enchantment/i){
   
      quest::say("Then I welcome you into our circle. It is good to see new blood. I have a favor to ask of you. Do you wish to [assist Toresian] or do you not have the time?");

}

   if ($text=~/assist Toresian/i){
   
      quest::say("Ahhhhh $name. Slansin used to have need of those potions, however he mysteriously disappeared long ago. The only person I know of who still wants them is a cleric of the Church of Marr in Freeport.");

      quest::summonitem(13983);
 }
}
plugin::return_items(\%itemcount); # return unused items 

#END of FILE Zone:erudnint  ID:23073 -- Toresian_Fhabel