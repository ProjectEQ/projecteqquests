# NPC: a_Dirulia_cannoneer
#Angelox

sub EVENT_COMBAT{
    quest::say("Your attack on me is an attack on Lady Dirulia! You will not make it far.");
}

sub EVENT_DEATH{
  quest::say("My death should have come at sea!");
 }

# when a pc dies; "a Dirulia cannoneer hurls a body against the ship walls. 'That barely tested my abilities. Would anyone else care for a go?"

# EOF zone: dulak