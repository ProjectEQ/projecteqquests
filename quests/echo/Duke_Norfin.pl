# Duke Norfin's Delivery
#

sub EVENT_SAY {
  if ($faction <= 5) {
    if ($text=~/hail/i) {
      quest::say("Hello, $name. My guards seem to find you harmless enough, but I have yet to determine if you are trustworthy. We are always on the lookout for additional hands to assist in our work. Perhaps you are... sympathetic to our situation.");
    }
    elsif ($text=~/situation/i) {
      quest::say("Those blasted Houses in Shadow Haven. They think they have the right to own all trade going through the Haven. Well it's about time they learn that trade will continue with or without their consent. I know a few people on the Trade Commission who understand the way things really work and they don't care who does the trading as long as they get their cut.");
    }
    elsif ($text=~/work/i) {
      quest::say("Excellent! We like to keep changing who we use for deliveries. Keeps those dumb Defenders guessing and reduces the chances of goods not reaching their destination.");
    }
    elsif ($text=~/destination/i) {
      quest::say("I have an important shipment coming from Katta Castellum that's late. The courier who was picking up the shipment should still be there. I'd like for you to go over there and see what the hold up is. Take this note and show it to Jarin Lorean so he knows you're on official business. Report back to me with news. Better yet, return with the shipment if you can.");
      quest::summonitem(19841);
    }
  }
  else {
    quest::say("You have a lot of nerve wandering in here. We'll be watching you carefully. Try anything and it will be the last thing you ever try.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19840 => 1)) {
    quest::say("Excellent work. I'm glad you were able to collect this shipment. The buyers were getting anxious to have it delivered. Come back later and I may have another job for you.");
    quest::exp(25000);
    quest::faction(141,30); #haven smugglers
    quest::faction(191,30); #lake recondite bandits
    quest::faction(152,-40); #house of fordel
    quest::faction(153,-40); #house of midst
    quest::faction(154,-40); #house of stout
  }
  else {
    #do all other handins first with plugin, then let it do disciplines
    plugin::try_tome_handins(\%itemcount, $class, 'Shadowknight');
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: echo ID: 153101 NPC: Duke_Norfin

