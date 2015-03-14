# Grimling Picks
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Well met, kind $race. I am Governor Toktonn Geerlok of the Loyalist Combine. It is my duty to oversee all matters concerning engineering, construction, and maintenance within Katta Castellum. There is a wonderful ore native to Luclin called [Acrylia] that has proved to be a valuable asset to my crew and I.");
  }
  if ($text=~/acrylia/i) {
    quest::say("Yes, it is a marvelous luminescent ore that when properly smelted has properties similar to the finest of steels, and sometimes even better. Depending on the purity of the ore of course. The Tenebrous Mountains are rich with very pure acrylia veins but unfortunately the Grimlings have overrun the mines and are not willing to allow others to mine the ore. Instead they horde it for their tribes to the south. I am permitted by the Validus Custodus to reward those seeking to cleanse the mines of the Grimlings. More precisely to pay a reward for every four grimling mining picks presented to me.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 2695 => 4)) {
    quest::say("Excellent! Soon the grimlings may be coerced into being less stingy with their precious ore!");
    quest::summonitem(31727);
    quest::exp(10000);
    quest::faction(52,10); #concillium universus
    quest::faction(284,-30); #seru
    quest::faction(142,-30); #heart of seru
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: katta ID: 160174 NPC: Toktonn_Geerlok

