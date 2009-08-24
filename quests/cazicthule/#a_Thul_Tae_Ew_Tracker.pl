sub EVENT_SPAWN {
  quest::say("So, there you are, little Gnome. Thought you evaded us? Your friends will never protect you. You will all fall before our power!");
}

sub EVENT_DEATH {
  quest::signal(48040,0);
}