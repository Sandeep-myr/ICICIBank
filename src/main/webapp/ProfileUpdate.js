document.addEventListener("DOMContentLoaded", function () {
    const flexItems = document.querySelectorAll(".flex-item");

    flexItems.forEach((item) => {
        const updateButton = item.querySelector(".update-button");
        const popup = item.querySelector(".popup");
        const updateForm = item.querySelector(".update-form");

        updateButton.addEventListener("click", (e) => {
            e.preventDefault();
            popup.classList.add("show");
        });

        updateForm.addEventListener("submit", (e) => {
            // Allow the default form submission
            // The form will be submitted to the servlet specified in the action attribute
        });
    });
});
