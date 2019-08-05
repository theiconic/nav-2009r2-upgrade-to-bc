"""
Example:
    python ./disable_indexes.py -o ./NAV_2015_Standard_Customized_Tables.txt -r ./NAV_2015_Standard_Customized_Tables_Disabled_Indexes.txt
    python ./disable_indexes.py -o ./NAV_2015_Standard_Customized_Tables.txt 
"""

import os

import lib.nav_table_index_disabler as ntid

import argparse
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument('-o','--original',help='original text file', required=True)
parser.add_argument('-r','--result',help='file name for result')
args = parser.parse_args()

if not Path(args.original).exists():
    raise argparse.ArgumentTypeError("File {} was not found.".format(args.original))

original_file = args.original

if args.result:
    result_file = args.result
else:
    (file_name, file_extention) = os.path.splitext(original_file)
    result_file = file_name + '_Disabled_Indexes' + file_extention 

print("Creating file {} ...".format(result_file))
ntid.disable_indexes(original_file, result_file)
print("Done.")


