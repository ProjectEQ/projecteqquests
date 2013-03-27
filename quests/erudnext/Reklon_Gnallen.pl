# Paladin Epic 1.0
# NPCID: 24044
# Zone: erudnext

sub EVENT_SAY {
    if ($text=~/Hail/i) {
        quest::say("Hail to you, friend.  Seek you knowledge or atonement in this temple of peace?");
    }
    if ($text=~/i seek knowledge/i) {
        quest::say("Many are the things I could speak to you of.  Have you any specific interest?");
    }
    if ($text=~/i seek atonement/i) {
        quest::say("Yes.  Many are those who enter these halls seeking the forgiveness, the atonement of a god.  By turning their spirit against whatever wrong they have committed they may be able to receive redemption in the eyes of their diety.  Many seek such a thing, but few truly have the strength of spirit to attain it.");
    }
    if ($text=~/temple of peace/i) {
        quest::say("Dedicated to the god of peace, Quellious, is this temple. It is here that her clerics and paladins pray and receive inspiration.");
    }
    if ($text=~/paladins/i) {
        quest::say("As the clerics are the warm hand of healing, the paladins are the stalwart shield of protection, and in times of grave need the sharp sword of justice. To our post must we always remain vigilant, else dishonor might befall us.");
    }
    if ($text=~/remain vigilant/i) {
        quest::say("To a paladin the upholding of his duty, or honor to his temple is foremost. To fail in his duty to stand at his assigned post in time of need is a great disgrace. Few are the paladins who have done so, and their spirits have been outcast from the god of peace.");
    }
    if ($text=~/outcast/i) {
        quest::say("Harsh though it seems, a true paladin must always remain vigilant and dedicated to his cause. If he does not then he might find himself fallen from grace.");
    }
    if ($text=~/fallen from grace/i) {
        quest::say("here are a few who have done so. Only a few that come to mind. Such stories are useful to remember as reminders of our beliefs.");
    }
    if ($text=~/stories/i) {
        quest::say("One is the story of the paladin who fell due to his weakness in the duty of his guard post. He let himself be seduced by a peasant woman");
    }
    if ($text=~/peasant woman/i) {
        quest::say("Many hundreds of years ago did this story begin. There was a paladin, whose name is lost to all but our oldest leaders, who was among the greatest examples of honor. It was his post to guard the chambers to our most important halls. His fall was a creature in the guise of a poor peasant woman.");
    }
    #I couldn't find any further text here
    if ($text=~/sacrifice/i) {
        quest::say("Only this crest and the sacrifice of something that symbolizes your strength and purity will release his spirit into the cleansing flames of our lady Quellious. Go now.");
    }
}

sub EVENT_ITEM {
  if(plugin::check_handin(\%itemcount, 29001 => 1, 29006 => 1)) {
    quest::emote("presses the gem of purity against the breastplate. Its dark gleam softens and then glows bright once again. 'Compassion is strong in you. Few so called heroes would sacrifice their time for such a menial task as you performed. Continue your work. Hold this ancient breastplate until you have completed your task.");
    quest::summonitem(29004);
  }
  elsif (plugin::check_handin(\%itemcount, 29000 => 1, 29009 => 1)) {
    quest::emote("washes the sword's blade in the water of purity. Its dark surface begins to shine, as true as the day it was forged. 'Such a sacrifice is rare among the poor. Truly, the woman must have loved her brother. Remember the lesson you have learned from her. Keep the sword until your work is done.'");
    quest::summonitem(29003);
  }
  elsif (plugin::check_handin(\%itemcount, 29003 => 1, 29004 => 1, 29005 => 1)) {
    quest::say("I never thought our order would see these artifacts again. With the return of these relics we can now put at ease a scar upon the history of our order. This cleansing will atone for his failure. Your soul must be pure to have given so freely of yourself. Go now, take this crested token of our order. If you wish to free his soul you must undertake another sacrifice.");
    quest::summonitem(29010);
  }
  #do all other handins first with plugin, then let it do disciplines
  plugin::try_tome_handins(\%itemcount, $class, 'Paladin');
  plugin::return_items(\%itemcount);
}
#END of FILE Zone:erudnext  ID:24044 -- Reklon_Gnallen