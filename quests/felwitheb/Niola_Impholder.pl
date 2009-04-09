sub EVENT_SAY { 
  if($text=~/Hail/i){
    quest::say("Greetings, $name . Welcome to the home of the Keepers of the Art. I am in need of spell components. Would you be willing to [fetch] some for me?");
  }
  if($text=~/fetch/i){
    quest::say("What I need are some bat wings for a spell I am researching. If you bring me back four bat wings, I would be willing to reward you with a scroll.");
  }
}
sub EVENT_ITEM { 
  if (plugin::check_handin(\%itemcount,13068=>4))
  {
    quest::say("Ah yes.  These are exactly what I need.  Thank you very much.");
    quest::summonitem(quest::ChooseRandom(15310,15332));
    quest::faction(170,5);
    quest::faction(178,5);
    quest::faction(99,5);
    quest::faction(322,-10);
    quest::ding();
    quest::exp(350);
  }
  if (plugin::check_handin(\%itemcount,18777=> 1))
  {
    quest::say("Welcome. I am Niola Impholder. Master Magician of the Keepers of the Art. Here is our guild robe. You have much to learn. so let's get started.");
    quest::summonitem(13592);
    quest::exp(100);
  }
  if (plugin::check_handin(\%itemcount,18902=> 1))
  {
    quest::say("She is still alive? OH, thank you for this news.");
    quest::summonitem(1307);
    quest::exp(30000);
    quest::ding();
  }
plugin::return_items(\%itemcount); # return unused items
}
#END of FILE Zone:felwitheb  ID:62021 -- Niola_Impholder 

