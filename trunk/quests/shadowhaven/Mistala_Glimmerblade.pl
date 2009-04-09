# Mistala's Report
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello there, $name! I am Lady Mistala Glimmerblade of the House of Fordel. I reside over this great city of Shadowhaven along with my husband Daloran. I take great pride in knowing that our city has come so far and became a place of free trade and freedom for all of its inhabitants. We also are lucky to have some of the finest guardspersons in the land. Which reminds me I need to collect my [report].");
  }
  if ($text=~/report/i) {
    quest::say("I have a report that I collect every few days from my first Lieutentant Broansas. This report contains information about each guard, his performance, and usually notes on suggestions upon how to limit the number of smugglers passing through our town. However, Lieutenant Broansas is currently on assignment investigating a smugglers ring. I need someone to retrieve his reports of the latest information that he gathered for me. Will you [retrieve the daily reports]?");
  }
  if ($text=~/retrieve the daily reports/i) {
    quest::say("Many thanks, $name. The last I heard from Broansas he was heading for the Dawnshroud peaks. Please seek him out there and present him with this notorized letter so that he will know that I have sent you. Return to me with his report as soon as you can. I await your return.");
    quest::summonitem(4760);
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 4761 => 1)) {
    quest::say("It's nice to see that Broansas is doing well. I would not have been able to retrieve this information without your assistance, $name. I thank you for your help and will be sure to tell the council members of your good deeds. I often need reports retrieved so please check back if you would like to help to the House of Fordel.");
    quest::exp(2500);
    quest::faction(152,10); #house of fordel
    quest::faction(140,10); #haven defenders
    quest::faction(338,10); #traders of the haven
  }
  plugin::return_items(\%itemcount);
}

# EOF zone: shadowhaven ID: 150090 NPC: Mistala_Glimmerblade

