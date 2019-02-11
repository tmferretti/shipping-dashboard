import React from 'react';
import { List, Datagrid, TextField } from 'react-admin';

export const VendorList = props => (
    <List {...props}>
        <Datagrid rowClick="edit">
            <TextField source="id" />
            <TextField source="name" />
            <TextField source="industry" />
            <TextField source="logo" />
        </Datagrid>
    </List>
);