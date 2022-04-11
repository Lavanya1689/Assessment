import { LightningElement, api } from 'lwc';

export default class AccountListItem extends LightningElement {
    @api account;
    @api selected;

    handleClick(event) {
        this.dispatchEvent(new CustomEvent('select', {
            detail: this.account.Id
        }));
    }

    get divClass() {
        let cls = 'slds-p-around_small'
        if (this.selected) {
            cls += ' slds-theme_inverse';
        } 
        return cls;
    }
}