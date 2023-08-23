function handleTransactionTypeChange() {
    var transactionType = document.getElementById("transaction-type").value;
    var payeeNameInput = document.getElementById("payee-name");

    if (transactionType === "self") {
        payeeNameInput.value = "Self";
        payeeNameInput.readOnly = true;
    } else {
        payeeNameInput.value = "";
        payeeNameInput.readOnly = false;
    }
}
