#Gearo.pl
#Steaon's Deliveries

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello there friend. My name is Gearo and as you can see I'm a Gnome, so what can I do for ya?");
  }
  if(($text=~/take the gems/i) && ($DeliveredToGearo == 1)) {
    quest::say("Good $name! Here they are, please take them back to that gargantuan barbarian and let him know I want a raise for all this hard work!");
    quest::summonitem(4767);
    $qglobals{DeliveredToGearo} = undef; 
    quest::delglobal("DeliveredToGearo"); #Remove global
  }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 4766 => 1)) {#Assorted Tailoring Supplies
    quest::say("Ah you were sent from Steaon I see. So what's that tall drink of water up too? He must be busy at the store if he has you delivering his supplies for him. Well enough about all that. If he has trusted you to bring his supplies here I suppose I can give you these gems I picked up for him. Will you [take the gems] to him?");
    quest::faction(338, 100); #Traders of the Haven
    quest::faction(152, 5); #House of Fordel
    quest::faction(153, 15); #House of Midst
    quest::faction(154, 15); #House of Stout
    quest::exp(1000);#This quest is doable at level 1, I didn't feel comfortable giving out more xp than this per step    
    quest::setglobal("DeliveredToGearo",1,0,"D30");#Set a variable here.
  }
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
    return 1;
  }
  
}

