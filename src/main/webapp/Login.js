var captcha = generateCaptcha();
var captchaInput = document.querySelector('.captcha-input');
var refreshSymbol = document.querySelector('.captcha-symbol');
var refreshSymbol1 = document.querySelector('.captcha-symbol1');
var form = document.querySelector('form'); // Reference to the form element

// Function to generate a random captcha
function generateCaptcha() {
  return Math.floor(Math.random() * 100000);
}

// Function to refresh captcha and update the UI
function refreshCaptcha() {
  captcha = generateCaptcha();
  refreshSymbol.textContent = captcha;
}

refreshCaptcha();

// Event listener for refresh captcha symbol click
refreshSymbol1.addEventListener('click', function() {
  refreshCaptcha();
});

// Event listener for form submission
// You can add your own logic to validate the captcha
// For demonstration, we're checking if the captcha input matches the generated captcha
// You should implement more secure validation in a real application
form.addEventListener('submit', function(event) {
  event.preventDefault();
  var enteredCaptcha = captchaInput.value;

  if (enteredCaptcha === captcha.toString()) {
    // If captcha matches, submit the form to your servlet
    form.action = 'BankLogin'; // Replace with the actual URL of your servlet
    form.submit(); // Submit the form
  } else {
    alert('Invalid captcha. Please try again.');
    refreshCaptcha();
  }
});
