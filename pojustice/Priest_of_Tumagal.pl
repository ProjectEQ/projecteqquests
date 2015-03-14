sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("'Seek ye the way to avoid Justice, $name?' He laughs a hearty laugh, which fades in and out as his body materialises and dematerialises before you. 'Ye might as well try and escape Time itself. I spent more than my fair share of time here, an eternity it was. In the endless millennia that this place has served the universe, there have been more than a few attempts at escape. Walk the [tunnels] some have. . . but fleeing justice is much like trying to outrun yer own shadow.");
  }
  if ($text=~/tunnels/i) {
    quest::say("'What ye see here is the combined effort of the countless aeons of inhabitants bidding to escape the clutches of Justice. I would not break yer hopes, but none o' them made it out.' He bursts into laughter again. 'Well, nearly all o' them. . .");
  }
}
#END of FILE Zone:pojustice  ID:Not_Found -- Priest_of_Tumagal