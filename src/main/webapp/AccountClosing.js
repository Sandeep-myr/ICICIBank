document.addEventListener("DOMContentLoaded", function () {
    const reasonDropdown = document.getElementById("reason");
    const otherReasonContainer = document.getElementById("otherReasonContainer");
  
    reasonDropdown.addEventListener("change", function () {
      if (reasonDropdown.value === "other") {
        otherReasonContainer.style.display = "block";
      } else {
        otherReasonContainer.style.display = "none";
      }
    });
  });
  