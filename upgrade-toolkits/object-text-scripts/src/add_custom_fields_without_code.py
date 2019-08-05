"""
Example:
    python ./add_custom_fields_without_code.py -o ./NAV_2009_Standard_Tables.txt -m ./NAV_2009_Standard_Customized_Tables.txt -t ./NAV_2015_Standard_Tables.txt -r ./NAV_2015_Standard_Customized_Tables.txt
"""

import lib.nav_table_parser as ntp
from lib.models import Table, Field
import lib.nav_table_editor as nte

import argparse
from pathlib import Path

parser = argparse.ArgumentParser()
parser.add_argument('-o','--original',help='text file with original objects', required=True)
parser.add_argument('-m','--modified',help='text file with modified objects', required=True)
parser.add_argument('-t','--target',help='text file with target objects', required=True)
parser.add_argument('-r','--result',help='file name for result objects', required=True)
parser.add_argument('-v','--verbose',help='print messages')
args = parser.parse_args()

if not Path(args.original).exists():
    raise argparse.ArgumentTypeError("File {} was not found.".format(args.original))
if not Path(args.modified).exists():
    raise argparse.ArgumentTypeError("File {} was not found.".format(args.modified))
if not Path(args.target).exists():
    raise argparse.ArgumentTypeError("File {} was not found.".format(args.target))

orig_file = args.original
orig_tables = ntp.populate_table_list(orig_file)

modified_file = args.modified
modified_tables = ntp.populate_table_list(modified_file)

target_file = args.target
target_tables = ntp.populate_table_list(target_file)

result_file = args.result

mod_tables = []

KEEP_REGIONAL_FIELDS = True # range 10000..49000
KEEP_THIRD_PARTY_FIELDS = True
VERBOSE = args.verbose

print("Processing files ...")

for modified_table in modified_tables:
    original_table = next((x for x in orig_tables if x.id == modified_table.id), None)
    if not original_table:
        if VERBOSE:
            print("Skipping Table {0} {1} - not found in Standard 2009".format(modified_table.id,modified_table.name))
        continue
    
    target_table = next((x for x in target_tables if x.id == modified_table.id), None)
    if not target_table:
        if VERBOSE:
            print("Skipping Table {0} {1} - not found in Standard 2015".format(modified_table.id,modified_table.name))
        continue

    original_fields = original_table.get_fields()
    modified_fields = modified_table.get_fields()
    target_fields = target_table.get_fields()

    current_table = Table(original_table.id, original_table.name)
    found_missing_fields = False    

    for modified_field in modified_fields:        
        transfer_field = False

        original_field = next((x for x in original_fields if x.id == modified_field.id), None)
        target_field = next((x for x in target_fields if x.id == modified_field.id), None)

        if not original_field:                      
            if int(modified_field.id) < 9999:
                if VERBOSE:
                    print("Skipping Field {1} {2} (Table {0})".format(original_table.name, modified_field.id, modified_field.name))
                continue

            if 10000 <= int(modified_field.id) <= 49999:
                if not KEEP_REGIONAL_FIELDS:
                    if VERBOSE:
                        print("Skipping Regional Field {1} {2} (Table {0})".format(original_table.name, modified_field.id, modified_field.name))
                    continue

            transfer_field = True  
        else:
            if 10000 <= int(modified_field.id) <= 49999 and KEEP_REGIONAL_FIELDS:
                transfer_field = True
                #print("Keeping table {} regional field {} {}.".format(curr_table.name, mod9f.id, mod9f.name))    

            if 49999 < int(modified_field.id) < 99000000:
                if KEEP_THIRD_PARTY_FIELDS:
                    transfer_field = True
                else:
                    print("! Check if table {} partner field {} {} needs to be transferred.".format(current_table.name, modified_field.id, modified_field.name))                    

        if transfer_field:
            if target_field:
                print("!!! Table {} field {} {} exists! Not added to the result file.".format(current_table.name, target_field.id, target_field.name))
                continue
                
            field_name = modified_field.name
            while next((x for x in target_fields if x.name == field_name), None):
                field_name += '1'
                print("! Table {} field {} {} exists, added as {}".format(current_table.name, modified_field.id, modified_field.name, field_name))

            current_field = Field(modified_field.id, field_name, modified_field.data_type)
            if hasattr(modified_field, 'option_string'):
                current_field.option_string = modified_field.option_string
               
            current_table.add_field(current_field)
            found_missing_fields = True
            
    if found_missing_fields:
        mod_tables.append(current_table)

if VERBOSE:
    for t in mod_tables:
        print("Transfering fields in {0} {1}".format(t.id,t.name))

print("Creating file {} ...".format(result_file))
nte.create_mod_file(target_file,result_file,mod_tables)
print("Done.")