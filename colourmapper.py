"""
A script to set aliasColors in a Grafana dashboard JSON file.

The script is currently set up to set predefined colour mappings for VOs and
Sites on the IRIS Accounting dashboard. Use Hex codes to avoid issues with pie
charts.

Usage: 'python colourmapper.py filepath'
"""

import json
import os
import argparse
import configparser

# retrieve config
configParser = configparser.RawConfigParser()
configFilePath = 'colourmapper.ini'
configParser.read(configFilePath)
aliasColors = configParser.get('Colours', 'aliasColors')

# retrieve argument (filepath)
parser = argparse.ArgumentParser()
parser.add_argument("filepath", help="filepath of JSON file that will be edited")
args = parser.parse_args()

def main():
    """
    Update the desired JSON file with predefined colors
    """
    filename = args.filepath[:-5] # get filename
    newPath = filename + str(os.getpid()) + '.json' # create a distinct name for the new file
    with open(args.filepath, 'r') as reader, open(newPath, 'w') as writer:
        # open the existing file as read only, and write a new file
        data = json.load(reader) # load file into data variable

        for i in range(len(data['panels'])): # cycle through panels in JSON file
            data['panels'][i]['aliasColors'] = aliasColors

        json.dump(data, writer, indent=4) # write to new file
    os.replace(newPath, args.filepath) # replace new file with original

if __name__ == '__main__':
    main()
