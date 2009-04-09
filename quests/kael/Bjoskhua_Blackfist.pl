sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("What is it you want, mortal? I have little patience for those who do not come here to study.'");
  }
  if ($text=~/study/i) {
    quest::say("What is it you wish to study?");
  }
  if ($text=~/clrakk/i) {
    quest::say("Clrakk is my youngest brother. He walks a path of shadows and deceit. If he were to battle, it would not be one without weapons or armor. I may use these as a bargaining chip some day. I do not think my family has any more need of these old chest straps.");
  }
  if ($text=~/chest straps/i) {
    quest::say("The chest straps are simply a status symbol to some gladiators and warriors. They are passed down from generation to generation. When a warrior enters one of these contests of the fist, they wear the chest straps of their family. My family was awarded a set of the enchanted chest straps ages ago. None of my brothers save Clrakk would even consider entering the contest.");
  }
  if ($text=~/fist/i) {
    quest::say("Ages ago there was a race of fish men named the Kedge. Prexus spread them throughout the waters of the world and they were prosperous. Rumors abound that even near the waters of velious they had great cities. All at once they seemed to be wiped from the face of Norrath. One of the travelers I recently spoke to informed me that a single Kedge may still live in the lands of Faydwer. As grotesque as it sounds, the backbone of a Kedge may be used to create indestructible scroll cases. Bring me the backbone of this fishman, if he exists, and you will find yourself a richer person.");
  }
}

sub EVENT_ITEM {
  if (plugin::check_handin(\%itemcount, 20524 => 1)) {
    quest::say("Excellent, I guess his entire race is now wiped from Norrath. This will indeed make a wonderful scroll case. I am a giant of my word. Take your prized item and be gone, you greedy little beast!");
    quest::summonitem(25053);
  }
}