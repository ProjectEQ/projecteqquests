#Rogue Epic 1.5 dialogue and handins
sub EVENT_SAY {
  if (($text=~/hail/i) && ($fatestealer >=1)) {
    quest::emote("gazes at you, his amber eyes gleaming. ");
    quest::say("I have been awaiting your arrival. The information that you seek is here, and I have no qualms sharing it with someone of your illustrious background. The name '$name' pops up in idle conversation here more than you would realize. However, my knowledge does come at a price: one pouch of gems. I've no need for your money, but a contribution of gemstones is symbolic of your dedication to the craft and your understanding of the value of that which I am about to impart to you. Nothing of value is ever given freely. You should understand that more than anyone. If you are lacking coin at the moment, a [small task] will do the trick as well. Whichever you'd prefer.");
  }
  if ($text=~/What small task?/i) {
    quest::say("King Raja deserves to be well-fed, and I deserve to be in his good graces. You can take care of both these problems simultaneously by assembling a culinary masterpiece for the King. There are delicacies from far off lands that we have only heard rumors of, but they sound incredibly appetizing. Collect the various foodstuffs on this list. Return them to me and then I will bestow upon you the information you desire. Farewell, $name.");
    quest::summonitem(52334);
  }
}


# end of luclin smithing, started with Master Barkhem



sub EVENT_ITEM
{
  if (plugin::check_handin(\%itemcount, 18554 => 1))
  {
    quest::summonitem("2873");
  }
  if (plugin::check_handin(\%itemcount, 2877 => 1, 2897 => 1))
  {
    quest::summonitem("2877");
  }

  # a pair of shadowscream boots 29828, we're sent by Master Barkhem
  if (plugin::check_handin(\%itemcount, 29828 => 1))
  {
    quest::say("So you're Barkhem's newest student are you? I may not have taken your word for it, but craftsmanship this fine could only be from a student of our Master Smith. Take this and fill it with Shadowscream steel boots. I need 6 pairs to outfit some of my hunters. When you've finished, return the box to me.");
    quest::summonitem(17499); # receive boot case, 6 slots container
  }

  # give a shadowscream boot case
  if (plugin::check_handin(\%itemcount, 29825 => 1))
  {
    quest::emote("inspects the boots for a moment and looks you square in the eyes. 'This is excellent work, $name, you do not disappoint! Would that you could outfit all of my hunters with these boots, but I must not keep your talents all to myself. Take some change for your troubles and this seal back to Barkhem - let him know that I am very impressed with his new protege.'");

    quest::faction(132,10);
    quest::exp(500);
    quest::summonitem(29826); # Rakutah's Seal
  }

  # A Taruun Guild Summons
  if(plugin::check_handin(\%itemcount, 18554 => 1))
  {
    # Application for Citizenship
    quest::summonitem("2873");
  }

  # Notorized Application
  if(plugin::check_handin(\%itemcount, 2897 => 1)){
    quest::say("Allow me to be the first to welcome you. Accept this cloak, young initiate. It is a symbol of your loyalty to our noble people. May it serve you as you serve us all. Present your acrylia slate to Harbin Gernawl and he will give you instruction. May the spirits of the beasts guide you and keep you safe.'");
    quest::summonitem("2878");
  }
  
  if (plugin::check_handin(\%itemcount, 9491 => 1)) {#Rogue Epic 1.5 turnin
    quest::say("Mmm, that is a delicious aroma. The King will most definitely be pleased, $name. And now it seems I owe you a favor.' He pauses momentarily as if gathering his thoughts then speaks. 'Let me ask you, what is the greatest advantage of a Vah Shir's claws?' He retracts a single dark claw and holds it forward, studying it with his amber eyes. 'The design is simple but beautifully effective. Elegant, sharp, and dangerous. Most importantly, I want you to notice this: our enemies feel the claw's pierce twice, both when penetrated and when the implement of pain is ripped out. That is key to creating the perfect blade. I can describe the topic more fully in writing. There you are, I've scribbled some notes in your journal.");
    quest::emote("You have coerced Rakutah into revealing his secret.");#need to add 1.5 global here
  }

  plugin::try_tome_handins(\%itemcount, $class, "Rogue");
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:sharvahl  ID:155169 -- Master_Taruun_Rakutah