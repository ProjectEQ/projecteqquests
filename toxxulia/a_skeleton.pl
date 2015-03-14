sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 13894 => 1)){
    quest::say("Aye.. You cut out the middleman..  I shall reward you.. hmm..  I have not found anything. how about..  <CRACK!! SNAP!! RIPP!!>  How about something off meself?");
    quest::summonitem(quest::ChooseRandom(9304, 12195, 13073, 13074)); 
  }
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:toxxulia  ID:..... -- a_skeleton