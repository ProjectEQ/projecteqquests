# hint text leading to two quests
#

sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Greetings, $name, and welcome to the House of Midst. I am House Ambassador Lamukas Kaesoanls. I am a direct descendant of Gidins Kaesoanls, one of the original magicians responsible for opening the portal to the wondrous and magical world of Luclin. If you are interesting in assisting the House of Midst please visit Beriol or Palomidiar in the library.");
  }
}

# EOF zone: shadowhaven ID: 150082 NPC: Lamukas_Kaesoanls

