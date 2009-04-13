sub EVENT_SAY {
  if ($text=~/mission/i) {
    quest::say("If you have not noticed the new intelligent races that have found it's way to our land, you will see soon. They have built a small outpost far to the south along the ocean. If they go unchecked, their outpost will become a city from which they will cause us much discomfort. They are strong and have experienced [mercenaries] in their employ.");
  }
  if ($text=~/mercenaries/i) {
    quest::say("Yes. In particular, a company of mercenaries commanded by a human known as Streaven. He has personally thwarted an operation I was in charge of. I will make him pay for his interference. You will kill Streaven. But first you must [draw him out], as he is not a fool.");
  }
  if ($text=~/draw him out/i) {
    quest::say("While Streaven is not foolish he has made a mistake. He's taken a young and ambitious noble on as an officer in his company. This noble represents a source of funds and as such Streaven most likely will come to his aid if endangered. Our spies have reported that he has been implanted with some sort of device that will alert the commander of any danger. You must retrieve this [implant].");
  }
  if ($text=~/implant/i) {
    quest::say("The implant is buried deep within this noble's head. Retrieving it will most likely leave quite a traumatic wound. Once you have the implant you must take it to an agent that will be in the area. This agent is one of the Kotiz Brood, a necromancer. Her name is Vekis and she will be able to activate the implant and draw Streaven out. She will only appear after you have dispatched the noble and she will go back into hiding shortly there after, so you must [find her] quickly.");
  }
  if ($text=~/find her/i) {
    quest::say("She will be near one of our ancient statues along the coast. You need only hand her the implant for her to activate it. Once he is away from the guards you will have your chance. Bring me Streaven's Head and 3 rubies and you will have your reference for the Arcut. Remember that your perseverance is your greatest virtue and will carry you to victory always.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 14783 =>1 )) {
    quest::emote("snickers to himself and looks out over the swamp for a moment before saying,");
    quest::say("Perseverance is indeed our greatest virtue. Perhaps if we as warriors looked more to cultivate our virtue rather than to hoard glory our people would be rulers of this entire land. I will send you on a [mission] to learn of perseverance. If you complete it I will give you my reference.");
  }
  if (plugin::check_handin(\%itemcount, 10035 =>3, 14819 =>1 )) {
   quest::summonitem(4977); 
  }
  plugin::return_items(\%itemcount);
}