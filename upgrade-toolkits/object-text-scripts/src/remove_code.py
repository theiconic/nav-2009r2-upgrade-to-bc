"""
Example:
    python ./remove_code.py -o ./NotCompiledTables2015.txt
"""

import os

import lib.nav_table_parser as ntp
from lib.models import Table, Field
import lib.nav_table_editor as nte

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
    result_file = file_name + '_Without_Code' + file_extention 

print("Processing file {} ...".format(original_file))
original_tables = ntp.populate_table_list(original_file)

print("Creating file {} ...".format(result_file))
nte.create_file_without_code(original_file, result_file, original_tables)
print("Done.")