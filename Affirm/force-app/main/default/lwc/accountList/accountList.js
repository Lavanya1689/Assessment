import { LightningElement, wire } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';

export default class AccountList extends LightningElement {
    selectedAccountId;
    showDetails;
    showList = true;
    macase;
    selected;
    mouseIsOver;
    showSpinner;

    @wire(getAccountList) accounts;

    handleSelect(event) {
        this.selectedAccountId = event.detail;
        console.log('selectedAccountId:'+this.selectedAccountId);
        this.template.querySelectorAll('c-account-list-item').forEach(item => {
            if (item.account.Id === this.selectedAccountId) {
                item['selected'] = true;
            } else {
                item['selected'] = false;
            }
        });
    }

    next(){
        console.log('selectedAccountId:'+this.selectedAccountId);
        this.showList = false;
        this.showDetails = true;
        this.showSpinner = true;
    }

    handleGoBack(event){
        this.showList = event.detail;
        this.showDetails =  false;
        this.showSpinner = false;
    }
}