sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Hello there, traveler. I don't believe that I have seen you around these parts before- then again, I could have and simply forgotten since there have been so many new faces around here. However, if you are a newcomer to Shadowhaven, please make sure that you [register for trading] in the Haven. Registering with the Traders of the Haven will legitimize you in the eyes of local merchants and customers.");
 }
 if($text =~ /register for trading/i) {
	quest::say("It's great that you are interested $name, you will surely be glad you did. I have some simple deliveries that I need completed if you wish to be a registered trader in Shadowhaven.");
 }
 if($text =~ /deliveries/i) {
	quest::say("The deliveries are simple enough, I just need you to bring some letters to some merchants of the Haven that are currently working in other locations. Will you [deliver these letters]?");
 }
 if($text =~ /deliver these letters/i) {
	quest::say("I surely do appreciate the help, $name- clearly you understand the value of solid relations with the locals. First, I will need you to take this newsletter to Sateal. He is currently on assignment in the Bazaar and has been out of the loop on the happenings of Shadowhaven because of his heavy workload. Bring this to him and then return to me with his sales report. I look forward to seeing you soon.");
	quest::summonitem(26055);#Tattered Newsletter
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 26056 => 1)) {#Sateals Economy Report
    quest::say("Great to see you back so soon $name, you looked like a dependable person from the start. The next thing I need you to do is a bit more dangerous, but by the looks of you I doubt it will be a problem. Go to the Shadowhaven outpost in Fungusgrove and give Thar this book. Thar is a great merchant but I have seen his sales steadily declining, so I figured this book full of selling tips will help him regain his confidence and help him produce the kinds of numbers I know he is capable of. If his economy report is ready please, bring that back to me when you return.");
    quest::emote("gives you a Book of Sales Secrets.");
    quest::summonitem(26057);#Book of Sales Secrets
    quest::faction(338, 40); #Traders of the Haven
    quest::faction(152, 40); #House of Fordel
    quest::faction(153, 40); #House of Midst
    quest::faction(154, 40); #House of Stout
    quest::exp(1000);#This quest is doable at level 1, I didn't feel comfortable giving out more xp than this per step    
  }
  elsif (plugin::check_handin(\%itemcount, 26058 => 1)) {#Thars Sales Report
    quest::say("Excellent work $name, I knew that you were someone that I could trust to get the job done. The trader's union of Shadowhaven will hear of your solid work ethic. Perhaps a courier job is in your future, I couldn't have expected anyone to make these deliveries as fast as you did! Please take this amulet as a symbol of your dedication to Shadowhaven's booming economy. While wearing this you are sure to get all the greatest deals from the merchants of the Haven both here and in the bazaar. It was a pleasure meeting, you and thanks for all of your help.");
    quest::summonitem(26054);#Amulet of the Haven
    quest::faction(338, 50); #Traders of the Haven
    quest::faction(152, 50); #House of Fordel
    quest::faction(153, 50); #House of Midst
    quest::faction(154, 50); #House of Stout
    quest::exp(1000);#This quest is doable at level 1, I didn't feel comfortable giving out more xp than this per step
  }
  plugin::return_items(\%itemcount);
}#Done