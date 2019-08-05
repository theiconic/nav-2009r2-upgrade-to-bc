from .models import Table, Field

def generate_field_object_line(field):
    if field.data_type == 'Option':
        option_string = ";OptionString={}".format(field.option_string)
    else:
        option_string = ''
    return "    {0} {1};;{2};{3}{4} {5}".format("{",field.id, field.name, field.data_type, option_string, "}")


def create_mod_file(orig_filename, mod_filename, tables):
    
    in_table_block = False
    in_fields_block = False
    lines = ''
    with open(orig_filename, 'r') as f:
        for line in f:
            
            if line.startswith('OBJECT Table'):
                table_id, table_name =  line.split()[2], ' '.join(line.split()[3:])
                current_table = Table(table_id, table_name)
                in_table_block = True
                lines += line
                continue

            if not in_table_block:
                lines += line
                continue
            else:
                if line.startswith('}'): #end of object
                    tables.append(current_table)
                    in_table_block = False
                    lines += line
                    continue

            if line[0:8] == '  FIELDS':
                in_fields_block = True

            if in_fields_block: 
                if line[0:3] == '  }': # end of fields
                    in_fields_block = False
                    t = next((x for x in tables if x.id == current_table.id), None)
                    if t:
                        for f in t.get_fields():
                            lines += generate_field_object_line(f) + "\n"
            
            lines += line
                    
    with open(mod_filename, 'w') as f:
        f.write(lines)


def create_file_without_code(orig_filename, new_filename, tables):
    """Method removes code from table objects."""

    in_table_block = False
    in_fields_block = False
    in_code_block = False
    in_properties_block = False
    lines = ''
    with open(orig_filename, 'r') as f:
        for line in f:
            
            if line.startswith('OBJECT Table'):
                table_id, table_name =  line.split()[2], ' '.join(line.split()[3:])
                current_table = Table(table_id, table_name)
                in_table_block = True
                lines += line
                continue

            if line.startswith('{'): # start of object
                lines += line
                continue 

            if not in_table_block:
                lines += line
                continue
            else:
                if line.startswith('}'): #end of object
                    in_table_block = False
                    lines += line
                    continue

            if line == '  FIELDS\n':
                in_fields_block = True
                lines += line
                continue
            
            if line == '  CODE\n':
                in_code_block = True
                lines += line
                continue

            if line == '  PROPERTIES\n':
                in_properties_block = True
                lines += line
                continue            
        
            if line[0:3] == '  {': # start of block
                lines += line
                continue 

            if line[0:3] == '  }': # end of block

                if in_fields_block:
                    in_fields_block = False
                    t = next((x for x in tables if x.id == current_table.id), None)
                    if t:
                        for f in t.get_fields():
                            lines += generate_field_object_line(f) + "\n"
                    else:
                        print("Error: table {} {} wasn't found in tables provided.".format(current_table.id, current_table.name))
                    lines += line
                    continue

                if in_code_block:
                    in_code_block = False
                    lines += '    BEGIN\n'
                    lines += '    END.\n'
                    lines += line
                    continue

                if in_properties_block:
                    in_properties_block = False
                    lines += line
                    continue
                
                lines += line
                continue

            if not in_fields_block and not in_code_block and not in_properties_block:
                lines += line                    
                    
    with open(new_filename, 'w') as f:
        f.write(lines)
