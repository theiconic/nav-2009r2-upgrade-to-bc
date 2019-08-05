import re

class Table:

    def __init__(self, id, name):
        self.id = id
        self.name = name
        self.sql_name = re.sub(r'[\.\\\/]','_',self.name)
        self.fields = []

    def add_field(self, field):
        self.fields.append(field)
    
    def get_fields(self):
        return self.fields

    def __str__(self):
        fields_str = "\n"
        for f in self.fields:
            fields_str += "    %s\n" % f.__str__()
        return "Table {\n id: %s,\n name: %s, sql_name: %s,\n fields: { %s }\n}" % (self.id, self.name, self.sql_name, fields_str)

   

class Field:
    
    def __init__(self, id, name, data_type, state='',state_reason=''):
        self.id = id
        self.name = name
        self.sql_name = re.sub(r'[\.\\\/]','_',self.name)
        self.data_type = data_type
        self.state = state
        self.state_reason = state_reason
    
    def __str__(self):
        return "{ id: %s, name: %s, type: %s, state: %s, state_reason: %s }" % (self.id, self.name, self.data_type, self.state, self.state_reason)
    
class Comparison:    

    def __init__(self, table_id, table_id_bc, table_name, table_name_bc, field_id='', field_id_bc='', field_name='', field_name_bc='', data_type='', data_type_bc='', field_state='', field_state_reason=''):
        self.table_id = table_id
        self.table_id_bc = table_id_bc
        self.table_name = table_name
        self.table_name_bc = table_name_bc
        self.field_id = field_id
        self.field_id_bc = field_id_bc
        self.field_name = field_name
        self.field_name_bc = field_name_bc
        self.data_type = data_type
        self.data_type_bc = data_type_bc
        self.field_state = field_state
        self.field_state_reason = field_state_reason


