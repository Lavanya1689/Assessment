import { LightningElement, api, wire } from 'lwc';
import getAccountDetails from '@salesforce/apex/AccountController.getAccountDetails';

export default class AccountDetails extends LightningElement {
    @api accountId;
    account;

    @wire(getAccountDetails, {accId: '$accountId'}) 
    account({error, data}){
        if(data){            
            this.account = data;
            console.log('acc data:'+JSON.stringify(this.account))
        }
    }


    back(){
        const selectEvent = new CustomEvent('goback', {
            detail: true
        });
        this.dispatchEvent(selectEvent);
    }


}