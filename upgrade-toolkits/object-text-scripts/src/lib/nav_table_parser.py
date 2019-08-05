from .models import Table, Field

import re

option_string_pattern = r'OptionString=(?P<value>.*)(;|(\s\}))'
option_string_re = re.compile(option_string_pattern)

def populate_table_list(filename):
    tables = []
    current_table = None
    current_field = None
    
    in_table_block = False
    in_fields_block = False
    with open(filename, 'r') as f:
        for line in f:
            
            if line.startswith('OBJECT Table'):
                table_id, table_name =  line.split()[2], ' '.join(line.split()[3:])
                current_table = Table(table_id, table_name)
                in_table_block = True
                continue

            if not in_table_block:
                continue
            else:
                if line.startswith('}'): #end of object
                    tables.append(current_table)
                    in_table_block = False
                    continue

            if line[0:8] == '  FIELDS':
                in_fields_block = True
            if in_fields_block:              
                if line[0:3] == '  }': # end of fields
                    if current_field:
                        current_table.add_field(current_field)
                        current_field = None
                    in_fields_block = False
                    continue

                first_field_line = line.startswith('    {')
                if first_field_line: 
                    if current_field:
                        current_table.add_field(current_field)
                        current_field = None

                    if line.endswith(" }\n"):
                        main_field_props = line[5:-2].split(';')
                        current_field = Field(main_field_props[0].strip(), main_field_props[2].strip(), main_field_props[3].strip())                        
                    else:
                        main_field_props = line[5:].split(';')
                        current_field = Field(main_field_props[0].strip(), main_field_props[2].strip(), main_field_props[3].strip())

                if current_field:
                    match = option_string_re.search(line)
                    if match:
                        current_field.option_string = match.group('value')                      
                        
    
    return tables