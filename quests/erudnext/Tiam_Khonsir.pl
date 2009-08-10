#########################################################################

# ZONE: Erudin (erudnext)
# DATABASE:  PEQ-YKESHA-FINAL
# LAST EDIT DATE: November 30, 2007
# VERSION: 1.1
# DEVELOPER: Diuretic Effluent
# REVISION NOTES: Actually filled out the kobold quest crunch.
#
# *** NPC INFORMATION ***
#
# NAME: Tiam Khonsir
# ID: 75074
# RACE: 3
# CLASS: 22
# LEVEL: 61
#
# *** ITEMS GIVEN OR TAKEN ***
#
# Kobold Molar ID-1761
#
# *** QUESTS INVOLVED IN ***
#
# Kobold Molars (good)
# Kobold Shaman Artifacts
#

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Greetings, $name. Are you a follower of our order, the Deepwater Knights, servants of the Ocean Lord, Prexus?");
  }
  if($text=~/yes/i) {
    quest::say("That is good, $name. Our followers are few but our faith is strong. With the efforts of those few, our destiny may be reached in time. We must walk with perseverence and devotion, much like the tides that, over time, can destroy a mighty stone cliff. Have you [come to serve our Lord], $name?");
  }
  if($text=~/come to serve our lord/i) {
    quest::say("Then I shall send you on a quest to prove your devotion. No doubt you have seen the vermin kobolds scuttling about the land as fleas upon a mangy dog. The kobolds have a lair on our continent from which they launch their wantonly destructive raids. You are to enter that lair and destroy as many of these dogs as you can. For each molar you bring me, you will receive praise, admiration, and perhaps some coin.");
  }
  if($text=~/quest of greater importance/i){
    quest::say("Very well then, $name, you may be able to help us. Go to Breya and tell her I sent you. She will brief you.")
  }
}

sub EVENT_ITEM {
  my $random_result = int(rand(4));

  if(plugin::check_handin(\%itemcount, 1761=> 1)) {
    quest::say("Wonderful work, friend $name. One less land dwelling, flea ridden, primitive for our wondrous lord to sweep aside when the apocalypse is upon us. Here is your reward. Perhaps if you gather enough molars, we can offer you a [quest of greater importance].");
    if($random_result == 1) {
      quest::summonitem(quest::ChooseRandom(3120,3123,3115,3117,3122,3113,3116,3118,3121,3124,3119,3108,3107,3111,3103,3105,3110,3101,3104,3106,3109,3112,3132,3135,3127,3129,3134,3125,3128,3130,3133,3136,3131));
    }
    quest::exp(2000);
    quest::givecash(12,14,5,0); # Copper x 12, Silver x 14, Gold x 5
    quest::faction(145,5); # High Council of Erudin
    quest::faction(143,-5);# Heretics
    quest::faction(79,5);  # Deepwater Knights
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}

#END of FILE Zone:erudnext  ID:98051 -- Tiam_Khonsir