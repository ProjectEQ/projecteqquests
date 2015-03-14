sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("I yelled at Calliav when I found Nedaria convulsing after he'd spoken to her. I have no idea what he did, but it's my job to protect her so I don't feel terrible for screaming at 'im! I fear his meddling may cost my dear friend Nedaria her life.");
  }
}

sub EVENT_ITEM {
  plugin::return_items(\%itemcount);
}