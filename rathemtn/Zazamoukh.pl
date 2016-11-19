sub EVENT_SAY {
  if ($client->GetGlobal("beast_epic") ==12) {
   if ($text=~/hail/i) {
	if (plugin::check_hasitem($client, 52902)){
		quest::say("You must give me the remains of that creature.");
	}
	else {
		quest::say("My mind . . . something is [" . quest::saylink("happening") . "].");
	}
  }
 }
 if ($client->GetGlobal("beast_epic") ==12) {
  if ($text=~/happening/i) {
     quest::say("Something . . . is wrong. My companion . . . it weakens me . . .");
     quest::spawn2(50326,0,0,-3241,3550,39,1224);
     quest::depop_withtimer();
     }
 }
}

sub EVENT_ITEM {
  if ($client->GetGlobal("beast_epic") ==12) {
	  if (plugin::check_handin(\%itemcount, 52902 =>1 )) {
		quest::say("Thank you. Your actions have earned my trust and gratefulness. The ankh you have returned, that extends the life of my companion, is tainted. Ankhefenmut carries the other piece of the ankh and may need help. You must return to Ankhefenmut as the dark magic grows with each moment. Take this magic silk scarf to Ankhefenmut so that the ankh can be shielded.");
		quest::summonitem(52904);
		quest::setglobal("beast_epic",13,5,"F");
	  }
  }
  plugin::return_items(\%itemcount);   
}