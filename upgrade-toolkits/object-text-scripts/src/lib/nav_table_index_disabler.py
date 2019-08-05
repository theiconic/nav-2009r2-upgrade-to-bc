import re

#MaintainSQLIndex=No
maintain_sql_index_pattern = r'MaintainSQLIndex=(?P<val>(Yes|No))'
sql_index_re = re.compile(maintain_sql_index_pattern,re.MULTILINE)

#MaintainSIFTIndex=No
maintain_sift_index_pattern = r'MaintainSIFTIndex=(?P<val>(Yes|No))'
sift_index_re = re.compile(maintain_sift_index_pattern,re.MULTILINE)


def disable_indexes(orig_filename, new_filename, debug=False):
    """Method disables indexes on the SQL Server level."""

    in_table_block = False
    in_keys_block = False
    lines = ''
    keys = []
    key = ''
    with open(orig_filename, 'r') as f:
        for line in f:
            
            if line.startswith('OBJECT Table'):
                #table_id, table_name =  line.split()[2], ' '.join(line.split()[3:])
                #current_table = Table(table_id, table_name)
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

            if line == '  KEYS\n':
                in_keys_block = True
                keys = []
                key = ''

                lines += line
                continue
            
            if line[0:3] == '  {': # start of block
                lines += line
                continue 

            if line[0:3] == '  }': # end of block

                if in_keys_block:
                    if key != '':
                        keys.append(key)
                    key = ''

                    in_keys_block = False
                    
                    #leave only the first key enabled
                    keys = get_keys_disabled_in_sql(keys)                    
                    for key in keys:
                        lines += key

                    lines += line
                    continue

                lines += line
                continue

            if in_keys_block:
                if line.startswith('    {'): # key block                    
                    if key != '':
                        keys.append(key)
                    key = line
                else:
                    key += line
                continue                          

            if not in_keys_block:
                lines += line                    
                    
    with open(new_filename, 'w') as f:
        f.write(lines)


def get_keys_disabled_in_sql(keys, debug=False):

    result_keys = []

    for idx, key in enumerate(keys):
        if debug:
            print("key {0}: {1}".format(idx, key))    

        if idx == 0: 
            result_keys += key  
            if debug:
                print("Primary Key")                 
            continue #leave the first key - PK    

        key = disable_sql_key(key)
        key = disable_sift_key(key)

        if debug:
            print("key {0}: {1}".format(idx, key))  

        result_keys += key

    return result_keys


def disable_sql_key(key):

    result_key = key
    sql_index_disabled = False

    sql_index_match = sql_index_re.search(key)
    if sql_index_match:
        v = str(sql_index_match.group('val')).lower()
        if v == 'no':
            sql_index_disabled = True
    
    if not sql_index_disabled:
        maintain_sql_text = 'MaintainSQLIndex=No'
        result_key = key[:-2] + '\n' + ' ' * 51 + ';' + maintain_sql_text + key[-2:]

    return result_key  


def disable_sift_key(key):

    result_key = key
    sift_index_disabled = False

    sift_index_match = sift_index_re.search(key)
    if sift_index_match:
        v = str(sift_index_match.group('val')).lower()
        if v == 'no':
            sift_index_disabled = True

    if not sift_index_disabled:
        maintain_sift_text = 'MaintainSIFTIndex=No'
        result_key = key[:-2] + '\n' + ' ' * 51 + ';' + maintain_sift_text + key[-2:]

    return result_key   

