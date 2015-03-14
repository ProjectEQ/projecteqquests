sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Hello there traveler. I have many wares for sale so please take a look at what I have. If you think all my goods are junk and wish to buy from someone else though I'll understand.");
 }
}


sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 26057 => 1)) {#Book of Sales Secrets
    quest::say("'I see you have brought a book from the Commissioner. Well I'm not much for reading but I will surely try anything that may increase my sales. Anyways I'm sure you arent that interested in how bad my sales are and would like to be on your way so here you go.");
    quest::emote("gives you a Sales Report.");
    quest::summonitem(26058);#Sales Report/Economy Report..There is some confusion here about which gives which, as the quest specifies a "Sales Report" but the item named after the mob is an "Economy Report" and vice versa.  I picked one and went with it, should be internally consistent at least.
    quest::faction(338, 40); #Traders of the Haven
    quest::faction(152, 40); #House of Fordel
    quest::faction(153, 40); #House of Midst
    quest::faction(154, 40); #House of Stout
    quest::exp(1000);#This quest is doable at level 1, I didn't feel comfortable giving out more xp than this per step
  }
  plugin::return_items(\%itemcount);
}

