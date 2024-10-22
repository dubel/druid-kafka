#!/bin/bash

if [ -z "$1" ]; then
  echo "Usage: $0 <number_of_records>"
  exit 1
fi

num_records=$1

names=("John Doe" "Jane Smith" "Alice Johnson" "Robert Brown" "Emily Davis" "Michael Lee" "Laura Kim" "William Turner" "Sophia Martinez" "James Wilson")
cities=("New York" "Los Angeles" "San Francisco" "Seattle" "Chicago" "Houston" "Miami" "Denver" "Boston" "Phoenix")
occupations=("Software Engineer" "Data Scientist" "Product Manager" "DevOps Engineer" "UX Designer" "Sales Manager" "Marketing Specialist" "CTO" "Graphic Designer" "Financial Analyst")
marital_statuses=("Single" "Married")

generate_random_time() {
  # # Generate a random number of days and seconds
  # random_days=$((RANDOM % 30))   # Random days between 0 and 29
  # random_seconds=$((RANDOM % 86400)) # Random seconds in a day (0-86399)

  # # Get the current date and subtract the random days and seconds
  # random_date=$(date -u -j -v-"$random_days"d -v-"$random_seconds"s +"%Y-%m-%dT%H:%M:%SZ")
  # echo "$random_date"
  echo "2021-05-06T13:02:00.200Z"
}

echo "["

for (( i=1; i<=num_records; i++ ))
do
  name="${names[$RANDOM % ${#names[@]}]}"
  city="${cities[$RANDOM % ${#cities[@]}]}"
  occupation="${occupations[$RANDOM % ${#occupations[@]}]}"
  marital_status="${marital_statuses[$RANDOM % ${#marital_statuses[@]}]}"

  age=$((RANDOM % 40 + 20))
  salary=$((RANDOM % 80000 + 50000))

  time=$(generate_random_time)

  echo "  {"
  echo "    \"time\": \"$time\","
  echo "    \"name\": \"$name\","
  echo "    \"city\": \"$city\","
  echo "    \"age\": $age,"
  echo "    \"salary\": $salary,"
  echo "    \"occupation\": \"$occupation\","
  echo "    \"marital_status\": \"$marital_status\""

  if [ $i -lt $num_records ]; then
    echo "  },"
  else
    echo "  }"
  fi
done

echo "]"
