sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("The paths of fury and rage will unlock the way to the chambers of destruction. Behind each behemoth lies the hallways of fury and rage. I am one of few spirits whose souls have been cleansed of the corruption of Trushar. Now you must cleanse the taint of destruction from your spirit. In order to do this, you must tempt yourself with power. Only those who are worthy can walk the path of destruction. Defeating the harbingers of rage and fury is the only way to remove the taint that fills these halls. I would advise battling them simultaneously, as one will offer their power to the other shortly after being defeated. If you are successful, each altar will grant you its power and unlock the Chamber of Rites behind me. There you must give the power from each altar to its spectral keeper. If you are fast enough, you will remove the taint and gain access to the main ritual halls. That is where you will find Barxt and his followers. That is where your might will truly be tested. Tell me when you are [ready].");
  }
  if ($text=~/ready/i) {
    quest::say("May your gods protect you. Let the trials begin.");
    quest::spawn2(292056,0,0,-822,-1249,8,188);
    quest::spawn2(292055,0,0,-917,-1251,8,61);
    quest::depop(292019);
    quest::depop(202020);
    quest::settimer(5400);
  }
}
sub EVENT_SIGNAL {
  $counter += 1;
    if($counter == 2) {
	quest::stoptimer();
	}
}
sub EVENT_TIMER {
  quest::setglobal("destper",1,3,"H6");
  $client->Message(15,"Your time has elapsed, you must suffer the punishment of failure, there is nothing I can do to help now.");
}