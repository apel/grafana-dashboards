"""
A script to set aliasColors in a Grafana dashboard JSON file.

The script is currently set up to set predefined colour mappings for VOs and
Sites on the IRIS Accounting dashboard. Use Hex codes to avoid issues with pie
charts.

Usage: 'python colourmapper.py [filepath]'
"""

import json
import os
import argparse
import configparser

# retrieve config
config_parser = configparser.RawConfigParser()
config_parser.optionxform = str
config_file_path = 'colourmapper.ini'
config_parser.read(config_file_path)
alias_colors = dict(config_parser.items('Colours'))

# parse the commandline arguments to retrieve filepath
parser = argparse.ArgumentParser()
parser.add_argument("filepath", help="filepath of JSON file that will be edited")
args = parser.parse_args()


def create_override_dict(name, code):
    """
    This function is called during a loop over all mappings in colourmapper.ini
    This creates a long dictionary that will go into the "overrides" parts of the JSON files
    """
    return {
        "matcher": {
            "id": "byName",
            "options": name
        },
        "properties": [
            {
                "id": "color",
                "value": {
                    "fixedColor": code,
                    "mode": "fixed"
                }
            }
        ]
    }

override_list = []
for name, code in alias_colors.items():
    override_list.append(create_override_dict(name, code))


def main():
    """Update the desired JSON file with predefined colors."""
    filename = args.filepath[:-5]  # get filename
    new_path = filename + str(os.getpid()) + '.json'  # create a distinct name for the new file
    with open(args.filepath, 'r') as reader, open(new_path, 'w') as writer:
        # open the existing file as read only, and write a new file
        data = json.load(reader)  # load file into data variable

        for i in range(len(data['panels'])):  # cycle through panels in JSON file
            # uses two different methods of colour mapping (aliasColours and overrides)
            # as grafana needs both on the JSON to display all colours
            data['panels'][i]['aliasColors'] = alias_colors
            try:
                data['panels'][i]['fieldConfig']['overrides'] = override_list
            except KeyError:
                pass

        json.dump(data, writer, indent=2, sort_keys=True)  # write to new file
    os.replace(new_path, args.filepath)  # replace original file with new file


if __name__ == '__main__':
    main()
