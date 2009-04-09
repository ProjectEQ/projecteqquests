sub EVENT_SPAWN {
  quest::settimer("depop",300);
} 

sub EVENT_SAY{
if($text=~/Hail/i){
quest::say("Ogog not smart, but Ogog smarter than you.  You ready for Ogog or no?");
}
if($text=~/ready/i){
quest::say("Ok, $name.  Ogog got some hard things for you.  You do bash, smash, or think test?");
}
if($text=~/think/i){
quest::say("Ogog think you can do this one maybe, Ogog no know, though.  You bring Ogog efreeti belt, pegasus statue, a spiroc wind totem, and a wind tablet.  Ogog say good luck!");
}
if($text=~/smash/i){
quest::say("Ogog smash good. . . Ogog no think you can smash good.  But Ogog let you try.  You get Ogog Djinni War Blade, some virulent wasp poison, and a mottled spiroc feather.  Ogog say you good warrior if you do this!");
}
if($text=~/bash/i){
quest::say("This one hard, Ogog like it.  Ogog need efreeti battle axe, some honey nectar, bottled djinni, and ethereal emerald. Then Ogog make you best basher."); 
 }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 20983 => 1, 20963 => 1, 20981 => 1, 20982

=> 1)) { #warrior test of bash using efreeti battle axe, honeyed nectar, bottled

djinni, ethereal emerald
    quest::summonitem(11675); #fangol
    quest::exp(100000);
    quest::say("Yuz do good! Take dis!");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20980 => 1, 20979 => 1, 20956 => 1)) {

#warrior test of smash using djinni war blade, virulent poison, mottled spiroc

feather
    quest::summonitem(11674); #dagas
    quest::exp(100000);
    quest::say("Yuz do good! Take dis!");
    quest::depop();
    }
  elsif(plugin::check_handin(\%itemcount, 20976 => 1, 20949 => 1, 20977 => 1,

20978 => 1)) { #warrior test of think using efreeti belt, pegasus statuette,

spiroc wind totem, wind tablet
    quest::summonitem(11673); #belt of the four winds
    quest::exp(100000);
    quest::say("Yuz do good! Take dis!");
    quest::depop();
    }
  else {
    quest::say("Whut Ogog do wit deze?");
    plugin::return_items(\%itemcount);
    }
}

sub EVENT_TIMER {
  quest::depop();
  quest::stoptimer("depop");
} 
