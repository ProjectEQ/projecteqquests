sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Children of the trees, friend and protector of nature. We the brothers and sisters to the wolves and bears. The call of the Great Pine has filled your heart and have found your way here to be tested. Do you wish to be tested in Nature, the art of the Bee, or the way of the Eagle?");
    }
  if ($text=~/nature/i) { #druid test of nature
    quest::say("The test of Nature will show your devotion to and understanding of Mother Nature. Bring me an Efreeti Scimitar, a Lush Nectar, a Fire Sky Ruby, and a Storm Sky Opal to show your devotion. You will then recieve your reward.");
    }
  if ($text=~/bee/i) { #druid test of the bee
    quest::say("The bee is a busy little creature and you too must show industriousness like it. Bring me an Efreeti Statuette, a Wilder's Girdle, and a Piece of Divine Honeycomb to prove your understanding of the bee's art of work.");
    }
  if ($text=~/eagle/i) { #druid test of the eagle
    quest::say("To soar like the eagle is your goal. To do so, you must bring me an Acidic Venom, an Ethereal Ruby, a Spiroc Elder's Totem, and a White-tipped Spiroc Feather. Perhaps then you will know what it means to soar upon the wind.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20739 => 1, 20738 => 1, 20965 => 1, 20740 => 1)) { #druid test of nature using efreeti scimitar, fire sky ruby, lush nectar, storm sky opal
    quest::summonitem(11683); #espri
    quest::exp(100000);
    quest::say("You have done well, young one.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20735 => 1, 20951 => 1, 20734 => 1)) { #druid test of the bee using divine honeycomb, efreeti statuette, wilder's girdle
    quest::summonitem(11684); #honeycomb belt
    quest::exp(100000);
    quest::say("You have done well, young one.");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20736 => 1, 20737 => 1, 20867 => 1, 20958 => 1)) { #druid test of the eagle using acidic venom, ethereal ruby, spiroc elder's totem, white-tipped spiroc feather
    quest::summonitem(14555);  #spiroc banisher focus
    quest::exp(100000);
    quest::say("You have done well, young one.");
    quest::depop();
    }
    plugin::return_items(\%itemcount);
}

sub EVENT_TIMER {
  quest::stoptimer("depop");
  quest::depop();
} 