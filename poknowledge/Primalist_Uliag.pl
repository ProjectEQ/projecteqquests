## Primalist Uliag
## Created April 17, 2010 by mrhodes
##

sub EVENT_SAY {
  if($text=~/hail/i) {
    quest::say("Hello $name!"); # TODO: update text
  }
}