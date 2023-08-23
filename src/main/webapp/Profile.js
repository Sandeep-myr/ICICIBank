document.addEventListener("DOMContentLoaded", function() {
    const downloadIcon = document.getElementById("downloadIcon");
    const printIcon = document.getElementById("printIcon");
    
    downloadIcon.addEventListener("click", function() {
        // Add code to handle download functionality here
        alert("Download functionality will be implemented here.");
    });
    
    printIcon.addEventListener("click", function() {
        // Add code to handle print functionality here
        window.print();
    });
});
