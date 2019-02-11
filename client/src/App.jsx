import React from 'react';
import { Admin, Resource, ListGuesser } from 'react-admin';
import { VendorList } from './vendors'
import shippingApiDataProvider from './shippingApiDataProvider.jsx'

const dataProvider = shippingApiDataProvider('http://localhost:3001/api');

const App = () => (
    <Admin dataProvider={dataProvider}>
        <Resource name="vendors" list={VendorList} />
    </Admin>
);

export default App;
