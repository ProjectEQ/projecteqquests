sub EVENT_SPAWN {
  plugin::SetAnim(dead);
}
sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("Keep your voice down! We must not attract any [undo attention] to ourselves here. I may be the liaison for the Temple of Singular Might, but that doesn't make me any less of a target. I have kept watch of this temple since we began collecting information on the trusik and the Legion of Mata Muram. You should ask Kevren for more information on them if you haven't already.");
  }
  if ($text=~/undo attention/i) {
    quest::say("Certainly you do not believe that we are alone here, do you? The Muramites have assigned one of their magic users to gather spiritual artifacts from this area and use their power to gain strength. This creature, which we have dubbed the [Diabolic Destroyer], controls the temple and its inner abominations.");
  }
  if ($text=~/Diabolic Destroyer/i) {
    quest::say("It is one of a fearsome collective that commands minions to do its bidding. The beast's minions recover the artifacts from within the temple. The master then extracts the energy from the artifact to become more powerful. You and your party must venture inside the temple and [eradicate the beast] before it can recover any more artifacts. The Muramites will reinforce their position shortly after it has been defeated, but we cannot allow any single creature of this sort to become too powerful.");
  }
  if ($text=~/eradicate the beast/i) {
    quest::say("Your task is to battle through the temple and enter an entrance to the inner chambers of the Temple of Singular Might. Once inside you must find the Diabolic Destroyer and kill it before it becomes more powerful. You must recover an artifact from the beast and return it to me. Once you have done this, you will be allowed to move onto the next trial. When you are [ready to proceed] and have a group with you, return to me and I shall set you on your way.");
  }
  if ($text=~/ready to proceed/i) {
    quest::say("Very well then, $name. Good luck on your journey through the temple and may you prove to the brotherhood that you are more than meets the eye. The temple awaits...");
    #insert instance zone 294 version 0
  }
}