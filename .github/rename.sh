#!/bin/bash

# Exit on error
set -e

# Get the new name from the first argument
NEW_NAME="$1"

# Validate input
if [ -z "$NEW_NAME" ]; then
  echo "Error: No new name provided."
  echo "Usage: $0 <new_name>"
  exit 1
fi

# Extract only the repository name (remove owner/ if present)
NEW_NAME=$(basename "$NEW_NAME")

# Define old names to replace
OLD_NAME_LOWER="legged_template_controller"
OLD_NAME_CAMEL="TemplateController"

# Convert NEW_NAME to CamelCase for OLD_NAME_CAMEL replacement
NEW_NAME_CAMEL=$(echo "$NEW_NAME" | sed -r 's/(^|_)([a-z])/\U\2/g')

# Rename directories and files using git mv
find . -depth -name "*${OLD_NAME_LOWER}*" | while read -r path; do
  new_path=$(echo "$path" | sed "s/${OLD_NAME_LOWER}/${NEW_NAME}/g")
  git mv "$path" "$new_path"
done

find . -depth -name "*${OLD_NAME_CAMEL}*" | while read -r path; do
  new_path=$(echo "$path" | sed "s/${OLD_NAME_CAMEL}/${NEW_NAME_CAMEL}/g")
  git mv "$path" "$new_path"
done

# Replace text inside files
find . -type f \( -name "*.txt" -o -name "*.cpp" -o -name "*.h" -o -name "*.xml" \) | while read -r file; do
  sed -i "s/${OLD_NAME_LOWER}/${NEW_NAME}/g" "$file"
  sed -i "s/${OLD_NAME_CAMEL}/${NEW_NAME_CAMEL}/g" "$file"
done

echo "Renaming completed successfully!"
