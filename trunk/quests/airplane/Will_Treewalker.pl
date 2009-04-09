sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("The tests of old are difficult and dangerous, but the rewards for perseverance are great. I hold rewards for three tests. The test of the Wolf, test of the Bear and the test of the Tree.");
    }
  if ($text=~/test of the wolf/i) { #druid test of the wolf
    quest::say("So you wish the test of The Wolf do you? Go forth unto the islands and find an Azure Tessera, Black Face Paint and finally a Worn Leather Mask. Bring them back to me, but not until you have all three and you shall be rewarded.");
    }
  if ($text=~/test of the bear/i) { #druid test of the bear
    quest::say("Ah, the test of The Bear It Is. Find In this plane a Copper Disc, a Sky Emerald and a Mantle of Woven Grass. Bring all three at one time to me for your reward.");
    }
  if ($text=~/test of the tree/i) { #druid test of the tree
    quest::say("The test of The Tree Is said to be a test of Nature and only those stout of limb and bark will succeed. Bring to me a Diaphanous Globe, some Hardened Clay and a Spiroc Battle Staff. Hand them all to me at once and the Reward will be yours.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20930 => 1, 20728 => 1, 20729 => 1)) { #druid test of the wolf using azure tessera, black face paint, worn leather mask
    quest::summonitem(2706);  #drake-hide mask
    quest::exp(100000);
    quest::say("Good work.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20936 => 1, 20731 => 1, 20730 => 1)) { #druid test of the bear using copper disc, mantle of woven grass, nature walker's sky emerald
    quest::summonitem(2705); #nature walker's mantle
    quest::exp(100000);
    quest::say("Good work.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20943 => 1, 20732 => 1, 20733 => 1)) { #druid test of the tree using diaphanous globe, hardened clay, spiroc battle staff
    quest::summonitem(6411); #shillelagh
    quest::exp(100000);
    quest::say("Good work.");
    quest::depop();
    }
  else {
    quest::say("What am I supposed to do with these?");
    plugin::return_items(\%itemcount);
    }
}

sub EVENT_TIMER {
  quest::depop();
  quest::stoptimer("depop");
} 