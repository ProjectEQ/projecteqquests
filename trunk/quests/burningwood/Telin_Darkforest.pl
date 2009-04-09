# Start of the ranger and druid epic quests
#

sub EVENT_SAY {
  if ($faction < 4) {
    if ($text=~/hail/i) {
      quest::emote("looks at you serenely. 'Hello, wanderer.'");
    }
    if ($text=~/what are you doing/i) {
      quest::say("Mighty this place must have been, once. Now scarred by hatred and suffering. I have been sent here seeking answers to problems not yet understood.");
    }
    if ($text=~/answers/i) {
      quest::emote("considers you for a few moments before speaking. 'A great evil walks across the land. The hand of some demon we don't yet know is twisting and polluting forests.'");
    }
    if ($text=~/evil/i) {
      quest::say("If I knew that, I wouldn't be here looking for answers. I would be elsewhere, looking for solutions. For now, I suspect much but know little.");
    }
    if ($text=~/suspect/i) {
      quest::emote("looks at you and sighs. 'The lands are changing. Beasts, large and small, have turned upon those who watched over them. Druids and rangers, worshippers of both Karana and Tunare, have reported a feeling of hatred throughout their once peaceful lands.'");
    }
    if ($text=~/innoruuk/i) {
      quest::emote("raises his eyebrow slightly and a subtle look of surprise creeps across his face. 'Innoruuk? Perhaps. Aye. It must be. Perhaps I knew and didn't want to consider the possibility. It must be this though, and some action will have to be taken.'");
    }
    if ($text=~/action/i) {
      if ($ulevel >= 46) {
        quest::emote("looks at you consideringly and then scribbles something quickly on a small, worn paper. 'You seem powerful enough. Perhaps you can help those who seek to protect nature's peace. Take this note. Deliver it only into the hands of Faelin Bloodbriar. Where you will find her, I cannot say. She is a friend of mine and a wanderer. She has been seen from one end of the lands to the other. Seek her out, and quickly.'");
        quest::summonitem(20472);
      }
      else {
        quest::say("You are not yet powerful enough to complete this task. Return when you have gained more experience.");
      }
    }
  }
  else {
    quest::say("I can not trust you with such important information, yet.");
  }
}

sub EVENT_ITEM {
  if ($faction < 4) {
    if (plugin::check_handin(\%itemcount, 20447 => 1)) {
      quest::emote("scratches the coin as he looks at it. 'Faelin sent you to Giz? Surprising. This coin speaks to the outcome of your talk. He would hardly give this bit of metal to a stranger, but that's a story for a different time. So, you say Giz did confirm Innoruuk's involvement, and something about undead minions? Here, take this coin back. Find Arch Druid Althele in the Karanas and show her that. Tell her what we have discussed. She will look kindly on an ally in this matter.'");
      quest::summonitem(20448);
    }
    elsif (plugin::check_handin(\%itemcount, 20468 => 1)) {
      quest::emote("nods as he unbuckles his sword and hands it to you. 'The storm callers are working on containing and fighting against the corruption but they can not hold back the inevitable for long. It is up to us to strike against Innoruuk directly. If we were warriors or paladins we would have a fancy ceremony and plenty of feasting but we're just rangers, without time for pleasantries. The sword you hold in your hands is one of the oldest blades known, even to the eldest. To strike at the darkest heart of evil requires a weapon beyond this, or even ones you may carry at your side. The first task, the first preparation you must make, is the smithing of that blade. Its edge sharpened, its balance made perfect. When you have finished, bring me this sword again.'"); 
      quest::exp(1000000);
      quest::summonitem(20477);
    }
    elsif (plugin::check_handin(\%itemcount, 20481 => 1)) {
      quest::emote("smiles slowly. 'Now that's fine work, $name. Just a moment, we have a friend here who can enchant one of the blades. Give her the blade that the ancient smithed.'");
      quest::summonitem(20481);
      quest::spawn2(54237,0,0,2852,3239,-155,109.5);
    }
    else {
      plugin::return_items(\%itemcount);
    }
  }
  else {
    quest::emote("will not accept this item.");
    plugin::return_items(\%itemcount);
  }
}
# EOF zone: burningwood ID: 87082 NPC: Telin_Darkforest

