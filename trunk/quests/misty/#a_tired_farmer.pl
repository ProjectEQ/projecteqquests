## A Tired Farmer
## Quest: Part of "Ranger Epic 1.5 Pre-Quest"
## NpcID:         33150
## SpawngroupID:   54848
## Created on April 21, 2010 by mrhodes

## Poem of the Storms:             62632
## Tear-stained Poem of the Storms: 62633

sub EVENT_SAY
{
   if(plugin::hasitem($client, 62632))      ## Will not respond if you do not have this itme
   {
      if($text=~/hail/i)
      {
         quest::emote("looks worn out. His boots are stained with mud and his clothing is torn and frayed.");
         quest::say("Hello there. I hope things are going well for you, at least better than they are for me. I wish I had time to be more social, but I need rest before I go out and battle with the weather again.");   
      }
      if($text=~/friend of the Storm Lord/i)
      {
         quest::say("Please, not another lecture. I know, I know, I need to accept that it will rain when it rains. Rain is good, it grows my crops. I understand all that. But now the rain is rotting my crops on the vine. It's flooding out my seeds. It's ruining me. I want to remain true to Karana, but I can't be quiet while my family and friends starve. I understand why Karana is worthy of worship. I want to have faith, but I just can't afford to feed my family without my crops!");
      }
   } # if(plugin::hasitem($client, 62632))    Poem of the Storms
}

sub EVENT_ITEM
{
   if(($platinum == 300) && ($copper == $silver == $gold == 0))
   {
      if(plugin::check_handin(\%itemcount, 62632 => 1))
      {
        quest::me("The farmer looks at you with a stunned expression on his face. He carefully sets the coins down in a neat stack on the ground and slowly unfolds the paper. As he reads the poem, heavy tears form in the corners of his eyes and drop onto the page. When he is done reading he carefully folds it back up and hands the page back to you. He then wipes his nose with his sleeve.");
        quest::depop();
        quest::spawn2(33159, 0, 0, -1152, -362, 1.19, 0);
		quest::say("I think I understand a little better about faith. Maybe my faith brought you here, maybe yours did, I don't know. I don't think it matters. You've shown me something about kindness as well. Thank you so much!");
        quest::summonitem(62633);
      }else
      {
         quest::givecash(0,0,0,300);  # Give money back if not the right item
      }
   }else {
      quest::say("I have no use for this.");
	  quest::givecash($copper, $silver, $gold, $platinum);
      plugin::return_items(\%itemcount);
   }      
}

sub EVENT_SPAWN{
   quest::depop(33159);
}