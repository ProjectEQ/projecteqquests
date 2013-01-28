sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 67519 => 1)) {
    quest::say("While I applaud your effort, I must decline. You see, since I was captured I have been altered by the beings known as ikaav. As a result, my aura has changed, making this farstone useless. I do not know what it is I am becoming, but I will not place the lives of the brotherhood in danger. I have decided to give in to the inevitable and serve these beings. Please tell Taminoa I am sorry, but this is for the best. And please give him this. As I slip deeper and deeper into insanity, I have lost my ability to articulate my thoughts on paper. This is one of my last written reports and I think Taminoa will find it quite interesting.");
    quest::summonitem(67520);
  }
  elsif (plugin::check_handin(\%itemcount, 67521 => 1, 67522 => 1, 67523 => 1, 67524 => 1)) {
    quest::spawn2(284092,0,0,1238,-491,106,64);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}


sub EVENT_SIGNAL {
  if($signal == 1) { 
    quest::spawn2(284097,0,0,1447,-586,106,0);
    $npc->Depop(1);
  }
}
