sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Welcome to the Hall of Truth!  May the will of Mithaniel Marr guide you through life.  We are glad to see that you have an interest in our ways.  Please speak with any of my priests or knights and they shall help you find your faith."); }
if ($text=~/militia/i) {
  quest::say("The Freeport Militia is nothing more than a ragtag band of mercenaries and convicts. They act as the guards of this troubled city. Be well aware that they are not the honorable guards you may think they are. They are commanded by Sir Lucan D'Lere, the self-proclaimed ruler of Freeport. We of the Hall of Truth shall set this city free from the grip of the Militia one day. It is our duty as Knights of Truth.");
}
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 18822 =>1 )) {
    quest::say("Thanks for your hard work.");
    quest::givecash(7,0,1,0);
    quest::summonitem(14003);
  }
  if (plugin::check_handin(\%itemcount, 18804 => 1)) {
    quest::say("Thank you, defender of Karana! We have heard rumors of the followers of Bertoxxulous gaining knowledge of our knight who infiltrated the ranks of the [Militia]. They would have tried to sell the information to the Militia. We will inform our knight immediately. As for you, here is a donation to your journey's expenses. Stay clear of the Freeport Militia. There is no doubt they have learned of your alliance with us.");
    quest::faction( 184, 10);
    quest::faction( 86, -15);
    quest::faction( 105, -15);
    quest::faction( 258, 10);
    quest::faction( 311, 10);
    quest::exp(1000);
    quest::givecash(0,0,7,1);
    quest::ChooseRandom(6016,13296);
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:freportn  ID:8045 -- Eestyana_Naestra 

