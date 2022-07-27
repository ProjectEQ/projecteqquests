# Fertilizer & rare plants
#
# items: 17870, 31779, 12809, 14936, 14931, 14952, 14953, 10695

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, $name! I am Governess Tobala Honeyjar of Katta Castellum. Overseeing the maintenance of the [Nocturnal Gardens] is just one of my duties as the governess of agriculture and ecology.");
  }
  if ($text=~/nocturnal gardens/i) {
    quest::say("These are the Nocturnal Gardens in which we now stand. It is a collection of flora from various regions of the dark side of Luclin. It is a shame that we are not capable of supplying the nutrients necessary to maintain flora from the light side of Luclin. If you wish to assist in the maintenance of the garden I have some [tasks] you may be helpful in completing.");
  }
  if ($text=~/tasks/i) {
    quest::say("I am in need of ingredients to create more [fertilizer] and in need of a competent forager to gather some [rare plants] for me.");
  }
  if ($text=~/fertilizer/i) {
    quest::say("How humble of you to assist me with my mundane tasks! Take this bag and fill it with Three piles of Owlbear Dung, Three Piles of Fungus Compost, and Two Piles of Netherbian Nitrate.");
    quest::summonitem(17870); # Item: Empty Fertilizer Bag
  }
  if ($text=~/rare plants/i) {
    quest::say("I am seeking seeds and plants that I may extract the seeds from that are native to the light side of Luclin so that I am prepared should the Illuminarium Industria succeed in constructing a lantern that will provide the plants with the nutrients they need to survive here on the dark side. It would be a tremendous help if you could bring me a Twilight Orchid, Dawnflower Seeds, a Red Sands Cactus, and a Letalis Zenith Vine.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 31779 => 1)) {
    quest::summonitem(12809,5); # Item: Midnight Tangelo
  }
  elsif (plugin::check_handin(\%itemcount, 14936 => 1, 14931 => 1, 14952 => 1, 14953 => 1)) {
    quest::summonitem(10695); # Item: Foraging Machette
  }
  else {
    plugin::return_items(\%itemcount);
    return 1;
  }
  quest::say("Oh! Thank you so much! You have saved much time and trouble! Now if only those tinkerers in the Illuminarium Industria could figure out how to get that artificial light working!"); #using reward text from the rare plants quest for both quests
  quest::exp(5000);
  quest::faction(1561,10); #concillium universus
  quest::faction(1486,-30); #heart of seru
  quest::faction(1483,-30); #seru
}

# EOF zone: katta ID: 160192 NPC: Tobala_Honeyjar

