*** Variables ***
#for opening new account
${open_acc_link}  xpath=//a[@href="openaccount.htm"]
${select_acc_dropdown}  xpath=//select[@id="type"]
${select_type_dropdown}  xpath=//select[@id="fromAccountId"]
${open_new_acc_btn}   xpath=//input[@value="Open New Account"]
${acc_id}  xpath=//a[@id="newAccountId"]