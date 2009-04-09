#Bukuku_Wolffeetz, Overthere

sub EVENT_SAY {
  if($text=~/Hail/i) {
    quest::say("Har har har! Yu funy lukking. Oooo.. do u hav doze [smarty writin's]?");
  }
  if($text=~/smarty writin's/i) {
    quest::say("Me not know what dem ar for shure. Dem only hav dees names. Umm.. let me see if I can member dem. Taaalisman de umm.. Jasinth. Dat's one of dem. Spirited of Scaley?? OH!! Dis my favorite. Kripple. Den the last is the painful one. Canaabaalize canaabaalize canaabaalize. Yep, dat super duper one. Bring me bak one of dem, me trade.");
  }
}

sub EVENT_ITEM {

  if(plugin::check_handin(\%itemcount, 19269 => 1) || # Cripple

     plugin::check_handin(\%itemcount, 19238 => 1) || # Spirit of Scale

     plugin::check_handin(\%itemcount, 19264 => 1) || # Talisman of Jasinth

     plugin::check_handin(\%itemcount, 19272 => 1)) { # Cannibalize III

    quest::say("Here is the scroll that I promised. We have both gained much knowledge today. I hope to do business with you again soon. Farewell!");
    quest::summonitem(quest::ChooseRandom(19267,19271,19274,19266));
    quest::exp(1000);
  }
  else {
    quest::say("I have no need for this, $name.");
    plugin::return_items(\%itemcount);
  }
}
#END of FILE Zone:overthere  ID:93100 -- Bukuku_Wolffeetz