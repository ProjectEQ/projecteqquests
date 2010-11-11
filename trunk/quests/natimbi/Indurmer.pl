sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::emote("holds an index finger to his pursed transparent lips.");
    quest::say("Shhh! Be as quiet as you can. I'm trying to avoid the Legion of Mata Muram. They'll surely kill us if they find we're here.");
  }
  if ($text=~/dead/i) {
    quest::emote("is aghast with disbelief.");
    quest::say("No, that can't be...I'm not...Dead. You're lying! You're a filthy boldfaced liar!");
    quest::attack($name);
  }
}