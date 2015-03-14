# Beriol's Research
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello stranger. Im very busy with my work, is there something specific you need to speak to me about?");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4769 => 1)) {
    quest::say("Ah, of course, my teacher Beriol needs some of these books for his research, here they are. It is a shame my studies have taken me so far from my roots. Hopefully I can return home soon and Visit my family and friends. In the mean time It was very nice to meet you and I wish you the best of luck. Please also return of you wish to deliver more books to my friend Beriol.");
    quest::summonitem(4770);
    quest::exp(1000);
    quest::faction(153,10); #house of midst
    quest::faction(338,10); #traders of the haven
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: katta ID: 160213 NPC: Dersino

