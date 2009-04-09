# The Power of the Gatecallers
# Rungupp



sub EVENT_SAY {

   if($text=~/Hail/i){

   quest::say("Greetings!  You seek knowledge of our ways.  You shall find knowledge and you shall offer knowledge you have been taught.  What is the power of the [Gatecallers]?");

}

   if($text=~/gatecallers/i){

    quest::say("Yes. We are the true summoners of Norrath. We are the power supreme. You will learn more and we shall test you. You will go forth and learn the art of summoning. Let your first test be to master the summoning of the dagger and of food. Return to me two summoned daggers and two of the food source you learn to call forth. Do so, and I shall give you the gloves of the Gatecaller.");

}
      
   if($text=~/slight problem/i){

    quest::say("We have heard rumor of an troll who has taken residence within the forest of Toxxulia. During your travels in Toxxulia, we command you to keep a watchful eye out for the beast. Slay it on sight and return its head to me. To do so will earn you the spell Fire Flux or Burn, whichever may be available at the time.");

 }
 

}
sub EVENT_ITEM {

    if(plugin::check_handin(\%itemcount, 13078 => 2, 7305 => 2)) { # The Power of the Gatecallers

    quest::summonitem(12209);
   
   
   quest::say("You have mastered these spells quickly. You shall now wear the gloves of the Gatecaller. Cumbersome they may feel, but they protect the hands of a young magician. In your young days of magic they will protect you from harm. They are not valued much by merchants, but they are prized by other circles. Nevertheless, we offer them only to our young Gatecallers. You may now be of assistance with a [slight problem].");
    
    
   quest::faction(112,10); #faction with Gate Callers increased
   quest::faction(145,10); #faction with High Council of Erudin increased
   quest::faction(147,10); #faction with High Guards of Erudin increased
   quest::faction(143,-30); #faction with Heretics decreased
   quest::exp(175);
   quest::givecash(0,0,5,0);
      
    }
   
   if(plugin::check_handin(\%itemcount, 13895=> 1)) {  # Rungupp
   
    quest::summonitem(15313);

    quest::say("So the rumor shows true. Good work. You are an excellent student and a noble Erudite. Here is your spell as I promised. Go forth and fill your brain with knowledge.");
   
   quest::faction(112,10); #faction with Gate Callers increased
   quest::faction(145,10); #faction with High Council of Erudin increased
   quest::faction(147,10); #faction with High Guards of Erudin increased
   quest::faction(143,-30); #faction with Heretics decreased
   quest::exp(250);
   quest::givecash(0,10,0,0);
 

   
   }

      plugin::return_items(\%itemcount);
  
}

#END of FILE Zone:erudnint  ID:24073 -- Vasile_Jahnir 