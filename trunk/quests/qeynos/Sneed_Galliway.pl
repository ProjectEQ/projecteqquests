sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Hello, $name. I am Sneed Galliway, merchant and citizen. I run the only general store in all of Qeynos, serving the needs of the many adventurers who call Qeynos home. If only one of them would take the time to help me with my er... [problem]...");
    }
    if ($text=~/tax collection/i) {
      quest::say("Hey, $name, how the heck did Vicus convince you to do his job? He better be paying you well. Here you go.");
      quest::faction( 217, -10);
      quest::summonitem(13172);
    }
}