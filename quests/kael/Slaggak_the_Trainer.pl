# Coldain Heads/Slaggak's Bounty quests

sub EVENT_SAY {
  # Require Indifferent and better faction
  if ($faction <= 5) {
    if ($text=~/hail/i) {
      quest::say("Hello there, $race. I am Slaggak, the trainer. The Kromrif here will soon be ready to serve the great and honorable King Tormax.");
    }
    if ($text=~/serve/i) {
      quest::say("So you say, little one. Why are you here, then? You should be out slaying those pestering little Coldain or maybe those damnable shard wurms and wyverns.");
    }
    if ($text=~/coldain/i) {
      quest::say("The Coldain are the ice dwarves. They have defiled our lands for long enough. Thinking of them makes my blood run hot. With my new position as trainer, I am not allowed to roam the lands and slaughter their kind as I once did.' Slaggak sighs. 'I long for the days when I could fashion necklaces from their skulls.");
    }
    if ($text=~/skulls/i) {
      quest::say("Go from here and seek out the Coldain, slay them, and return to me with their heads. I wish to fashion four skull talismans as I once did. If you can do this for me, I will surely let King Tormax know of your deeds and reward you with a piece of armor from the Militia armory.");
    }
    if ($text=~/shard wurm/i) {
      quest::say("You must have seen the shard wurms by now! The lizards that roam the lands eating whatever they can find? They can grow to be quite ferocious! Not nearly as ferocious as their ancient cousins, the dragons, but a nuisance nonetheless. We have a bounty on those beasts here in Kael Drakkel.");
    }
    if ($text=~/bounty/i) {
      quest::say("If you think you have what it takes to slay the shard wurms or their relatives, the wyverns, bring back proof of your exploits. For every four shard wurm fang you bring me, I am authorized to reward you with a pair of cerulean greaves. Every fourth ice wyvern stinger will grant you a pair of vambraces.");
    }
  }
  else {
    quest::say("Your loyalty to our ideals has yet to be proven.");
  }
}

sub EVENT_ITEM {
  # Require Indifferent and better faction
  if ($faction <= 5) {
    # Coldain Head
    if (plugin::check_handin(\%itemcount, 30081 => 1)) {
      # Choose a random Giant Scalemail piece
      my $rand = quest::ChooseRandom(25011, 25016, 25013, 25010, 25017, 25014, 25007, 25005, 25015, 25009, 25006, 25012, 25018);
      quest::summonitem($rand);
    }
    
    # Shard Wurm Fangs
    elsif (plugin::check_handin(\%itemcount, 25100 => 4)) {
      quest::summonitem(25071);
    }

    # Ice Wyvern Stingers
    elsif (plugin::check_handin(\%itemcount, 25101 => 4)) {
      quest::summonitem(25070);
    }

    else {
      quest::say("I have no use for this, $name.");
      plugin::return_items(\%itemcount);
      return 1;
    }

    quest::say("You are truly a worthy little $race. I hope this armor serves you well. If it does not, I am sure a mercenary such as yourself could find a buyer.");

    quest::faction(188, 20);  # +Kromrif
    quest::faction(189, 20);  # +Kromzek
    quest::faction(49, -60);  # -Coldain
    quest::faction(42, -60);  # -Claws of Veeshan
    
    quest::exp(100);

  }
  else {
    quest::say("I will do nothing to aid the likes of you.");
  }
}

# Quests by mystic414