sub EVENT_SPAWN {
  quest::settimer("depop",300);
}

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Euh? You come see Ooga about shaman tests? Me can test in shrink,

the snake, or witch doctor! What yuz want to test in?");
    }
  if ($text=~/shrink/i) { #shaman test of shrink
    quest::say("Ohh! Dat gud tes, me know cuz me did it. Me had get a Efreeti War

Club, Djinni Statuette, sum Corrosive Venom an sum Wooden Bands. Was hard for

Ooga, me took long to get dem. Yuz give all to me at sam time me give yuz what me

got.");
    }
  if ($text=~/snake/i) { #shaman test of the snake
    quest::say("Mmm, tes of snake not too bad, me did It an still alive. When me

did It, me got Emerald Spiroc Feather, Bixie Essence, an Spiritualists Ring. Me

get gud stuff for dat. Yuz giv me stuff all at once an me give to yuz what me

got.");
    }
  if ($text=~/witch doctor/i) { #shaman test of the witch doctor
    quest::say("Oh! Now yuz got In da big mojo, me had big hard time wit dis one.

Me got In lot of trouble when me got Efreeti War Maul, Thickened Nectar, Fire Sky

Ruby an Symbol Of Veeshan. Yuz giv to me, Me be easy on yuz an giv prize me

got.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20845 => 1, 20955 => 1, 20842 => 1, 20841

=> 1)) { #shaman test of shrink using efreeti war club, djinni statuette,

corrosive venom, wooden bands
    quest::summonitem(27729); #warhammer of the wind
    quest::exp(100000);
    quest::say("");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20962 => 1, 20843 => 1, 20844 => 1)) {

#shaman test of the snake using emerald spiroc feather, bixie essence,

spiritualist's ring
    quest::summonitem(27730); #vermilion sky ring
    quest::exp(100000);
    quest::say("");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20846 => 1, 20969 => 1, 20848 => 1,

20847 => 1)) { #shaman test of the witch doctor using efreeti war maul, thickened

nectar, fire sky ruby, symbol of veeshan
    quest::summonitem(11694); #garduk
    quest::exp(100000);
    quest::say("");
    quest::depop();
    }
  else {
    quest::say("Whut I do wit dese?");
    plugin::return_items(\%itemcount);
    }
}

sub EVENT_TIMER {
  quest::depop();
  quest::stoptimer("depop");
} 