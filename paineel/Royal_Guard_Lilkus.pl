#########################################################################
# ZONE: Paineel (paineel)
# DATABASE:  PEQ-YKESHA-beta1
# LAST EDIT DATE: November 8, 2007
# VERSION: 1.1
# DEVELOPER: Diuretic Effluent (Original Source Unknown but Not Me)
# REVISION NOTES: Fixed gross punctuation errors copied from Allakhazam.
#                 Fixed wrong factions. Added XP award to emulate live.
#
# *** NPC INFORMATION ***
#
# NAME: Royal_Guard_Lilkus
# ID: 75074
# RACE: 3
# CLASS: 1
# LEVEL: 50
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Kobold Molar ID-1761
#
# *** QUESTS INVOLVED IN ***
#
# Kobold Molars (evil)
#
# items: 1761, 3120, 3123, 3115, 3117, 3122, 3113, 3116, 3118, 3121, 3124, 3119, 3108, 3107, 3111, 3103, 3105, 3110, 3101, 3104, 3106, 3109, 3112, 3132, 3135, 3127, 3129, 3134, 3125, 3128, 3130, 3133, 3136, 3131



sub EVENT_SAY {
if($text=~/Hail/i){
quest::say("You tread upon sacred ground, $race. None may go further unless they [have business with the Overlord], or, if you're looking to gain favor with the heretics and need a little coin, I have a [job] for you.");
}
if($text=~/business/i){
quest::say("The Overlord only sees those he calls forward. If you have a summons from him, I will escort you and announce your arrival. If not, then forget whatever business you may have had here. If you wish an audience, then go speak to Sheltian below. He may be able to help you.....if you help him.");
}
if($text=~/job/i){
quest::say("There are many campaigns we administer from within our city, Paineel. Some of these campaigns are threatened or hindered by annoyances. One of these annoyances are the kobolds that live in the filth of a cave not far from here. Find that lair and kill as many of these beasts as you can. For every kobold molar you return, you shall be rewarded."); 
}
 }
sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 1761=> 1)) {
    quest::say("Not bad, $name. Here is your reward. If you slay enough of these dogs, Sheltuin may have a more important task for you to perform.");
    my $random_result = int(rand(10));
    if($random_result==1) {
      quest::summonitem(quest::ChooseRandom(3120,3123,3115,3117,3122,3113,3116,3118,3121,3124,3119,3108,3107,3111,3103,3105,3110,3101,3104,3106,3109,3112,3132,3135,3127,3129,3134,3125,3128,3130,3133,3136,3131)); # Item(s): Small Ringmail Sleeves (3120), Small Ringmail Pants (3123), Small Ringmail Neckguard (3115), Small Ringmail Mantle (3117), Small Ringmail Gloves (3122), Small Ringmail Coif (3113), Small Ringmail Coat (3116), Small Ringmail Cape (3118), Small Ringmail Bracelet (3121), Small Ringmail Boots (3124), Small Ringmail Belt (3119), Ringmail Sleeves (3108), Ringmail Skirt (3107), Ringmail Pants (3111), Ringmail Neckguard (3103), Ringmail Mantle (3105), Ringmail Gloves (3110), Ringmail Coif (3101), Ringmail Coat (3104), Ringmail Cape (3106), Ringmail Bracelet (3109), Ringmail Boots (3112), Large Ringmail Sleeves (3132), Large Ringmail Pants (3135), Large Ringmail Neckguard (3127), Large Ringmail Mantle (3129), Large Ringmail Gloves (3134), Large Ringmail Coif (3125), Large Ringmail Coat (3128), Large Ringmail Cape (3130), Large Ringmail Bracelet (3133), Large Ringmail Boots (3136), Large Ringmail Belt (3131)
    }
    quest::exp(2000);                 # Experience
    quest::givecash("8","2","0","0"); # Cash
    quest::faction("231","-1");        # Craftkeepers
    quest::faction("233","-1");        # Crimson Hands
    quest::faction("265","1");        # Heretics
    quest::faction("242","-1");        # Deepwater Knights
    quest::faction("254","-1");       # Gate Callers
  }
  plugin::return_items(\%itemcount);
} 
#END of FILE Zone:paineel  ID:75074 -- Royal_Guard_Lilkus
