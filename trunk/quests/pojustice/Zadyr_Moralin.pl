sub EVENT_SAY {
  if ($text=~/hail/i) {
    quest::say("By the Prince, have you come to [free] me from this place?");
  }
  if ($text=~/free/i) {
    quest::say("I must find a way out of this prison, my trial is approaching, so says the warden. Time is running out for me. There is little chance of reprieve, given my [experiments].");
  }
  if ($text=~/expiriments/i) {
    quest::say("My people are fleeing, fleeing underground away from the traitor-elves. We are taking to the tunnels and to the caverns, where we can rebuild our strength, beneath the surface. The Prince will protect our people. My experiments were dire indeed, and yet in times of war one must take every opportunity one can get to defeat one's foe, as I am certain that you would agree. I experimented upon the souls of my [slaves].");
  }
  if ($text=~/slaves/i) {
    quest::say("My House always kept dwarves; they are sturdy, hard-working and durable. It has always been the law of our House never to abuse the slaves, however. The war with the traitors lasted so long, and I saw an opportunity to end it. My research into the binding of mortal souls, and to use that harnessed spiritual power for further incantations, had proceeded to the point at which I required actual living subjects upon which to perform my [rituals].");
  }
  if ($text=~/rituals/i) {
    quest::say("The ritual of binding requires over two whole days of preparation, and the separation and captivation of the subject's soul takes a further two days of rigorous effort. I succeeded, but the price was high. Upon three of my slaves did I perform the rituals, and thrice damned am I for it. I wielded the power of their life's energies with decisiveness. My [victories] were the stuff of legends.");
  }
  if ($text=~/victories/i) {
    quest::say("Against the traitor-elves, my new-found energies from the life-force of my three slaves' trapped souls provided me with the ability to lay waste to whole legions of our enemies. Yet in their foolishness, my peers of the Prince's Elves sought to stop me, and bring me to [justice].");
  }
  if ($text=~/justice/i) {
    quest::say("They took me in my sleep, and for my 'crimes', I was banished here. Banished here like a criminal, rather than a savior of our species! Without my rituals, without my incantations, our people are doomed - they flee to the underworld and hide, like vermin. Even now, I sit here, accused, and were that not torment enough I am constantly reminded of my deeds by the souls of the three that I damned with me.");
  }
}