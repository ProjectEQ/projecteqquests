# Duke Norfin's Delivery
#

my $shipment;

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Can't you see I'm, eh, busy here? Leave me be.");
  }
  elsif ($text=~/i will deliver the goods/i) {
    if ($shipment == 1) {
      quest::emote("looks around cautiously and hands you a package. 'Here, take this back to Duke Norfin as quick as you can.'"); #made up text
      quest::summonitem(19840);
      $shipment = 0;
    }
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 19841 => 1)) {
    quest::emote("glances nervously about, 'So you're here on 'official' business eh? Well, there's not much I can do right now. I have the goods but someone caught scent of what I've been doing and there are too many people watching me to leave right now. You can tell our mutual friend that he needs to wait for things to calm down or send someone else to bring back the goods.'");
    quest::faction(141,30); #haven smugglers
    #quest::faction(xxx,30); #haven smuggler associates faction does not exist at this time
    $shipment = 1;
  }
  else {
    plugin::return_items(\%itemcount);
  }
}

# EOF zone: katta ID: 160262 NPC: Jarin_Lorean


