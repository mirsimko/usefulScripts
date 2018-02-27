#!/bin/bash

allNames=$( xclip -o )
nameOfSchool='Gymnázium Plzeň, Mikulášské náměstí 23, Plzeň'

counter=15
while read -r name; do
  echo '<tr>'
  echo '<td>'$counter'.</td>'
  echo '<td> '"$name"'</td>'
  echo '<td>'"$nameOfSchool"'</td>'
  echo '</tr>'
  let counter=counter+1
done <<< "$allNames" # reads all names by lines not by words separated by empty character
  
