"""
A script to set aliasColors in a Grafana dashboard JSON file.

The script is currently set up to set predefined colour mappings for VOs and
Sites on the IRIS Accounting dashboard. Use Hex codes to avoid issues with pie
charts.

Usage: 'python colourmapper.py'
(need to set JSON filepath below)
"""

import json
import os

# Enter the filepath for the JSON file you want to edit
filepath = 'dashboard.json'

def main():
    """
    Update the desired JSON file with predefined colors
    """
    with open(filepath, 'r+') as f:
        data = json.load(f)

        for i in range(len(data['panels'])): # cycle through panels in JSON file
            data['panels'][i]['aliasColors'] = {"lsst": "#B9D7ED", \
                                                "lz": "#e61263", \
                                                "skatelescope.eu": "#DCB9ED", \
                                                "dune": "#8F2323", \
                                                "vo.cta.in2p3.fr": "#23628F", \
                                                "virgo": "#8F6A23", \
                                                "ISIS": "#4F8F23", \
                                                "Diamond": "#737373", \
                                                "CLF": "#FF00AA", \
                                                "CCFE": "#469990", \
                                                "EUCLID": "#bfef45", \
                                                "AENEAS": "#f58231", \
                                                "eMERLIN": "#ffd8b1", \
                                                "LSST": "#8bbaf0", \
                                                \
                                                "ral-cloud": "#E02F44", \
                                                "UKI-LT2-IC-HEP": "#FFF899", \
                                                "UKI-NORTHGRID-MAN-HEP": "#00EAFF", \
                                                "RAL-LCG2": "#AA00FF", \
                                                "UKI-LT2-QMUL": "#FF7F00",\
                                                "UKI-NORTHGRID-LIV-HEP": "#BFFF00", \
                                                "UKI-SCOTGRID-ECDF": "#0095FF", \
                                                "UKI-SOUTHGRID-RALPP": "#4F8F23", \
                                                "UKI-SOUTHGRID-OX-HEP": "#6B238F", \
                                                "UKI-NORTHGRID-SHEF-HEP": "#FFD400", \
                                                "UKI-SOUTHGRID-BRIS-HEP": "#6AFF00", \
                                                "UKI-NORTHGRID-LANCS-HEP": "#EDB9B9", \
                                                "UKI-LT2-Brunel": "#aaffc3", \
                                                "UKI-SCOTGRID-GLASGOW": "#000075", \
                                                "UKI-SOUTHGRID-BHAM-HEP": "#f032e6", \
                                                "UKI-SOUTHGRID-CAM-HEP": "#808000", \
                                                "UKI-LT2-RHUL": "#800000"
                                                }
        f.seek(0) # overwrite the beginning of the file
        json.dump(data, f, indent=4) # write
        f.truncate() # needed if new data is smaller than previous

if __name__ == '__main__':
    main()
