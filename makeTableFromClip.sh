#!/bin/bash

allNames=$( xclip -o )
nameOfSchool='Gymnázium Plzeň, Mikulášské náměstí 23, Plzeň'
echo "$nameOfSchool"
echo
echo

i=15
while read -r name; do
  echo '<tr>'
  echo '<td>'$i'.</td>'
  echo '<td> '"$name"'</td>'
  echo '<td>'"$nameOfSchool"'</td>'
  echo '</tr>'
  let i=i+1
done <<< "$allNames"
  
