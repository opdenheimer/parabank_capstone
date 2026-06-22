*** Variables ***
# for invalid transfer
${transfer_funds_link}  xpath=//a[@href="transfer.htm"]
${amount_box}  xpath=//input[@id="amount"]
${from_acc_dropdown}  xpath=//select[@id="fromAccountId"]
${to_acc_dropdown}  xpath=//select[@id="toAccountId"]
${transfer_btn}  xpath=//input[@value="Transfer"]
