# Quest for Raskena Djor in erudnint - Wizards first assignment 
# NPC ID 23041 -- Raskena_Djor 

sub EVENT_SAY { 
    if ($text=~/hail/i) { 
       quest::say("Greetings. What brings you to Raskena? Did Ghanlin send you?"); 
    } 
    if ($text=~/ghanlin/i) { 
      quest::say("Then let us begin your first task. I require some components for an experiment I have been meaning to conduct. If you could [gather] them for me, I will make sure that you are rewarded."); 
    } 
    if ($text=~/gather/i) { 
      quest::say("In Toxxulia Forest you should be able to find some fire beetles. I require two fire beetle legs and two fire beetle eyes. Once you have collected them, bring them to me for your reward."); 
    } 
} 

sub EVENT_ITEM { 
    if (plugin::check_handin(\%itemcount, 10307 => 2, 13250 => 2)) { # random level 1 spell and experience 
      quest::summonitem(quest::ChooseRandom(15373, 15054, 15205, 15288, 15372, 15374)); 
      quest::exp(150); 
      quest::say("You have passed your first task. Nice work. Take this spell as your payment."); 
    } 
    else { 
      plugin::return_items(\%itemcount); 
      quest::say("What am I supposed to do with these, $name?"); 
    } 
} 

#END of FILE Zone:erudnint  ID:23041 -- Raskena_Djor 
