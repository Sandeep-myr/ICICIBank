// Function to update the total and denomination
function updateTotal() {
    let total = 0;
  
    const rows = document.querySelectorAll('.user-entry table tr');
    rows.forEach(row => {
      const thId = row.querySelector('th').getAttribute('id');
      const inputValue = parseFloat(row.querySelector('input').value);
  
      if (!isNaN(inputValue)) {
        if (thId === 'th-500') {
          total += inputValue * 500;
        } else if (thId === 'th-200') {
          total += inputValue * 200;
        } else if (thId === 'th-100') {
          total += inputValue * 100;
        } else if (thId === 'th-50') {
          total += inputValue * 50;
        } else if (thId === 'th-20') {
          total += inputValue * 20;
        } else if (thId === 'th-10') {
          total += inputValue * 10;
        } else if (thId === 'th-5') {
          total += inputValue * 5;
        } else if (thId === 'th-2') {
          total += inputValue * 2;
        } else if (thId === 'th-1') {
          total += inputValue;
        }
      }
    });
  
    const totalInput = document.querySelector('input[name="total"]');
    totalInput.value = total.toFixed(2);
  
    const denominationInput = document.querySelector('input[name="denomination"]');
    denominationInput.value = total.toFixed(2);
  }
  
  // Attach event listeners to input fields
  const inputFields = document.querySelectorAll('.user-entry input[type="text"]');
  inputFields.forEach(inputField => {
    inputField.addEventListener('input', updateTotal);
  });
  
  // Initial update
  updateTotal();
  