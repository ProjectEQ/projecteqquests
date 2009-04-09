sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings there lad. Come seekin glory then have ya? Alrighty

then, glorious ye shall be. Take me tests here, and I will show ya the light

there. Take ye the Test of Resolution, of Theurgy, or the Weak?");
    }
  if ($text=~/resolution/i) { #cleric test of resolution
    quest::say("The test of resolution be an easy one. Trust me there! Just

needin bring me a Spiroc Stattuete, a Spiroc Healing Totem, and a Silvered

Spiroc Necklace. Ne'r liked those birdies anyway.");
    }
  if ($text=~/theurgy/i) { #cleric test of theurgy
    quest::say("The test of Theurgy. Ne'r understood it meself. It calls fer

you ta bring me an Efreeti Mace, a Saffron Spiroc Feather, a Glowing

Sapphire, and a Djinni Aura.");
    }
  if ($text=~/weak/i) { #cleric test of the weak
    quest::say("Aye, the weak. I laugh at 'em. Right after I put 'em in their

places. Aye. Bring me there lad, a Efreeti Standard, a Manna Nectar, and a

Shimmering Topaz. Yup, that'll do it.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20813 => 1, 20812 => 1, 20954 => 1)) {#cleric test of resolution using silvered spiroc necklace, spiroc healing totem, spiroc statuette
    quest::summonitem(14562); #necklace of resolution
    quest::exp(100000);
    quest::say("Good on ya!");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20815 => 1, 20816 => 1, 20814 => 1,

20961 => 1)) { #cleric test of theurgy using djinni aura, efreeti mace, glowing sapphire, saffon spiroc feather
    quest::summonitem(27718); #theurgist's star
    quest::exp(100000);
    quest::say("Good on ya!");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20817 => 1, 20968 => 1, 20819 => 1,

20818 => 1)) { #cleric test of the weak using efreeti standard, manna nectar, mithril bands, shimmering topaz
    quest::summonitem(11691); #truwian baton
    quest::exp(100000);
    quest::say("Good on ya!");
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