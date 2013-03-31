sub EVENT_SAY {
   if ($text=~/fishing spot/i) {
      quest::say("I need this spot!! I fish to feed my growling tummy. I can no longer [venture into Kaladim] and eat in its fine taverns.");
   } elsif ($text=~/venture into kaladim/i) {
      quest::say("I have been disgraced!! I used to be a respected paladin of the Church of Underfoot until I failed to complete a very [important task] for Lord Datur Nightseer. He stripped me of my Cape of Underfoot. I cannot walk the halls of Kaladim without my cape.");
   } elsif ($text=~/important task/i) {
      quest::say("I was ordered by Lord Nightseer to carry the [Chalice of Conquest] to a noble band of paladins in the mountains of Rathe. While there, the entire camp was overtaken by a band of orcs. During the battle there was a [strange occurrence].");
   } elsif ($text=~/chalice of conquest/i) {
      quest::say("The Chalice of Conquest is said to have been delivered to the Church of Underfoot by Brell himself. It is said that whoever drinks from the chalice is assured victory in battle. It is also said that only good-natured creatures may safely drink from it and only a comatose state is assured to any evil creature who dares to sip from it.");
   } elsif ($text=~/strange occurrence/i) {
      quest::say("A large fray raged. Brave, valiant paladins fought vile, green-skinned orcs and while this happened, I spied the [Chalice of Conquest] being taken away from the camp. I was then distracted by a well placed orcish blade. After I defeated the orcs in my way, I turned to see a blue orc running toward the horizon. I gave chase to no avail. I lost the chalice and all respect. If only a [noble Paladin of Underfoot] would assist me...");
   } elsif ($text=~/noble paladin of underfoot/i) {
      if ($faction > 4) {
         quest::say("How dare you approach a member of the Clerics of Underfoot?! Dogs such as you lie in the same bed as aviaks and ogres!!");
      } else {
         quest::say("Yes, you shall do, noble $name. Take this. This is the Chalice Case. It is intended for the Chalice of Conquest and the [Candle of Bravery]. If you should get both, be sure to place them within the Chalice Case and combine them. Take the full Chalice Case to Lord Nightseer in Kaladim and I shall be redeemed and you shall surely earn a fine paladin's reward. Let your quest begin in the mountains of Rathe.");
         quest::summonitem(17976);
      }
   } elsif ($text=~/candle of bravery/i) {
      quest::say("The Candle of Bravery is ceremonial and is lit when one sips from the [Chalice of Conquest]. The candlestick was left with a fellow Paladin of Underfoot in the Rathe Mountains. The candle itself was lost and I do not know where Priestess Ghalea purchases them.");
   }
}

sub EVENT_ITEM {
   if (plugin::check_handin(\%itemcount, 12281 => 1)) {
      quest::say("I thank you, my friend. You are truly a great paladin and noble addition to our ranks. I now can walk in Kaladim. Take this as a reward. It is the Holy Partisan of Underfoot. It is now yours. I believe it still has a couple of charges. Use it wisely as the only cleric able to recharge it was lost amid the lava filled lands of Antonica.");
      quest::faction(246, 25);
      quest::faction(169, 25);
      quest::faction(44, 25);
      quest::faction(351, 25);
      quest::exp(750);
      quest::summonitem(5376, 5);
   }
   plugin::return_items(\%itemcount);
}