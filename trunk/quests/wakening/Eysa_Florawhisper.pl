# Dolvak's Report
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("A pleasure to meet you. I am Countess Eysa Florawhisper of the Tunarean Court. Are you a friend of the court?");
  }
  if ($text=~/friend of the court/i) {
    quest::say("You appear to be a creature that has seen many foreign lands. There are a number of fruits and seeds that I desire in order to plant them and preserve their species here in the wakening land. I will provide a bag for you that will preserve the seeds until they can be returned to me. Will you gather seeds for me? ");
  }
  if ($text=~/gather/i) {
    quest::say("I seek the following fruits and seeds. A misty acorn, emerald orange, bag of caynar nuts, vineclinger berries, ripened heartfruit, rathe berries, marr cherries, and flarefire seeds.");
    quest::summonitem(17864);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 29067 => 1)) {
    quest::emote("looks over the report you have given her. She glances up at you with a suspicious eye, as though she doesn't fully trust you. 'I was supposed to meet with Dolvak on this matter, as he is the liason between the shrine and the court. Instead he sent you with this report? I guess I have no choice but to trust you are a friend of the shrine, as the seal bears its mark on this parchment. These papers show the Tunarean Court's progress with the giants so far. Do you have any idea why this report is so important?'");
    quest::summonitem(29623);
    quest::faction(344,10); #tunarean court
    quest::depop();
  }
  if (plugin::check_handin(\%itemcount, 24863 => 1)) {
    quest::say("Ohhhh! You're the sweetest, $name. The nymphs of the Tunarean Court recognize you as a friend of our kind and our botanical brethren.");
    quest::faction(344, 30);
    quest::exp(5000);
    quest::summonitem(24864);
  }
  else {
    plugin::return_items(\%itemcount);
  }
}
# EOF zone: wakening ID: 119081 NPC: Eysa_Florawhisper