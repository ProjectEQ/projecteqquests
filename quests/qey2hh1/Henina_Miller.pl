# Gathering Grain
sub EVENT_SAY {
   if($text=~/Hail/i)  {   
      quest::say("Greetings, $name. Welcome to the Miller Farmstead. [Cleet] and I have lived out here on the plains of Karana for thirty years now. We grow the finest grains in all of Norrath. Admire the grains all you like, but steer clear of those [scarecrows]."); 
      }
      if($text=~/Who is Cleet/i) 
      {   
         quest::say("Cleet is my husband. He is a hard worker and provides for the kids and me"); 
         }
         if($text=~/What scarecrows/i)  {     
            quest::say("Yep, those scarecrows are snarky. I've told Cleet more than a few times that I'd like to cook their heads into a pie, but he won't let me get near them. Oh, there was a recipe book that the Hutchison's gave us as a gift that described how to bake five different wisp lightstones into a scarecrow head to make it glow. Ah well."); 
      }
}
sub EVENT_ITEM {
   
if(plugin::check_handin(\%itemcount, 13990 => 1))  { #Sack of Hay 
   quest::say("Thank you so much. Tiny gets quite tired doing this by himself. Here you go.");   
   quest::exp(70);   
   quest::givecash(4,0,0,0);   
   quest::faction(167,10); #KaranasResidents   
   quest::faction(135,10); #GuardsOfQeynos   
   quest::faction(257,10); #PriestsOfLife   
   quest::faction(183,10); #KnightsOfThunder 
   }
plugin::return_items(\%itemcount);
   }
#END of FILE zone: ID:12026 -- Henina_Miller.pl 