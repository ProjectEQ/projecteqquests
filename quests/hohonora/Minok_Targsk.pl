sub EVENT_SAY {
   if($text=~/hail/i)   {
	quest::say("Who defines the lines of being right or wrong? When a good man is under pressure he sometimes makes bad choices. Should this man not be forgiven or should he be judged to be wrong for the rest of his life? It's just not right. [Grenic] should be allowed back into the halls as he once was.");
   }
   if($text=~/who is grenic/i)   {
	quest::say("Grenic Drere was the man who saved my life. We fought together in the battle of Amm`Oren. Grenic lost sight of our objective for a second and killed innocent people rather than making them prisoners. Mithaniel Marr banished him from the Halls of Honor. Grenic has asked me for a favor to try and find an alternate way into see Mithaniel Marr. I hid pieces of a [map] that I had drawn up around here but the other guards have been keeping a close eye on me.");
   }
   if($text=~/map/i)   {
	quest::say("I had a well drawn map of this place. It was so good that i tore it into four pieces and hid it. If that map fell into the hands of the enemy it could mean destruction. I need help collecting the map. Will you [help] me out $name?");
   }
   if($text=~/i will help/i)   {
	quest::say("I hid each section in the four corners of the Halls. Collect them and bring them back to me.");
   }
}

#sub EVENT_ITEM {
#  if (plugin::check_handin(\%itemcount, 51627 => 1, 51628 => 1)) { #NOTE Only 2 #of the 4 required items existed in the Database i downloaded from the PEQ site #The other two items will need to be added
#    quest::say("Thank you for helping me assemble the map, it was quite #detailed and displayed a secondary entrance to Mithainel's temple, which you #may use as your entry point.");
#    quest::exp(1000);
#    quest::setglobal('HoHbAlt','1','5','M1'); #This flag only lasts 5 minutes #just to test its working This would need to be set to F once the final two #items are made
#  }
#  else {
#    plugin::return_items(\%itemcount);
#  }
#}###

#End of File zone:hohonora ID: unassigned -- Minok Targsk
#By Kovou