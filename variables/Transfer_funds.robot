*** Variables ***
${transfer_funds_link}  xpath=//a[@href="transfer.htm"]
${amount_box}  xpath=//input[@id="amount"]
${from_acc_dropdown}  xpath=//select[@id="fromAccountId"]
${to_acc_dropdown}  xpath=//select[@id="toAccountId"]
${transfer_btn}  xpath=//input[@value="Transfer"]

#trnsfer funds verification
${amount_transferred}  xpath=//span[@id="amountResult"]
${from_acc_transferred}  xpath=//span[@id="fromAccountIdResult"]
${to_acc_transferred}  xpath=//span[@id="toAccountIdResult"]