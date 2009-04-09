sub EVENT_SPAWN {
     quest::spawn2(228120,0,0,-1061,-47.1,-285.8,0); #door exit
     quest::spawn2(228119,0,0,-1363,-290.5,73.5,0); #door enter
}  

sub EVENT_SAY {
 if($text =~ /Hail/i) {
	quest::say("Thieves! Thieves aboard the ship! Return what you have stolen and I promise, your death will be swift.");
 }
 if($text =~ /What have I stolen/i) {
	quest::say("Do not try my patience dryfoot, the Captain and his hands will soon return. If he finds his things missing there will be death, he has been in foul spirits since losing the Stone. Your death if you are found with them. You did steal them? Admit it!");
 }
 if($text =~ /I did not steal/i) {
	quest::emote("gets a suspicious look in his eyes");
	quest::say("Ok, I will be honest. I lost the Captain's trinkets. If you help me find them before his return, I am sure I can track something down that will not be missed. I have access to the treasure room, and there is much there in the way of spoils.");
 }
  if($text =~ /I will help you/i) {
        $client->Message(13, "You sense that when you return you should be ready for a battle, despite Mi`Ta's assurances.");
 	quest::say("Excellent! It is not much, I was below deck with his compass, spyglass, ocean map, and a bottle of his favorite spirits. I would be in your debt should you find them for me.");
  }
}


sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount,56004=>1, 56005=>1, 56006=>1, 56007=>1)) {
     quest::signalwith(228119,66,0);
     quest::signalwith(228120,66,1);
     quest::signalwith(228118,43,2);
     quest::signalwith(228114,666,3);
     quest::signalwith(228115,666,4);
     quest::signalwith(228116,666,5);
     quest::signalwith(228117,666,6);
     quest::spawn2(228121,0,0,-1281,-46,-285.8,60); #captain
     quest::spawn2(228122,0,0,-1281,-120,-285.8,0); #Fists
     quest::spawn2(228122,0,0,-1281,118,-285.8,124); 
     quest::spawn2(228122,0,0,-1090,-120,-285.8,0); 
     quest::spawn2(228122,0,0,-1090,124,-285.8,124); 
     quest::depop();
}
 }