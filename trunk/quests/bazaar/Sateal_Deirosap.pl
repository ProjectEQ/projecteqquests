sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Hello there traveler. I have many wares for sale so please take a look at what I have. If you think all my goods are junk and wish to buy from someone else though I'll understand.");
 }
}


sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 26055 => 1)) {#Tattered Newsletter
    quest::say("Ah great, I have been meaning to go and pick one of these up from the Trade Commissioner but I have been very busy with my work. I'm sure Henry has been waiting for my sales report so here it is. Please return it to him for me if you could and thanks again!");
    quest::emote("gives you a Sales Report.");
    quest::summonitem(26056);#Sales Report/Economy Report..There is some confusion here about which gives which, as the quest specifies a "Sales Report" but the item named after the mob is an "Economy Report" and vice versa.  I picked one and went with it, should be internally consistent at least.
    quest::faction(338, 5); #Traders of the Haven
    quest::faction(152, 5); #House of Fordel
    quest::faction(153, 5); #House of Midst
    quest::faction(154, 5); #House of Stout
    quest::exp(1000);#This quest is doable at level 1, I didn't feel comfortable giving out more xp than this per step
  }
  else {
    quest::say("I don't need this."); #text made up
    plugin::return_items(\%itemcount);
    return 1;
  }
  
}

