sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("I am Draan N'Ryt, provider of the purest [adamantite ore] and master smith of [adamantite chainmail]!");
  }
  if($text=~/adamantite ore/i) {
    quest::say("Adamantite ore is a very special metal that we smith in our unique Teir'Dal forge with our highly specialized techniques. It is also used by ogres in the crafting of their war plate and weapons. Adamantite ore can be worked like standard ores into bricks, blocks, and sheets but must be tempered with Neriak Nectar instead of water. Folded sheets of adamantite must also be tempered with Neriak Nectar and must be hammered with our Teir'Dal smithy hammer instead of the crude standard one. Our Teir'Dal enchanters have also developed the means to enchant small bricks of adamantite. Ogres may work adamantite ore in their forge as well but they must temper it with Ogre Swill instead of Neriak Nectar and because of their immense strength still use the standard smithy hammer.");
  }
  if($text=~/adamantite chainmail/i) {
    quest::say("Adamantite chainmail can only be crafted in our unique Teir'Dal forge using our highly specialized smithing techniques. It is a durable armor that is so light, it does not hinder even those who practice the mystical arts. All pieces of adamantite chainmail require the appropriate chain pattern for the piece desired, a Teir'Dal smithy hammer, a silk swatch, and shadow temper. Veils, neckguards, and bracelets require one set of adamantite rings. Coifs, mantles, skirts, sleeves, and gloves require two sets of adamantite rings. Tunics, capes, and leggings require three sets of adamantite rings. Once you have mastered the art of crafting adamantite chain you may want to attempt [enchanted adamantite] chainmail.");
  }
  if($text=~/enchanted adamantite/i) {
    quest::say("Enchanted adamantite chainmail requires an appropriate chain pattern for the piece desired, a Teir'Dal smithy hammer, a silk swatch, and shadow temper. Like standard adamantite chain it may only be crafted in our Teir'Dal Forge but requires that the rings be crafted from enchanted adamanatite.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:neriakc  ID:42086 -- Draan_N`Ryt