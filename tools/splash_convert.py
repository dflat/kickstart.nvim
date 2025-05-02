#!/usr/bin/env python3
import sys
import re

def convert_echo_to_lua(echo_lines):
    # Initialize output list
    lua_lines = ["{"]

    # Process each line
    for line in echo_lines:
        # Strip whitespace and ensure it's an echo command
        line = line.strip()
        if not line.startswith('echo'):
            continue  # Skip non-echo lines

        # Extract content inside quotes (handles both single and double quotes)
        match = re.match(r'echo\s*(?:"|\')(.*?)(?:"|\')\s*;?', line)
        if match:
            content = match.group(1)
        else:
            # Handle empty echo commands (e.g., echo "" or echo '')
            content = ""

        # Escape any ]] in content to avoid breaking Lua literals
        content = content.replace("]]", "]]..']]..[[")

        # Add content as a Lua literal
        lua_lines.append(f'  [[{content}]],')

    # Close the Lua table
    lua_lines.append("}")

    return lua_lines

def main():
    # Check if input is from a file or stdin
    input_lines = []
    if len(sys.argv) > 1:
        # Read from file
        try:
            with open(sys.argv[1], 'r') as file:
                input_lines = file.readlines()
        except FileNotFoundError:
            print(f"Error: File '{sys.argv[1]}' not found.")
            sys.exit(1)
    else:
        # Read from stdin
        input_lines = sys.stdin.readlines()

    # Convert the input
    result = convert_echo_to_lua(input_lines)

    # Print the output
    for line in result:
        print(line)

if __name__ == "__main__":
    main()
