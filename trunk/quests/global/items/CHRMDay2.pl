#This charm gains power during the hours of daylight.

my %scale = (
  0 => 10,
  1 => 8,
  2 => 6,
  3 => 4,
  4 => 2,
  5 => 4,
  6 => 6,
  7 => 8,
  8 => 10,
  9 => 12,
 10 => 14,
 11 => 18,
 12 => 20,
 13 => 20,
 14 => 20,
 15 => 20,
 16 => 20,
 17 => 20,
 18 => 18,
 19 => 18,
 20 => 16,
 21 => 16,
 22 => 14,
 23 => 12
);

sub EVENT_SCALE_CALC {
  $questitem->SetScale($scale{$zonehour}/20);
}